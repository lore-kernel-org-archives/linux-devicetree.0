From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v4 0/3] drivers: soc: xilinx: Add support for ZynqMP power domain driver
Date: Fri, 1 Feb 2019 14:08:47 -0800
Message-ID: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
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

v4:
 - Added reviewed tag for dt bindings
 - Remove local device list for each domain and use list maintained in core genpd structure
 - Remove hardcoded pd-id to node ID mapping. Instead use argument passed in peripheral node as node ID. 
   Firmware would validate node ID when APIs requested from genpd ops.

v3:
 - Changed binding to have FW node as a power controller as suggested by Rob
 - Updated FW driver to register it as mfd child devices from firmware probe
 - Move bindings location as suggested

v2:
 - Rebased on top of latest firmware driver patch series
 - Updated driver name from zynqmp-genpd to zynqmp-power-controller
 - Updated device tree bindings to move power controller node under firmware node

Jolly Shah (1):
  drivers: soc: xilinx: Add ZynqMP power domain driver

Rajan Vaja (2):
  dt-bindings: power: Add ZynqMP power domain bindings
  firmware: xilinx: Add APIs to control node status/power

 .../bindings/power/xlnx,zynqmp-genpd.txt           |  34 +++
 drivers/firmware/xilinx/Kconfig                    |   1 +
 drivers/firmware/xilinx/zynqmp.c                   |  73 +++++
 drivers/soc/xilinx/Kconfig                         |   9 +
 drivers/soc/xilinx/Makefile                        |   1 +
 drivers/soc/xilinx/zynqmp_pm_domains.c             | 321 +++++++++++++++++++++
 include/dt-bindings/power/xlnx-zynqmp-power.h      |  39 +++
 include/linux/firmware/xlnx-zynqmp.h               |  26 ++
 8 files changed, 504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt
 create mode 100644 drivers/soc/xilinx/zynqmp_pm_domains.c
 create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h

-- 
2.7.4
