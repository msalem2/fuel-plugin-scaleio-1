class scaleio_fuel::gateway
inherits scaleio_fuel::params {

    $scaleio = $::fuel_settings['scaleio']

    class {'scaleio::params':
          gw_password => $scaleio['gw_password'],
          version => $scaleio['version'],
          mdm_ip => $mdm_ip,
          components => ['gw'],
    }

    include scaleio

}
