From: <atull@opensource.altera.com>
Subject: [PATCH v10 0/8] FPGA Manager Framework and Simple FPGA Bus
Date: Thu, 13 Aug 2015 12:37:23 -0500
Message-ID: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

This patch set adds two chunks plus documentation:
 * FPGA manager core: exports API functions that write an image to a FPGA
 * DT Overlay support: simple-fpga-bus to handle FPGA from a DT overlay

The FPGA manager core is mature enough to be in the regular kernel.

simple-fpga-bus is proposed for staging.

Changes from v9:
 * Move FPGA manager core to drivers/fpga
 * Move simple-fpga-bus to staging/simple-fpga-bus
 * add TODO
 * Improvements in fpga_manager_get/put (call module_try_get)
 * Add flags parameter to .write_complete ops as requested
 * Documentation improvements
 * Other minor cleanup

More info:

The core's API is minimal to start with: only 6 functions.  This gives a
manufacturer-agnostic interface for programming FPGA's such that higher
level interfaces (such as DT Overlays) can be shared.

The DT Overlays support exists for the usage where the FPGA will contain
some "hardware" that will need drivers.  Where that use model is not
appealing, the core API can be used to add a different interface.

The bindings for the socfpga FPGA manager already are upstreamed as
1b4e119 Alan Tull : doc: add bindings document for altera fpga manager

The core FPGA manager support is standalone.  The DT Overlays support
is dependent on Pantelis's dtc overlay patches from
https://github.com/pantoniou/dtc.git
and his DT overlays configfs interface patches and fixes from
https://github.com/pantoniou/linux-beagle-track-mainline

efb0c04 Pantelis Antoniou : gcl: Fix resource linking
85e785e Pantelis Antoniou : ARM: DT: Enable symbols when CONFIG_OF_OVERLAY is used
af0321f Pantelis Antoniou : OF: DT-Overlay configfs interface (v5)
4c1c675 Pantelis Antoniou : configfs: Implement binary attributes (v4)


Alan Tull (8):
  usage documentation for FPGA manager core
  fpga manager: add sysfs interface document
  add fpga manager core
  fpga manager: add driver for socfpga fpga manager
  staging: usage documentation for simple fpga bus
  staging: add bindings document for simple fpga bus
  staging: simple-fpga-bus: add TODO document
  staging: add simple-fpga-bus

 Documentation/ABI/testing/sysfs-class-fpga-manager |   37 ++
 Documentation/fpga/fpga-mgr.txt                    |  171 ++++++
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/fpga/Kconfig                               |   24 +
 drivers/fpga/Makefile                              |    9 +
 drivers/fpga/fpga-mgr.c                            |  381 ++++++++++++
 drivers/fpga/socfpga.c                             |  616 ++++++++++++++++++++
 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 .../Documentation/bindings/simple-fpga-bus.txt     |   83 +++
 .../Documentation/simple-fpga-bus.txt              |   58 ++
 drivers/staging/simple-fpga-bus/Kconfig            |   14 +
 drivers/staging/simple-fpga-bus/Makefile           |    5 +
 drivers/staging/simple-fpga-bus/TODO               |   13 +
 drivers/staging/simple-fpga-bus/simple-fpga-bus.c  |  330 +++++++++++
 include/linux/fpga/fpga-mgr.h                      |  127 ++++
 17 files changed, 1874 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
 create mode 100644 Documentation/fpga/fpga-mgr.txt
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 drivers/fpga/socfpga.c
 create mode 100644 drivers/staging/simple-fpga-bus/Documentation/bindings/simple-fpga-bus.txt
 create mode 100644 drivers/staging/simple-fpga-bus/Documentation/simple-fpga-bus.txt
 create mode 100644 drivers/staging/simple-fpga-bus/Kconfig
 create mode 100644 drivers/staging/simple-fpga-bus/Makefile
 create mode 100644 drivers/staging/simple-fpga-bus/TODO
 create mode 100644 drivers/staging/simple-fpga-bus/simple-fpga-bus.c
 create mode 100644 include/linux/fpga/fpga-mgr.h

-- 
1.7.9.5

