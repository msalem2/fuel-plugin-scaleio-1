$scaleio = hiera('scaleio')
$roles = node_roles(hiera('nodes'), hiera('uid'))
$is_scaleio_role = member($roles, 'scaleio-gw') or member($roles, 'scaleio-tb') or member($roles, 'scaleio-mdm')

if $is_scaleio_role {
    class {'download_scaleio_rpms': }
}
