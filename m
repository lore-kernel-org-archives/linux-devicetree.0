From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 00/14] net: phy: adin: add support for Analog Devices PHYs
Date: Fri, 9 Aug 2019 16:35:38 +0300
Message-ID: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This changeset adds support for Analog Devices Industrial Ethernet PHYs.
Particularly the PHYs this driver adds support for:
 * ADIN1200 - Robust, Industrial, Low Power 10/100 Ethernet PHY
 * ADIN1300 - Robust, Industrial, Low Latency 10/100/1000 Gigabit
   Ethernet PHY

The 2 chips are pin & register compatible with one another. The main
difference being that ADIN1200 doesn't operate in gigabit mode.

The chips can be operated by the Generic PHY driver as well via the
standard IEEE PHY registers (0x0000 - 0x000F) which are supported by the
kernel as well. This assumes that configuration of the PHY has been done
completely in HW, according to spec, i.e. no extra SW configuration
required.

This changeset also implements the ability to configure the chips via SW
registers.

Datasheets:
  https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1300.pdf
  https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1200.pdf

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Alexandru Ardelean (14):
  net: phy: adin: add support for Analog Devices PHYs
  net: phy: adin: hook genphy_{suspend,resume} into the driver
  net: phy: adin: add support for interrupts
  net: phy: adin: add {write,read}_mmd hooks
  net: phy: adin: configure RGMII/RMII/MII modes on config
  net: phy: adin: make RGMII internal delays configurable
  net: phy: adin: make RMII fifo depth configurable
  net: phy: adin: add support MDI/MDIX/Auto-MDI selection
  net: phy: adin: add EEE translation layer from Clause 45 to Clause 22
  net: phy: adin: implement PHY subsystem software reset
  net: phy: adin: implement Energy Detect Powerdown mode
  net: phy: adin: implement downshift configuration via phy-tunable
  net: phy: adin: add ethtool get_stats support
  dt-bindings: net: add bindings for ADIN PHY driver

 .../devicetree/bindings/net/adi,adin.yaml     |  73 ++
 MAINTAINERS                                   |   8 +
 drivers/net/phy/Kconfig                       |   9 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/adin.c                        | 777 ++++++++++++++++++
 5 files changed, 868 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml
 create mode 100644 drivers/net/phy/adin.c

--

Changelog v2 -> v3:
[ patches numbered from v2 ]

* general: added Andrew Lunn's `Reviewed-by` tag to patches [where the case]
* dropped [PATCH v2 02/15] net: phy: adin: hook genphy_read_abilities() to get_features
* [PATCH v2 05/15] net: phy: adin: add {write,read}_mmd hooks
  - reworded patch to mention C22 MMD access is defined by 802.3 standard
* [PATCH v2 13/15] net: phy: adin: configure downshift on config_init
  - reworked patch based on Aquantia PHY driver; using phy-tunable ETHTOOL_PHY_DOWNSHIFT
* [PATCH v2 15/15] dt-bindings: net: add bindings for ADIN PHY driver
  - removed $ref where not needed [based on feedback]

2.20.1
