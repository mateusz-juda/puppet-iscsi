# == Class: iscsi::params
#
# Parameters for the iscsi puppet module.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# Copyright 2015-2016 John Florian


class iscsi::params {

    case $::operatingsystem {

        'Fedora': {

            $initiator_packages = 'iscsi-initiator-utils'
            $initiator_services = 'iscsid'

            $target_packages = 'scsi-target-utils'
            $target_services = 'tgtd'

        }

        'Debian': {

            $initiator_packages = 'open-iscsi'
            $initiator_services = 'open-iscsi'

            $target_packages = 'tgt'
            $target_services = 'tgt'

        }
        default: {
            fail ("${title}: operating system '${::operatingsystem}' is not supported")
        }

    }

}
