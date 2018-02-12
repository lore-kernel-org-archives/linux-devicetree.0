From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 00/10] FSI enhancements for v4.17
Date: Mon, 12 Feb 2018 15:45:39 +1030
Message-ID: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Greg,

Here is a set of FSI patches that we would like you to merge for 4.17.
These have been sitting in the OpenBMC tree for a while, and some had
been posted upstream for review in the past but not merged. That is to
say they have seen plenty of testing.

Cheers,

Joel

Christopher Bostic (3):
  fsi: core: Reduce console output during normal scan
  dt-bindings: fsi: Add optional property no-scan-on-init
  fsi: core: Add check for master property no-scan-on-init

Eddie James (1):
  fsi: Fix one and two byte bus reads/writes

Jeremy Kerr (6):
  fsi: Add fsi_master_rescan()
  fsi: master-gpio: Add locking during break and link enable
  fsi: master-gpio: Add external mode
  dt-bindings: fsi: Add specification for FSI busses
  fsi: Match fsi slaves and engines to available dt nodes
  fsi: master: Clarify master lifetimes & fix use-after-free in hub
    master

 .../ABI/testing/sysfs-driver-fsi-master-gpio       |  10 ++
 Documentation/devicetree/bindings/fsi/fsi.txt      | 151 +++++++++++++++++++++
 drivers/fsi/Kconfig                                |   1 +
 drivers/fsi/fsi-core.c                             | 129 ++++++++++++++++--
 drivers/fsi/fsi-master-gpio.c                      |  89 +++++++++++-
 drivers/fsi/fsi-master-hub.c                       |  27 +++-
 drivers/fsi/fsi-master.h                           |  17 +++
 7 files changed, 409 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-fsi-master-gpio
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt

-- 
2.15.1
