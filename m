From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 0/7] net: of_mdio improvements
Date: Thu, 5 Dec 2013 14:52:09 -0800
Message-ID: <1386283936-26104-1-git-send-email-florian@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, grant.likely@linaro.org, devicetree@vger.kernel.org, abrodkin@synopsys.com, rob.herring@calxeda.com, mark.rutland@arm.com, sebastian.hesselbarth@gmail.com, Florian Fainelli <florian@openwrt.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patchset contains a few improvements to the MDIO device tree parsing
code such as refactoring and parsing the "max-speed" property which is
defined in the ePAPR specification.

Thanks!

Florian Fainelli (7):
  net: of_mdio: factor PHY registration from of_mdiobus_register
  net: of_mdio: use PHY_MAX_ADDR constant
  net: of_mdio: do not overwrite PHY interrupt configuration
  net: phy: breakdown PHY_*_FEATURES defines
  net: of_mdio: parse "max-speed" property to set PHY supported features
  arc_emac: remove custom "max-speed" parsing code
  Documentation: update Ethernet PHY devices binding with 'max-speed'

 Documentation/devicetree/bindings/net/phy.txt |   1 +
 drivers/net/ethernet/arc/emac.h               |   2 -
 drivers/net/ethernet/arc/emac_main.c          |  20 +---
 drivers/of/of_mdio.c                          | 135 ++++++++++++++------------
 include/linux/phy.h                           |  23 +++--
 5 files changed, 89 insertions(+), 92 deletions(-)

-- 
1.8.3.2
