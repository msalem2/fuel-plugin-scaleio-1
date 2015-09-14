$scaleio = hiera('scaleio')

include scaleio_fuel::download

$mdm_ip = '192.168.1.12'

class {'scaleio::params':
      gw_password => $scaleio['gw_password'],
      version => $scaleio['version'],
      mdm_ip => $mdm_ip,
      components => ['gw'],
}

include scaleio
