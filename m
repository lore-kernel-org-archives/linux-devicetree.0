From: <atull@opensource.altera.com>
Subject: [PATCH v13 0/6] simple fpga bus and fpga bridge framework
Date: Tue, 3 Nov 2015 11:10:58 -0600
Message-ID: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

These patches are too late for this merge window; I'm submitting
them for those who are reviewing, especially the bindings.

Changes since v12:
 Change DT property from "init-val" to "bridge-enable"
 Use proposed DT common property "firmware-name" instead of "fpga-firmware"
 Clean up cruft from simple-fpga-bus DT bindings example
 Support Simple FPGA Bus when FPGA Bridges are compiled out.
 Cleanup and nits

The Simple FPGA Bus provides a manufacturer-agnostic interface for
reprogramming FPGAs using Device Tree Overlays.  It uses the FPGA Bridge
Framework and the upstreamed FPGA Manager Framework.  In the case where
FPGA Bridges are not needed, they don't need to be specified in the DT
and can compiled out, if desired.

Alan Tull (6):
  fpga: add usage documentation for simple fpga bus
  fpga: add bindings document for simple fpga bus
  fpga: add simple-fpga-bus
  fpga: add fpga bridge framework
  ARM: socfpga: add bindings document for fpga bridge drivers
  ARM: socfpga: fpga bridge driver support

 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |  15 +
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |  31 ++
 .../devicetree/bindings/fpga/simple-fpga-bus.txt   |  74 +++++
 Documentation/fpga/simple-fpga-bus.txt             |  58 ++++
 drivers/fpga/Kconfig                               |  21 ++
 drivers/fpga/Makefile                              |   7 +
 drivers/fpga/altera-fpga2sdram.c                   | 185 ++++++++++++
 drivers/fpga/altera-hps2fpga.c                     | 233 +++++++++++++++
 drivers/fpga/fpga-bridge.c                         | 229 +++++++++++++++
 drivers/fpga/simple-fpga-bus.c                     | 323 +++++++++++++++++++++
 include/linux/fpga/fpga-bridge.h                   |  74 +++++
 11 files changed, 1250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
 create mode 100644 Documentation/fpga/simple-fpga-bus.txt
 create mode 100644 drivers/fpga/altera-fpga2sdram.c
 create mode 100644 drivers/fpga/altera-hps2fpga.c
 create mode 100644 drivers/fpga/fpga-bridge.c
 create mode 100644 drivers/fpga/simple-fpga-bus.c
 create mode 100644 include/linux/fpga/fpga-bridge.h

-- 
1.9.1
