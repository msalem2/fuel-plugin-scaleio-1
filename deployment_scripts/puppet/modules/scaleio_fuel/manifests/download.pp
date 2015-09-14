class scaleio_fuel::download {

    $version = $facts['operatingsystemmajrelease']

    $plugin_settings = hiera('scaleio')
    $scaleio_repo = $plugin_settings['scaleio_repo']

    #create temp folder
    file { [ "/tmp/scaleio/","/tmp/scaleio/rpms" ]:
         ensure => "directory",
          }->

    #Install unzip
    exec{"install_unzip":
          command  => "/usr/bin/yum install unzip -y ",
          timeout => 1800,
    }->

    #Download zip file
    exec{ "download_scaleio_zip":
         command => "wget -O /tmp/scaleio_download.zip $scaleio_repo",
         path    => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
         timeout => 1800,
         }->

    # unzip scaleio zip
    exec{ "unzip_scaleio_files":
           command  => "unzip -o /tmp/scaleio_download.zip -d /tmp/scaleio/",
           path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
    }->

    #Copy EMC-ScaleIO rpm files
    exec {"Copy_EMC-ScaleIO-rpms":
           command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/*.rpm /tmp/scaleio/rpms/.",
           path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
          }->

}
