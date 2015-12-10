From: <atull@opensource.altera.com>
Subject: [PATCH v14 0/7] fpga area and fpga bridge framework
Date: Thu, 10 Dec 2015 17:37:02 -0600
Message-ID: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

For v14 I'm dropping the concept of "simple-fpga-bus" for "fpga-area"
with reworked bindings.

An FPGA Area describes a section of an FPGA including the FPGA image needed to
program it and the hardware contained once it is programmed.  The intent is
to support Device Tree controlled programming of FPGA's.

Alan Tull (7):
  fpga: add usage documentation for fpga area
  fpga: add bindings document for fpga area
  add sysfs document for fpga bridge class
  ARM: socfpga: add bindings document for fpga bridge drivers
  fpga: add fpga bridge framework
  fpga: fpga-area: support device tree control for FPGA programming
  ARM: socfpga: fpga bridge driver support

 Documentation/ABI/testing/sysfs-class-fpga-bridge  |   11 +
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   15 +
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |   43 +++
 .../devicetree/bindings/fpga/fpga-area.txt         |   70 ++++
 Documentation/fpga/fpga-area.txt                   |  299 +++++++++++++++
 drivers/fpga/Kconfig                               |   21 ++
 drivers/fpga/Makefile                              |    7 +
 drivers/fpga/altera-fpga2sdram.c                   |  174 +++++++++
 drivers/fpga/altera-hps2fpga.c                     |  213 +++++++++++
 drivers/fpga/fpga-area.c                           |  313 ++++++++++++++++
 drivers/fpga/fpga-bridge.c                         |  388 ++++++++++++++++++++
 include/linux/fpga/fpga-bridge.h                   |   56 +++
 12 files changed, 1610 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/fpga-area.txt
 create mode 100644 Documentation/fpga/fpga-area.txt
 create mode 100644 drivers/fpga/altera-fpga2sdram.c
 create mode 100644 drivers/fpga/altera-hps2fpga.c
 create mode 100644 drivers/fpga/fpga-area.c
 create mode 100644 drivers/fpga/fpga-bridge.c
 create mode 100644 include/linux/fpga/fpga-bridge.h

-- 
1.7.9.5
