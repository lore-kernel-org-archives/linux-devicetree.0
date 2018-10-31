From: Alan Douglas <adouglas@cadence.com>
Subject: [PATCH v2 0/2] phy: cadence: Add driver and dt-bindings for Sierra PHY
Date: Wed, 31 Oct 2018 16:33:38 +0000
Message-ID: <1541003618-25806-1-git-send-email-adouglas@cadence.com>
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

 .../devicetree/bindings/phy/cdns-sierra-phy.txt    |  68 ++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/cadence/Kconfig                        |   9 +
 drivers/phy/cadence/Makefile                       |   2 +
 drivers/phy/cadence/phy-cdns-sierra.c              | 395 +++++++++++++++++++++
 6 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt
 create mode 100644 drivers/phy/cadence/Kconfig
 create mode 100644 drivers/phy/cadence/Makefile
 create mode 100644 drivers/phy/cadence/phy-cdns-sierra.c

-- 
1.9.0
