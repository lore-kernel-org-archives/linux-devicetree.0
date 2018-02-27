From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 0/2] drivers: soc: xilinx: Add support for ZynqMP PM driver
Date: Tue, 27 Feb 2018 15:24:24 -0800
Message-ID: <1519773866-18196-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add ZynqMP PM driver. PM driver provides power management
support for ZynqMP.
This patchset has dependency on below drivers:
Firmware Driver:     https://patchwork.kernel.org/patch/10230773/
IPI Mailbox Driver:  https://patchwork.kernel.org/patch/10145799/

Jolly Shah (2):
  dt-bindings: soc: Add ZynqMP PM bindings
  drivers: soc: xilinx: Add ZynqMP PM driver

 .../bindings/soc/xilinx/xlnx,zynqmp-power.txt      |  28 +++
 drivers/soc/Makefile                               |   1 +
 drivers/soc/xilinx/Kconfig                         |   2 +
 drivers/soc/xilinx/Makefile                        |   2 +
 drivers/soc/xilinx/zynqmp/Kconfig                  |  20 ++
 drivers/soc/xilinx/zynqmp/Makefile                 |   4 +
 drivers/soc/xilinx/zynqmp/power.c                  | 249 +++++++++++++++++++++
 include/linux/soc/xilinx/zynqmp/power.h            |  18 ++
 8 files changed, 324 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt
 create mode 100644 drivers/soc/xilinx/zynqmp/Kconfig
 create mode 100644 drivers/soc/xilinx/zynqmp/Makefile
 create mode 100644 drivers/soc/xilinx/zynqmp/power.c
 create mode 100644 include/linux/soc/xilinx/zynqmp/power.h

-- 
2.7.4
