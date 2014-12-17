From: <atull@opensource.altera.com>
Subject: [PATCH v5 0/6] FPGA Manager Framework
Date: Wed, 17 Dec 2014 10:54:43 -0600
Message-ID: <1418835289-15752-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Intended for after 3.19-rc1

v5 includes changes from feedback from Michal, Steffen, Alan, Greg, and the
kbuild test robot.

The driver is under drivers/staging/fpga/
The header is now in include/linux/fpga/
The sysfs doc is in staging/fpga/Documentation/ABI/
The DT binding is in staging/fpga/Documentation/bindings/

Alan

Alan Tull (6):
  doc: add bindings document for altera fpga manager
  fpga manager: add sysfs interface document
  staging: fpga manager: framework core
  staging: fpga manager: add driver for socfpga fpga manager
  arm: dts: socfpga: add altera fpga manager
  ARM: socfpga: defconfig: enable fpga manager

 arch/arm/boot/dts/socfpga.dtsi                     |    7 +
 arch/arm/configs/socfpga_defconfig                 |    4 +
 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 .../Documentation/ABI/sysfs-class-fpga-manager     |   38 ++
 .../Documentation/bindings/altera-fpga-mgr.txt     |   17 +
 drivers/staging/fpga/Kconfig                       |   29 +
 drivers/staging/fpga/Makefile                      |   11 +
 drivers/staging/fpga/fpga-mgr.c                    |  523 +++++++++++++++
 drivers/staging/fpga/socfpga.c                     |  692 ++++++++++++++++++++
 include/linux/fpga/fpga-mgr.h                      |  124 ++++
 11 files changed, 1448 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
 create mode 100644 drivers/staging/fpga/Documentation/bindings/altera-fpga-mgr.txt
 create mode 100644 drivers/staging/fpga/Kconfig
 create mode 100644 drivers/staging/fpga/Makefile
 create mode 100644 drivers/staging/fpga/fpga-mgr.c
 create mode 100644 drivers/staging/fpga/socfpga.c
 create mode 100644 include/linux/fpga/fpga-mgr.h

-- 
1.7.9.5
