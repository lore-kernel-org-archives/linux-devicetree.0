From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v2 0/5] drivers/fsi: Add SBEFIFO and OCC drivers
Date: Wed,  5 Jul 2017 16:36:52 -0500
Message-ID: <1499290617-2598-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This series adds two FSI-based device drivers. The OCC driver is dependent on
the SBEFIFO driver, as a user of it's in-kernel API. The in-kernel API provided
by the OCC driver will be used by a hwmon driver (on the lkml as "Add On-Chip
Controller (OCC) hwmon driver").

Changes since v1:
 * Split bindings into separate patch and added SBEFIFO device binding
 * Fixed #includes
 * Fix SBEFIFO race condition between write() and poll_timer().
 * Followed Rob's suggestion to just create one platform device for hwmon
   driver, instead of using the device tree.
 * Also check for "command in progress" response from OCC and try a while

Edward A. James (5):
  drivers/fsi: Add SBEFIFO FSI client device driver
  drivers/fsi/sbefifo: Add in-kernel API
  drivers/fsi: Add On-Chip Controller (OCC) driver
  drivers/fsi/occ: Add in-kernel API
  Documentation/devicetree/bindings: Add FSI device documentation

 .../devicetree/bindings/fsi/ibm,p9-occ.txt         |  15 +
 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt     |  20 +
 drivers/fsi/Kconfig                                |  17 +
 drivers/fsi/Makefile                               |   2 +
 drivers/fsi/fsi-sbefifo.c                          | 932 +++++++++++++++++++++
 drivers/fsi/occ.c                                  | 803 ++++++++++++++++++
 include/linux/fsi-sbefifo.h                        |  30 +
 include/linux/occ.h                                |  41 +
 8 files changed, 1860 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
 create mode 100644 drivers/fsi/fsi-sbefifo.c
 create mode 100644 drivers/fsi/occ.c
 create mode 100644 include/linux/fsi-sbefifo.h
 create mode 100644 include/linux/occ.h

-- 
1.8.3.1
