class scaleio_fuel::tb {

    class {'::scaleio':
          password => $admin_password,
          version => $version,
          mdm_ip => $mdm_ips,
          tb_ip => $tb_ip,
          sio_sds_device => $sio_sds_device,
          sds_ssd_env_flag => true,
          callhome_cfg => $callhome_cfg,
          components => ['tb','sds','sdc'],
    }
}
