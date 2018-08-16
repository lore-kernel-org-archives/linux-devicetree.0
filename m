From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v2 0/3] drivers: soc: xilinx: Add support for ZynqMP power domain driver
Date: Thu, 16 Aug 2018 12:21:41 -0700
Message-ID: <1534447304-12919-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

The zynqmp power domain driver communicates the usage requirements
for logical power domains / devices to the platform FW.
FW is responsible for choosing appropriate power states,
taking Linux' usage information into account.

This patch series is based on top of Xilinx firmware patch set:
https://patchwork.kernel.org/cover/10555405/

v2:
 - Rebased on top of latest firmware driver patch series
 - Updated driver name from zynqmp-genpd to zynqmp-power-controller
 - Updated device tree bindings to move power controller node under firmware node

Jolly Shah (1):
  drivers: soc: xilinx: Add ZynqMP power domain driver

Rajan Vaja (2):
  dt-bindings: power: Add ZynqMP power domain bindings
  firmware: xilinx: Add APIs to control node status/power

 .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |  47 +++
 drivers/firmware/xilinx/zynqmp.c                   |  58 ++++
 drivers/soc/xilinx/Kconfig                         |   9 +
 drivers/soc/xilinx/Makefile                        |   2 +
 drivers/soc/xilinx/zynqmp_pm_domains.c             | 352 +++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h               |  26 ++
 6 files changed, 494 insertions(+)
 create mode 100644 drivers/soc/xilinx/zynqmp_pm_domains.c

-- 
2.7.4
