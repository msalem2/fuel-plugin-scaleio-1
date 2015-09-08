$scaleio = hiera('scaleio')

if $scaleio['metadata']['enabled'] {
    notice("Enable ScaleIO cluster integration in $deployment_mode")


} else {
    notice("Disable ScaleIO cluster integration")
}
