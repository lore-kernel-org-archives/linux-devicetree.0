Return-Path: <atull@opensource.altera.com>
From: Alan Tull <atull@opensource.altera.com>
Subject: [RFC PATCH 0/3] Yet another stab at a fpga framework
Date: Thu, 31 Jul 2014 16:59:01 -0500
Message-ID: <1406843944-7780-1-git-send-email-atull@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Pavel Machek <pavel@denx.de>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>
List-ID: <devicetree@vger.kernel.org>

The function of the framework is to provide consistent ways of
programming raw images into FPGA's.

The core (fpga-mgr.c) does not include a userspace interface
and just exports kernel functions.

This approach separates the core from the interfaces.

Each interface can be enabled or disabled in the defconfig.

Programming from device tree overlays is supported.

The core exports kernel functions to:
  * write the fpga from a buffer or using the firmware layer
  * get fpga status
  * find a particular fpga manager from a device tree phandle
  * register/unregister lower level fpga drivers.

The bus allows us to:
  * program fpga from a device tree overlay using firmware.
  * automatically reload firmware and reprogram fpga during resume.

The sysfs interface:
  * read only, get the name and status of fpga manager.

I have a configfs interface patch which I haven't included,
adds configfs as a separate file.

TODO:
  * Enable bridges after fpga programming, disable during suspend

Examples are provided in the headers of the patches.

Alan Tull


Alan Tull (3):
  fpga manager framework core
  fpga bus driver
  fpga sysfs interface

 drivers/Kconfig          |    2 +
 drivers/Makefile         |    1 +
 drivers/fpga/Kconfig     |   27 +++
 drivers/fpga/Makefile    |   12 ++
 drivers/fpga/bus.c       |  139 +++++++++++++++
 drivers/fpga/fpga-mgr.c  |  431 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fpga/sysfs.c     |   68 ++++++++
 include/linux/fpga-mgr.h |  137 +++++++++++++++
 8 files changed, 817 insertions(+)
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/bus.c
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 drivers/fpga/sysfs.c
 create mode 100644 include/linux/fpga-mgr.h

-- 
1.7.9.5
