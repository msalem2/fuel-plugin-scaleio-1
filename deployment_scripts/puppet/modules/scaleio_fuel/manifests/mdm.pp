class scaleio_fuel::mdm
inherits scaleio_fuel::params {

    $scaleio = $::fuel_settings['scaleio']

    class {'scaleio::params':
          password => $scaleio['password'],
          version => $scaleio['version'],
          mdm_ip => $mdm_ips,
          tb_ip => $tb_ips,
          cluster_name => $scaleio['cluster_name'],
          sio_sds_device => $sio_sds_device,
          callhome_cfg => $callhome_cfg,
          components => ['mdm','sds','sdc','callhome'],
    }
    include scaleio
}
