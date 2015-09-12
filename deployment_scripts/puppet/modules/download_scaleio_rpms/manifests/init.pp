# ScaleIO Puppet Manifest for Downloading RPMS
class download_scaleio_rpms{

$scaleio_repo=$plugin_settings['scaleio_repo']
$version=$facts['operatingsystemmajrelease']
# Create scaleio temp directorys
file { [ "/tmp/scaleio/","/temp/scaleio/rpms" ]:
 ensure => "directory",
 }->
#Download unzip package
exec{"install_unzip":
 command => "/usr/bin/yum install unzip -y ",
 timeout => 1800,
 }->
#Download ScaleIO Zip First
exec { "download_scaleio_zip":
    command => "wget -O /tmp/scaleio_download.zip $scaleio_repo",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Check if file exists
file {'/tmp/scaleio_download.zip':
    ensure  => present,
    ensure  => file,
}->
#Install ScaleIO SDC package  
exec { "unzip_scaleio_files":
    command => "unzip -x /tmp/ScaleIO_Download.zip -d /tmp/scaleio/",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}->
#Copy EMC-ScaleIO-callhome rpm
exec {"Copy_EMC-ScaleIO-callhome":
    command => "cp /tmp/scaleio/ScaleIO_*_RHEL$version_Download/ScaleIO_*_RHEL$version_Download/EMC-ScaleIO-callhome*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-callhome.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
#Copy EMC-ScaleIO-lia rpm
exec {"Copy_EMC-ScaleIO-lia":
    command => "cp /tmp/scaleio/ScaleIO_*_RHEL$version_Download/ScaleIO_*_RHEL$version_Download/EMC-ScaleIO-lia*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-lia.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
#Copy EMC-ScaleIO-mdm rpm
exec {"Copy_EMC-ScaleIO-mdm":
    command => "cp /tmp/scaleio/ScaleIO_*_RHEL$version_Download/ScaleIO_*_RHEL$version_Download/EMC-ScaleIO-mdm*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-mdm.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
#Copy EMC-ScaleIO-tb rpm
exec {"Copy_EMC-ScaleIO-tb":
    command => "cp /tmp/scaleio/ScaleIO_*_RHEL$version_Download/ScaleIO_*_RHEL$version_Download/EMC-ScaleIO-tb*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-tb.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
#Copy EMC-ScaleIO-sds rpm
exec {"Copy_EMC-ScaleIO-sds":
    command => "cp /tmp/scaleio/ScaleIO_*_RHEL$version_Download/ScaleIO_*_RHEL$version_Download/EMC-ScaleIO-sds*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-sds.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
#Copy EMC-ScaleIO-sdc rpm
exec {"Copy_EMC-ScaleIO-sdc":
    command => "cp /tmp/scaleio/ScaleIO_*_RHEL$version_Download/ScaleIO_*_RHEL$version_Download/EMC-ScaleIO-sdc*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-sdc.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
#Copy EMC-ScaleIO-gateway rpm
exec {"Copy_EMC-ScaleIO-gateway":
    command => "cp /tmp/scaleio/ScaleIO_*_Gateway_for_Linux_Download/ScaleIO_*_Gateway_for_Linux_Download/EMC-ScaleIO-gateway*.rpm /tmp/scaleio/rpm/EMC-ScaleIO-gateway.rpm",
    path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
}
}
