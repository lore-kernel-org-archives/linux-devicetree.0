From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v4 0/2] Xilinx Slave Serial FPGA Manager
Date: Tue, 28 Feb 2017 17:40:20 +0100
Message-ID: <1488300022-30150-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This series adds an FPGA manager driver for Xilinx Spartan6 FPGAs
that can configure them using an SPI port and two GPIOs.

Anatolij Gustschin (2):
  dt: bindings: fpga: add xilinx slave-serial binding description
  fpga manager: Add Xilinx slave serial SPI driver

Changes in v4:
 - add Acked-by tags for DT bindings
 - increase program latency up to 7.5ms for other Xilinx FPGAs
 - continue to apply CCLK cycles until specified timeout elapses (to
   cover more possible configuration DONE scenarios)
 - apply 8 CCLK cycles afer DONE signal
 - rebased to apply on top of Kconfig/Makefile changes by queued
   fpga manager patches

Changes in v3:

 - extend example to show the usage in SPI master node, connected
   to the fpga-region node
 - use named constant for udelay()/usleep_range() arguments
 - drop not needed .owner init
 - correct module licence (GPL v2)
 - fix build warning with newer gcc (in min() macro)

Changes in v2:

 - corrected gpios properties and node name in example
   in DT binding document
 - rebased on v4.10

 .../bindings/fpga/xilinx-slave-serial.txt          |  44 +++++
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/xilinx-spi.c                          | 198 +++++++++++++++++++++
 4 files changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
 create mode 100644 drivers/fpga/xilinx-spi.c

-- 
2.7.4
