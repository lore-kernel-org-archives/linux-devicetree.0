From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/1] net: phy: micrel: add 125MHz reference clock workaround
Date: Tue, 15 May 2018 09:47:55 +0200
Message-ID: <20180515074755.26160-2-m.felsch@pengutronix.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, niebelm@tqsc.de
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel@tqs.de>

The micrel KSZ9031 phy has a optional clock pin (CLK125_NDO) which can be
used as reference clock for the MAC unit. The clock signal must meet the
RGMII requirements to ensure the correct data transmission between the
MAC and the PHY. The KSZ9031 phy does not fulfill the duty cycle
requirement if the phy is configured as slave. For a complete
describtion look at the errata sheets: DS80000691D or DS80000692D.

The errata sheet recommends to force the phy into master mode whenever
there is a 1000Base-T link-up as work around. Only set the
"micrel,force-master" property if you use the phy reference clock provided
by CLK125_NDO pin as MAC reference clock in your application.

Attenation, this workaround is only usable if the link partner can
be configured to slave mode for 1000Base-T.

Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
[m.felsch@pengutronix.de: fix dt-binding documentation]
[m.felsch@pengutronix.de: use already existing result var for read/write]
[m.felsch@pengutronix.de: add error handling]
[m.felsch@pengutronix.de: add more comments]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/net/micrel-ksz90x1.txt           |  7 +++++
 drivers/net/phy/micrel.c                      | 31 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
index 42a248301615..e22d8cfea687 100644
--- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
+++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
@@ -57,6 +57,13 @@ KSZ9031:
       - txd2-skew-ps : Skew control of TX data 2 pad
       - txd3-skew-ps : Skew control of TX data 3 pad
 
+    - micrel,force-master:
+        Boolean, force phy to master mode. Only set this option if the phy
+        reference clock provided at CLK125_NDO pin is used as MAC reference
+        clock because the clock jitter in slave mode is to high (errata#2).
+        Attention: The link partner must be configurable as slave otherwise
+        no link will be established.
+
 Examples:
 
 	mdio {
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index f41b224a9cdb..ab195f0916d6 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -573,9 +573,40 @@ static int ksz9031_config_init(struct phy_device *phydev)
 		ksz9031_of_load_skew_values(phydev, of_node,
 				MII_KSZ9031RN_TX_DATA_PAD_SKEW, 4,
 				tx_data_skews, 4);
+
+		/* Silicon Errata Sheet (DS80000691D or DS80000692D):
+		 * When the device links in the 1000BASE-T slave mode only,
+		 * the optional 125MHz reference output clock (CLK125_NDO)
+		 * has wide duty cycle variation.
+		 *
+		 * The optional CLK125_NDO clock does not meet the RGMII
+		 * 45/55 percent (min/max) duty cycle requirement and therefore
+		 * cannot be used directly by the MAC side for clocking
+		 * applications that have setup/hold time requirements on
+		 * rising and falling clock edges.
+		 *
+		 * Workaround:
+		 * Force the phy to be the master to receive a stable clock
+		 * which meets the duty cycle requirement.
+		 */
+		if (of_property_read_bool(of_node, "micrel,force-master")) {
+			result = phy_read(phydev, MII_CTRL1000);
+			if (result < 0)
+				goto err_force_master;
+
+			/* enable master mode, config & prefer master */
+			result |= CTL1000_ENABLE_MASTER | CTL1000_AS_MASTER;
+			result = phy_write(phydev, MII_CTRL1000, result);
+			if (result < 0)
+				goto err_force_master;
+		}
 	}
 
 	return ksz9031_center_flp_timing(phydev);
+
+err_force_master:
+	phydev_err(phydev, "failed to force the phy to master mode\n");
+	return result;
 }
 
 #define KSZ8873MLL_GLOBAL_CONTROL_4	0x06
-- 
2.17.0
