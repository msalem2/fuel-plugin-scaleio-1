$scaleio = hiera('scaleio')

$mdm_ip = ?

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

$sio_sdc_volume = {
  'volume1' => {
    'size_gb' => 8,
    'protection_domain' => 'protection_domain1',
    'storage_pool' => 'capacity',
    'sdc_ip' => [
        '192.168.50.11',
        '192.168.50.12',
        '192.168.50.13',
      ]
  },
}

$callhome_cfg = {
  'email_to' => "emailto@address.com",
  'email_from' => "emailfrom@address.com",
  'username' => "monitor_username",
  'password' => "monitor_password",
  'customer' => "customer_name",
  'smtp_host' => "smtp_host",
  'smtp_port' => "smtp_port",
  'smtp_user' => "smtp_user",
  'smtp_password' => "smtp_password",
  'severity' => "error",
}


class {'scaleio::params':
      password => $scaleio['password'],
      version => $scaleio['version'],
      mdm_ip => $mdm_ip,
      tb_ip => $tb_ip,
      cluster_name => $scaleio['cluster_name'],
      sio_sds_device => $sio_sds_device,
      sio_sdc_volume => $sio_sdc_volume,
      callhome_cfg => $callhome_cfg,
      components => ['mdm','sds','sdc','callhome'],
}
include scaleio
