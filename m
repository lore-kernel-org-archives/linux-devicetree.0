From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v2 5/7] net: phy: mscc: read 'vsc8531,led-%d-mode' as an u32
Date: Mon,  3 Sep 2018 10:48:51 +0200
Message-ID: <20180903084853.18092-5-quentin.schulz@bootlin.com>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

In the DT binding, it is specified nowhere that 'vsc8531,led-%d-mode' is
an u8, even though it's read as an u8 in the driver.

Let's update the driver to take into consideration that the
'vsc8531,led-%d-mode' property is of the default type u32.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---

added in v2 in lieu of the DT binding patch for adding /bits 8/ to the
vsc8531,led-N-mode property

 drivers/net/phy/mscc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index 3c7b02bb5c38..2d9676d78d3f 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -122,7 +122,7 @@ enum rgmii_rx_clock_delay {
 struct vsc8531_private {
 	int rate_magic;
 	u16 supp_led_modes;
-	u8 leds_mode[MAX_LEDS];
+	u32 leds_mode[MAX_LEDS];
 	u8 nleds;
 };
 
@@ -414,19 +414,19 @@ static int vsc85xx_edge_rate_magic_get(struct phy_device *phydev)
 
 static int vsc85xx_dt_led_mode_get(struct phy_device *phydev,
 				   char *led,
-				   u8 default_mode)
+				   u32 default_mode)
 {
 	struct vsc8531_private *priv = phydev->priv;
 	struct device *dev = &phydev->mdio.dev;
 	struct device_node *of_node = dev->of_node;
-	u8 led_mode;
+	u32 led_mode;
 	int err;
 
 	if (!of_node)
 		return -ENODEV;
 
 	led_mode = default_mode;
-	err = of_property_read_u8(of_node, led, &led_mode);
+	err = of_property_read_u32(of_node, led, &led_mode);
 	if (!err && !(BIT(led_mode) & priv->supp_led_modes)) {
 		phydev_err(phydev, "DT %s invalid\n", led);
 		return -EINVAL;
@@ -449,7 +449,8 @@ static int vsc85xx_dt_led_mode_get(struct phy_device *phydev,
 }
 #endif /* CONFIG_OF_MDIO */
 
-static int vsc85xx_dt_led_modes_get(struct phy_device *phydev, u8 *default_mode)
+static int vsc85xx_dt_led_modes_get(struct phy_device *phydev,
+				    u32 *default_mode)
 {
 	struct vsc8531_private *priv = phydev->priv;
 	char led_dt_prop[19];
@@ -656,7 +657,7 @@ static int vsc85xx_probe(struct phy_device *phydev)
 {
 	struct vsc8531_private *vsc8531;
 	int rate_magic;
-	u8 default_mode[2] = {VSC8531_LINK_1000_ACTIVITY,
+	u32 default_mode[2] = {VSC8531_LINK_1000_ACTIVITY,
 	   VSC8531_LINK_100_ACTIVITY};
 
 	rate_magic = vsc85xx_edge_rate_magic_get(phydev);
-- 
2.17.1
