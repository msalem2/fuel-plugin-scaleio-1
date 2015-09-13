class download_scaleio_rpms {
$version=$facts['operatingsystemmajrelease']
$scaleio_repo=$plugin_settings['scaleio_repo']
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
       command  => "unzip -x /tmp/scaleio_download.zip -d /tmp/scaleio/",
       path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-callhome rpm
exec {"Copy_EMC-ScaleIO-callhome":
       command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/EMC-ScaleIO-callhome*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-callhome.rpm",
       path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      }->
#Copy EMC-ScaleIO-lia rpm
exec {"Copy_EMC-ScaleIO-lia":
      command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/EMC-ScaleIO-lia*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-lia.rpm",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-mdm rpm
exec {"Copy_EMC-ScaleIO-mdm":
      command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/EMC-ScaleIO-mdm*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-mdm.rpm",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-tb rpm
exec {"Copy_EMC-ScaleIO-tb":
      command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/EMC-ScaleIO-tb*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-tb.rpm",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-sds rpm
exec {"Copy_EMC-ScaleIO-sds":
      command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/EMC-ScaleIO-sds*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-sds.rpm",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-sdc rpm
exec {"Copy_EMC-ScaleIO-sdc":
      command  => "cp /tmp/scaleio/ScaleIO_*_RHEL${version}_Download/ScaleIO_*_RHEL${version}_Download/EMC-ScaleIO-sdc*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-sdc.rpm",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-gateway rpm
exec {"Copy_EMC-ScaleIO-gateway":
      command  => "cp /tmp/scaleio/ScaleIO_*_Gateway_for_Linux_Download/ScaleIO_*_Gateway_for_Linux_Download/EMC-ScaleIO-gateway*.rpm /tmp/scaleio/rpms/EMC-ScaleIO-gateway.rpm",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
}
