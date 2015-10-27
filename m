From: <atull@opensource.altera.com>
Subject: [PATCH v12 0/6] simple fpga bus and fpga bridge framework
Date: Tue, 27 Oct 2015 17:09:09 -0500
Message-ID: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

The Simple FPGA Bus provides a manufacturer-agnostic interface
for reprogramming FPGAs using Device Tree Overlays.  It uses the
FPGA Bridge Framework and the upstreamed FPGA Manager Framework.

When a Device Tree Overlay is applied, the Simple FPGA Bus will
use information the overlay to:
 * Disable FPGA bridges
 * Reprogram the FPGA
 * Enable FPGA bridges
 * Populate the child devices

Simple FPGA Bus was originally submitted with the FPGA Manager
Framework which was accepted upstream.  This version uses the
FPGA Bridge Framework to provide methods to enable/bridges.

Alan Tull (6):
  fpga: add usage documentation for simple fpga bus
  fpga: add bindings document for simple fpga bus
  fpga: add simple-fpga-bus
  fpga: add fpga bridge framework
  ARM: socfpga: add bindings document for fpga bridge drivers
  ARM: socfpga: fpga bridge driver support

 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   18 ++
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |   36 +++
 .../devicetree/bindings/fpga/simple-fpga-bus.txt   |   81 +++++
 Documentation/fpga/simple-fpga-bus.txt             |   58 ++++
 drivers/fpga/Kconfig                               |   21 ++
 drivers/fpga/Makefile                              |    7 +
 drivers/fpga/altera-fpga2sdram.c                   |  185 +++++++++++
 drivers/fpga/altera-hps2fpga.c                     |  234 ++++++++++++++
 drivers/fpga/fpga-bridge.c                         |  242 +++++++++++++++
 drivers/fpga/simple-fpga-bus.c                     |  327 ++++++++++++++++++++
 include/linux/fpga/fpga-bridge.h                   |   49 +++
 11 files changed, 1258 insertions(+)
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
1.7.9.5
