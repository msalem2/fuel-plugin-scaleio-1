$scaleio = hiera('scaleio')

$mdm_ip = ? 

class {'scaleio::params':
      gw_password => $scaleio['gw_password'],
      version => $scaleio['version'],
      mdm_ip => $mdm_ip,
      components => ['gw'],
}

include scaleio
