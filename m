From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v3 0/6] drivers: fsi: Add SBEFIFO and OCC drivers
Date: Fri, 22 Sep 2017 16:05:56 -0500
Message-ID: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
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

Changes since v2:
 * Rename occ.c and occ.h to fsi-occ.c and fsi-occ.h
 * Improved remove() ordering in both drivers.
 * Added cancel functionality to OCC driver to make sure no xfrs started during
   remove().
 * Fix spin_unlock with spin_unlock_irq in OCC driver.
 * Fix list_first_entry with list_first_entry_or_null in OCC worker function.
 * Add OCC response definitions to OCC include file.
 * Handle probe() failures better.

Changes since v1:
 * Split bindings into separate patch and added SBEFIFO device binding
 * Fixed #includes
 * Fix SBEFIFO race condition between write() and poll_timer().
 * Followed Rob's suggestion to just create one platform device for hwmon
   driver, instead of using the device tree.
 * Also check for "command in progress" response from OCC and try a while

Edward A. James (6):
  dt-bindings: fsi: Add SBEFIFO documentation
  drivers: fsi: Add SBEFIFO FSI client device driver
  drivers: fsi: sbefifo: Add in-kernel API
  dt-bindings: fsi: Add OCC documentation
  drivers: fsi: Add On-Chip Controller (OCC) driver
  drivers: fsi: occ: Add in-kernel API

 .../devicetree/bindings/fsi/ibm,p9-occ.txt         |  15 +
 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt     |  20 +
 drivers/fsi/Kconfig                                |  17 +
 drivers/fsi/Makefile                               |   2 +
 drivers/fsi/fsi-occ.c                              | 851 ++++++++++++++++++
 drivers/fsi/fsi-sbefifo.c                          | 956 +++++++++++++++++++++
 include/linux/fsi-occ.h                            |  41 +
 include/linux/fsi-sbefifo.h                        |  30 +
 8 files changed, 1932 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
 create mode 100644 drivers/fsi/fsi-occ.c
 create mode 100644 drivers/fsi/fsi-sbefifo.c
 create mode 100644 include/linux/fsi-occ.h
 create mode 100644 include/linux/fsi-sbefifo.h

-- 
1.8.3.1
