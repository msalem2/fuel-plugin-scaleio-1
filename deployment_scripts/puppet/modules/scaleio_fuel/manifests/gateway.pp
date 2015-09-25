class scaleio_fuel::gateway {

    class {'::scaleio':
          gw_password => $gw_password,
          version => $version,
          mdm_ip => $mdm_ips,
          components => ['gw'],
    }
}
