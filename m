From: <atull@opensource.altera.com>
Subject: [PATCH v16 0/6] Device Tree support for FPGA programming
Date: Fri, 5 Feb 2016 15:29:57 -0600
Message-ID: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

v16 Refactors the FPGA Area and FPGA Bus into single thing called an
FPGA Region and eliminates using simple-bus.  I'm using the word
"region" as it's a term is used in the literature of both the major
FPGA manufacturors.

Changes for v16:
* Refactor the FPGA Area and FPGA Bus into a FPGA Region.
* Don't use simple-bus.
* FPGA Managers and FPGA Bridges are now specified by phandle using the 
  "fpga-mgr" and "fpga-bridges" properties.  fpga-bridges can specify
  more than one bridge.
* Device Tree overlays should be targeted to a FPGA Region.
* The overlays need only contain firmware-name and the child nodes.
* To model a system containing >1 partial reconfiguration region,
  an overlay could add FPGA Regions to the base FPGA Regions.
* Child FPGA Regions inherit the parent FGPA Manager, but specify
  their own set of bridges if needes as partial reconfig regions
  will likely need their own bridges.
* All this is discussed in bindings/fpga/fpga-region.txt

One other highlight:
The little engine that runs this thing is a reconfig notifier
in fpga-region.c.  This notifier that will program an FPGA if a
"firmware-name" property gets added to a fpga-region.  Then
it will call of_platform_populate().  The current behavior in Linux
when a DT overlay is applied is that the reconfig notifications
go out in heirarchical order: first notifications are for the
properties, then notifications for the child nodes.  So an overlay
that adds a 'firmware-name' property and some child nodes to a
fpga-region will cause FPGA programming and child node
populating in the right order.

One issue with the dynamic DT stuff:
I've tried returning and error from the notifier if FPGA programming
fails; the error is noted on the console, but the child nodes
get probed anyway.


Alan Tull (6):
  fpga: add bindings document for fpga region
  add sysfs document for fpga bridge class
  ARM: socfpga: add bindings document for fpga bridge drivers
  fpga: add fpga bridge framework
  fpga: fpga-region: device tree control for FPGA
  ARM: socfpga: fpga bridge driver support

 Documentation/ABI/testing/sysfs-class-fpga-bridge  |   11 +
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   15 +
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |   47 ++
 .../devicetree/bindings/fpga/fpga-region.txt       |  348 +++++++++++++++
 drivers/fpga/Kconfig                               |   21 +
 drivers/fpga/Makefile                              |    7 +
 drivers/fpga/altera-fpga2sdram.c                   |  174 ++++++++
 drivers/fpga/altera-hps2fpga.c                     |  213 +++++++++
 drivers/fpga/fpga-bridge.c                         |  388 +++++++++++++++++
 drivers/fpga/fpga-region.c                         |  460 ++++++++++++++++++++
 include/linux/fpga/fpga-bridge.h                   |   55 +++
 11 files changed, 1739 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt
 create mode 100644 drivers/fpga/altera-fpga2sdram.c
 create mode 100644 drivers/fpga/altera-hps2fpga.c
 create mode 100644 drivers/fpga/fpga-bridge.c
 create mode 100644 drivers/fpga/fpga-region.c
 create mode 100644 include/linux/fpga/fpga-bridge.h

-- 
1.7.9.5
