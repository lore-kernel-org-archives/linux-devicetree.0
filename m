From: <atull@opensource.altera.com>
Subject: [PATCH v9 0/7] FPGA Manager Framework and Simple FPGA Bus
Date: Fri, 17 Jul 2015 10:51:10 -0500
Message-ID: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.co>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

This patchset adds two chunks plus documentation:
 * fpga manager core: exports ABI functions that write an image to a FPGA
 * DT Overlay support: simple-fpga-bus to handle FPGA from a DT overlay

The core's ABI is minimal to start with: only 6 functions.  This gives a
common interface for programming various FPGA such that any higher level
interfaces such as the DT Overlays or anything else that is added can be
shared and not be manufacturor-specific.

The DT Overlays support exists for the usage where the FPGA will contain
some "hardware" that will need drivers.  Where that use model is not
appealing, the core ABI can be used to add a different use model such as
using an FPGA as acceleration as has been discussed.

This patchset gets rid of the sysfs controls that allowed direct
control of a FPGA from userspace.

This patchset is under drivers/staging as the interface could change.

The bindings for the socpfga fpga manager already are upstreamed as
1b4e119 Alan Tull : doc: add bindings document for altera fpga manager

The DT Support is dependent on Pantelis's dtc overlay patches from
https://github.com/pantoniou/dtc.git
and his DT overlays configfs interface patches and fixes from
https://github.com/pantoniou/linux-beagle-track-mainline

efb0c04 Pantelis Antoniou : gcl: Fix resource linking
85e785e Pantelis Antoniou : ARM: DT: Enable symbols when CONFIG_OF_OVERLAY is used
af0321f Pantelis Antoniou : OF: DT-Overlay configfs interface (v5)
4c1c675 Pantelis Antoniou : configfs: Implement binary attributes (v4)


Alan Tull (7):
  staging: usage documentation for FPGA manager core
  staging: usage documentation for simple fpga bus
  staging: add bindings document for simple fpga bus
  staging: fpga manager: add sysfs interface document
  staging: fpga manager core
  staging: add simple-fpga-bus
  staging: fpga manager: add driver for socfpga fpga manager

 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 .../Documentation/ABI/sysfs-class-fpga-manager     |   26 +
 .../Documentation/bindings/simple-fpga-bus.txt     |   61 ++
 drivers/staging/fpga/Documentation/fpga-mgr.txt    |  117 ++++
 .../staging/fpga/Documentation/simple-fpga-bus.txt |   48 ++
 drivers/staging/fpga/Kconfig                       |   31 +
 drivers/staging/fpga/Makefile                      |   10 +
 drivers/staging/fpga/fpga-mgr.c                    |  373 ++++++++++++
 drivers/staging/fpga/simple-fpga-bus.c             |  323 ++++++++++
 drivers/staging/fpga/socfpga.c                     |  616 ++++++++++++++++++++
 include/linux/fpga/fpga-mgr.h                      |  127 ++++
 12 files changed, 1735 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
 create mode 100644 drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
 create mode 100644 drivers/staging/fpga/Documentation/fpga-mgr.txt
 create mode 100644 drivers/staging/fpga/Documentation/simple-fpga-bus.txt
 create mode 100644 drivers/staging/fpga/Kconfig
 create mode 100644 drivers/staging/fpga/Makefile
 create mode 100644 drivers/staging/fpga/fpga-mgr.c
 create mode 100644 drivers/staging/fpga/simple-fpga-bus.c
 create mode 100644 drivers/staging/fpga/socfpga.c
 create mode 100644 include/linux/fpga/fpga-mgr.h

-- 
1.7.9.5

