class scaleio_fuel::params
{
    if $::osfamily != 'RedHat' {
        fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} currently only supports osfamily RedHat")
    }

    # Get input parameters from the web UI
    $scaleio          = $::fuel_settings['scaleio']
    $admin_password   = $scaleio['password']
    $gw_password      = $scaleio['gw_password']
    $version          = $scaleio['version']
    $cluster_name     = $scaleio['cluster_name']

    $nodes_hash = $::fuel_settings['nodes']
    $controller_nodes = concat(filter_nodes($nodes_hash,'role','primary-controller'), filter_nodes($nodes_hash,'role','controller'))
    $controller_internal_addresses = nodes_to_hash($controller_nodes,'name','internal_address')
    $controller_ips = ipsort(values($controller_internal_addresses))

    if size($controller_nodes) < 4 {
        fail('ScaleIO plugin needs at least 4 controller nodes')
    }

    $mdm_ips = [$controller_ips[0], $controller_ips[1]]
    $tb_ip = $controller_ips[2]
    $gw_ip = $controller_ips[3]

    $current_node = filter_nodes($nodes_hash,'role', $::fuel_settings['uid'])
    $current_node_ip = values(nodes_to_hash($current_node,'name','internal_address'))
    $node_ip = $current_node_ip[0]

    #TODO: refactor needed
    if $node_ip == $mdm_ips[0] {
        $role = 'mdm'
    }
    elsif $node_ip == $mdm_ips[1] {
        $role = 'mdm'
    }
    elsif $node_ip == $tb_ip {
        $role = 'tb'
    }
    elsif $node_ip == $gw_ip {
        $role = 'gw'
    }
    else {
        $role = 'sds'
    }

    notice("Node role: ${role}, IP: ${node_ip}")

    #TODO: Populate $sio_sds_device with real information
    $sio_sds_device = {}

    # $sds_nodes = filter_nodes($nodes_hash,'role','scaleio-sds')
    # for sds_node in $sds_nodes
    #   $sio_sds_device[:sds_node['name']] = Hash.new
    #   $sio_sds_device[:sds_node['name']]['ip'] = :sds_node.internal_address
    #   $sio_sds_device[:sds_node['name']]['protection_domain'] = 'protection_domain1'
    #   $sio_sds_device[:sds_node['name']]['devices'] = {
    #       '/var/sio_device1' => {  'size' => '100GB',
    #                                         'storage_pool' => 'capacity'
    #                                       },
    #     }
    # end


    #TODO: Get callhome information from UI
    $callhome_cfg = {
      'email_to'      => "emailto@address.com",
      'email_from'    => "emailfrom@address.com",
      'username'      => "monitor_username",
      'password'      => "monitor_password",
      'customer'      => "customer_name",
      'smtp_host'     => "smtp_host",
      'smtp_port'     => "smtp_port",
      'smtp_user'     => "smtp_user",
      'smtp_password' => "smtp_password",
      'severity'      => "error",
    }
}
