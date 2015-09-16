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

    $controller_nodes = filter_nodes($nodes_hash,'role','controller')

    if $controller_nodes.length >= 4 {
        #TODO: assign nodes to ScaleIO roles. e.g. 1=>mdm1, 2=>mdm2, 3=>tb, 4=>gw, 5...=>sds
        $role = 'mdm'
    }
    else {
      fail("ScaleIO plugin needs at least 4 controller nodes")
    }

    #TODO: Populate $sio_sds_device with real information
    $sio_sds_device = Hash.new

    # $nodes_hash = $::fuel_settings['nodes']
    # $mdm_nodes = filter_nodes($nodes_hash,'role','scaleio-mdm')
    # $mdm_internal_addresses = nodes_to_hash($mdm_nodes,'name','internal_address')
    # $mdm_ips = ipsort(values($mdm_internal_addresses))
    #
    # $tb_nodes = filter_nodes($nodes_hash,'role','scaleio-tb')
    # $tb_internal_addresses = nodes_to_hash($tb_nodes,'name','internal_address')
    # $tb_ips = ipsort(values($tb_internal_addresses))
    #
    #
    # $sds_nodes = filter_nodes($nodes_hash,'role','scaleio-sds')
    # $sio_sds_device = Hash.new
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
