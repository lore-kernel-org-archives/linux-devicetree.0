From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 00/16] net: phy: adin: add support for Analog Devices PHYs
Date: Mon, 5 Aug 2019 19:54:37 +0300
Message-ID: <20190805165453.3989-1-alexandru.ardelean@analog.com>
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

Alexandru Ardelean (16):
  net: phy: adin: add support for Analog Devices PHYs
  net: phy: adin: hook genphy_{suspend,resume} into the driver
  net: phy: adin: add support for interrupts
  net: phy: adin: add {write,read}_mmd hooks
  net: phy: adin: configure RGMII/RMII/MII modes on config
  net: phy: adin: support PHY mode converters
  net: phy: adin: make RGMII internal delays configurable
  net: phy: adin: make RMII fifo depth configurable
  net: phy: adin: add support MDI/MDIX/Auto-MDI selection
  net: phy: adin: add EEE translation layer for Clause 22
  net: phy: adin: PHY reset mechanisms
  net: phy: adin: read EEE setting from device-tree
  net: phy: adin: implement Energy Detect Powerdown mode
  net: phy: adin: make sure down-speed auto-neg is enabled
  net: phy: adin: add ethtool get_stats support
  dt-bindings: net: add bindings for ADIN PHY driver

 .../devicetree/bindings/net/adi,adin.yaml     |  93 +++
 MAINTAINERS                                   |   9 +
 drivers/net/phy/Kconfig                       |   9 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/adin.c                        | 752 ++++++++++++++++++
 include/dt-bindings/net/adin.h                |  26 +
 6 files changed, 890 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml
 create mode 100644 drivers/net/phy/adin.c
 create mode 100644 include/dt-bindings/net/adin.h

-- 
2.20.1
