Return-Path: <atull@kernel.org>
From: atull@opensource.altera.com
Subject: [PATCH v11 0/4] FPGA Manager Framework
Date: Wed,  7 Oct 2015 16:36:25 +0100
Message-Id: <1444232189-5762-1-git-send-email-atull@opensource.altera.com>
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-ID: <devicetree@vger.kernel.org>

From: Alan Tull <atull@opensource.altera.com>

Hi Greg,

I'm resending v11

The changes requested for v12 are minor.  We can fix them upstream in
some small patches.  Thanks for everybody's support and help in reviewing
these.

Alan


This patch set adds the FPGA manager core which exports API functions that
write an image to a FPGA

I'm holding off on the DT overlay support a little for now.

The core's API is minimal to start with: only 6 functions.  This gives a
manufacturer-agnostic interface for programming FPGA's such that higher
level interfaces (such as DT Overlays) can be shared.

Alan Tull (4):
  usage documentation for FPGA manager core
  fpga manager: add sysfs interface document
  add FPGA manager core
  fpga manager: add driver for socfpga fpga manager

 Documentation/ABI/testing/sysfs-class-fpga-manager |   37 ++
 Documentation/fpga/fpga-mgr.txt                    |  171 ++++++
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/fpga/Kconfig                               |   24 +
 drivers/fpga/Makefile                              |    9 +
 drivers/fpga/fpga-mgr.c                            |  382 ++++++++++++
 drivers/fpga/socfpga.c                             |  616 ++++++++++++++++++++
 include/linux/fpga/fpga-mgr.h                      |  127 ++++
 9 files changed, 1369 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
 create mode 100644 Documentation/fpga/fpga-mgr.txt
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 drivers/fpga/socfpga.c
 create mode 100644 include/linux/fpga/fpga-mgr.h

-- 
1.7.9.5
