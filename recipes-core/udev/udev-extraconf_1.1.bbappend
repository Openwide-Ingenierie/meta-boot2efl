FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LICENSES += "GPL-3.0"
LIC_FILES_CHKSUM += "file://${WORKDIR}/65-android.rules;beginline=4;endline=17;md5=534bfbe4a9959287b397927ee891ea85"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI += " \
    file://65-android.rules \
    file://50-firmware.rules \
    file://60-persistent-v4l.rules \
    file://platform-device \
    file://998-droid-system.rules \
"

do_install_append() {
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/65-android.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/50-firmware.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-v4l.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/platform-device ${D}${sysconfdir}/udev/
    install -m 0644 ${WORKDIR}/ ${D}${sysconfdir}/udev/998-droid-system.rules
}
