From: <atull@opensource.altera.com>
Subject: [PATCH v4 0/6] FPGA Manager Framework
Date: Tue, 9 Dec 2014 14:14:44 -0600
Message-ID: <1418156090-23578-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Improvements in this v3 and v4:

I've moved the driver to drivers/staging.

I'm including the altera low level driver, defconfig changes, and
DTS changes - everything to make it work on socfpga platform.

Fixed things in the framework that were left over from my original
version (that Michal started with) that was a character driver.
In particular, make the device be present in the fpga_manager struct,
not as a pointer, so container_of will work.

Since not enough of the Device Tree Overlays code is in the main
kernel yet, I'm leaving out the (small) changes to make this accept
notifications when a device tree overlay is accepted.  That can
wait a little until enough of is in that it can build and work.
That is a little disappointing to leave it out for now because
it was very cool and, I think, more Linux-like than this is by
itself.

Alan Tull (6):
  doc: add bindings document for altera fpga manager
  arm: dts: socfpga: add altera fpga manager
  ARM: socfpga: defconfig: enable fpga manager
  fpga manager: add sysfs interface document
  staging: fpga manager: framework core
  staging: fpga manager: add driver for altera socfpga manager

 Documentation/ABI/testing/sysfs-class-fpga-manager |   38 +
 .../devicetree/bindings/fpga/altera-fpga-mgr.txt   |   17 +
 arch/arm/boot/dts/socfpga.dtsi                     |   10 +
 arch/arm/configs/socfpga_defconfig                 |    4 +
 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 drivers/staging/fpga/Kconfig                       |   27 +
 drivers/staging/fpga/Makefile                      |   11 +
 drivers/staging/fpga/altera.c                      |  789 ++++++++++++++++++++
 drivers/staging/fpga/fpga-mgr.c                    |  485 ++++++++++++
 include/linux/fpga-mgr.h                           |  104 +++
 11 files changed, 1488 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga-mgr.txt
 create mode 100644 drivers/staging/fpga/Kconfig
 create mode 100644 drivers/staging/fpga/Makefile
 create mode 100644 drivers/staging/fpga/altera.c
 create mode 100644 drivers/staging/fpga/fpga-mgr.c
 create mode 100644 include/linux/fpga-mgr.h

-- 
1.7.9.5

