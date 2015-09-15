$scaleio = hiera('scaleio')

$mdm_ip = '192.168.1.12'

$sio_sds_device = {
  'tb.scaleio.local' => {
    'ip' => '192.168.50.11',
    'protection_domain' => 'protection_domain1',
    'devices' => {
      '/var/sio_device1' => {  'size' => '100GB',
                                        'storage_pool' => 'capacity'
                                      },
    }
  },
  'mdm1.scaleio.local' => {
    'ip' => '192.168.50.12',
    'protection_domain' => 'protection_domain1',
    'devices' => {
      '/var/sio_device1' => {  'size' => '100GB',
                                        'storage_pool' => 'capacity'
                                      },
    }
  },
  'mdm2.scaleio.local' => {
    'ip' => '192.168.50.13',
    'protection_domain' => 'protection_domain1',
    'devices' => {
      '/var/sio_device1' => {  'size' => '100GB',
                                        'storage_pool' => 'capacity'
                                      },
    }
  },
}

class {'::scaleio':
      password => $scaleio['password'],
      version => $scaleio['version'],
      mdm_ip => $mdm_ip,
      sio_sds_device => $sio_sds_device,
      sds_ssd_env_flag => true,
      components => ['sds','lia'],
}

include scaleio
