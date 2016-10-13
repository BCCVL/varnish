node {

    // fetch source
    stage 'Checkout'

    checkout scm

    // build image
    stage 'Build'

    def imagename = 'hub.bccvl.org.au/bccvl/varnish'
    def img = docker.build(imagename)

    // publish image to registry
    stage 'Publish'

    def imagetag = rpm_version(img, 'varnish')
    img.push(imagetag)

    slackSend color: 'good', message: "New Image ${imagename}:${imagetag}\n${env.JOB_URL}"

}

def rpm_version(img, pkg) {

    def rpm_version

    img.inside() {
        sh("rpm -q --queryformat '%{VERSION}-%{RELEASE}' '${pkg}' > RPM_VERSION")
        rpm_version = readFile('RPM_VERSION')
    }

    return rpm_version
}
