From: <atull@opensource.altera.com>
Subject: [PATCH v15 0/6] altera fpga area and fpga bus
Date: Wed, 20 Jan 2016 13:24:21 -0600
Message-ID: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

For v15, I'm not using the FPGA Manager as the bus.  I'm adding a FPGA Bus;
the FPGA Manager and bridges go below it.

I've gotten enough feedback that my proposals are Altera specific that I am
going with that and changing the bindings to include an 'altr,' prefix.

I've combined the bindings document and the other Documentation/fpga/ document
and done a rewrite there.

Anybody who tried the previous patchset will not have much changes to do to get
this going.  The changes are:
 * The live tree has a 'altr,fpga-bus' which contains the FPGA Manager and
    FPGA Bridges.
 * The target path in your overlays needs to be adjusted accordingly.

That said, the changes for each of these submissions is getting to be less and
less; most of these patches are unchanged for v15.

Alan Tull (6):
  fpga: add bindings document for fpga area and fpga bus
  add sysfs document for fpga bridge class
  ARM: socfpga: add bindings document for fpga bridge drivers
  fpga: add fpga bridge framework
  fpga: fpga-area and fpga-bus: device tree control for FPGA
  ARM: socfpga: fpga bridge driver support

 Documentation/ABI/testing/sysfs-class-fpga-bridge  |   11 +
 .../bindings/fpga/altera-fpga-bus-fpga-area.txt    |  452 ++++++++++++++++++++
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   15 +
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |   43 ++
 drivers/fpga/Kconfig                               |   21 +
 drivers/fpga/Makefile                              |    7 +
 drivers/fpga/altera-fpga2sdram.c                   |  174 ++++++++
 drivers/fpga/altera-hps2fpga.c                     |  213 +++++++++
 drivers/fpga/fpga-area.c                           |  352 +++++++++++++++
 drivers/fpga/fpga-bridge.c                         |  388 +++++++++++++++++
 include/linux/fpga/fpga-bridge.h                   |   56 +++
 11 files changed, 1732 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga-bus-fpga-area.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644 drivers/fpga/altera-fpga2sdram.c
 create mode 100644 drivers/fpga/altera-hps2fpga.c
 create mode 100644 drivers/fpga/fpga-area.c
 create mode 100644 drivers/fpga/fpga-bridge.c
 create mode 100644 include/linux/fpga/fpga-bridge.h

-- 
1.7.9.5

