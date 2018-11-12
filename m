From: Alan Douglas <adouglas@cadence.com>
Subject: [PATCH v3 0/2] phy: cadence: Add driver and dt-bindings for Sierra PHY
Date: Mon, 12 Nov 2018 16:41:46 +0000
Message-ID: <1542040906-9877-1-git-send-email-adouglas@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: Alan Douglas <adouglas@cadence.com>
List-Id: devicetree@vger.kernel.org

The Cadence Sierra PHY supports a number of different protocols.  This
series adds a driver with support for USB3 and PCIe modes.

Only one clock frequency is currently supported, so the value of clock
provided in device tree is ignored.

Changes since v2:
* Rebased on 4.20-rc1
* Renamed cdns-sierra-phy.txt to phy-cadence-sierra.txt, to match DP PHY
* Renamed phy-cdns-sierra.c to phy-cadence-sierra.c, to match DP PHY
* Removed blank line at end of devicetree bindings description

Changes since v1:
* Moved subnode resets into each subnode in devicetree bindings
* Modified driver to put subnode resets on exit
* Changed driver filename to phy-cdns-sierra.c

Changes since RFC v2:
* Devicetree bindings modified as suggested by Rob Herring.
* Tidy up and correction of return paths in probe function.

Changes since RFC v1:
* Each group of lanes is now treated as a subnode, and a generic PHY
  device is created for each group.
* General cleanup based on comments
* A reset is now required for each subnode.  The complete PHY block
  is taken out of reset at initial probe, and remains out of reset.
* Added a binding to allow for hardware configuration of PHY registers


Alan Douglas (2):
  dt-bindings: phy: Document cadence Sierra PHY bindings
  phy: cadence: Add driver for Sierra PHY

 .../devicetree/bindings/phy/phy-cadence-sierra.txt |  67 ++++
 drivers/phy/cadence/Kconfig                        |   9 +-
 drivers/phy/cadence/Makefile                       |   1 +
 drivers/phy/cadence/phy-cadence-sierra.c           | 395 +++++++++++++++++++++
 4 files changed, 471 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-sierra.txt
 create mode 100644 drivers/phy/cadence/phy-cadence-sierra.c

-- 
1.9.0
