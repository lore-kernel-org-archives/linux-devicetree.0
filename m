From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v2 2/7] net: phy: mscc: factorize function for getting LED mode from DT
Date: Mon,  3 Sep 2018 10:48:48 +0200
Message-ID: <20180903084853.18092-2-quentin.schulz@bootlin.com>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Microsemi PHYs support different LED modes depending on the variant, so
let's factorize the code so we just have to give the supported modes
while the logic behind getting the mode remains identical.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---

added in v2

 drivers/net/phy/mscc.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index af433f226ef4..aa37e8547cd0 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -104,8 +104,24 @@ enum rgmii_rx_clock_delay {
 #define DOWNSHIFT_COUNT_MAX		  5
 
 #define MAX_LEDS			  4
+#define VSC85XX_SUPP_LED_MODES (BIT(VSC8531_LINK_ACTIVITY) | \
+				BIT(VSC8531_LINK_1000_ACTIVITY) | \
+				BIT(VSC8531_LINK_100_ACTIVITY) | \
+				BIT(VSC8531_LINK_10_ACTIVITY) | \
+				BIT(VSC8531_LINK_100_1000_ACTIVITY) | \
+				BIT(VSC8531_LINK_10_1000_ACTIVITY) | \
+				BIT(VSC8531_LINK_10_100_ACTIVITY) | \
+				BIT(VSC8531_DUPLEX_COLLISION) | \
+				BIT(VSC8531_COLLISION) | \
+				BIT(VSC8531_ACTIVITY) | \
+				BIT(VSC8531_AUTONEG_FAULT) | \
+				BIT(VSC8531_SERIAL_MODE) | \
+				BIT(VSC8531_FORCE_LED_OFF) | \
+				BIT(VSC8531_FORCE_LED_ON))
+
 struct vsc8531_private {
 	int rate_magic;
+	u16 supp_led_modes;
 	u8 leds_mode[MAX_LEDS];
 	u8 nleds;
 };
@@ -401,6 +417,7 @@ static int vsc85xx_dt_led_mode_get(struct phy_device *phydev,
 				   char *led,
 				   u8 default_mode)
 {
+	struct vsc8531_private *priv = phydev->priv;
 	struct device *dev = &phydev->mdio.dev;
 	struct device_node *of_node = dev->of_node;
 	u8 led_mode;
@@ -411,7 +428,7 @@ static int vsc85xx_dt_led_mode_get(struct phy_device *phydev,
 
 	led_mode = default_mode;
 	err = of_property_read_u8(of_node, led, &led_mode);
-	if (!err && (led_mode > 15 || led_mode == 7 || led_mode == 11)) {
+	if (!err && !(BIT(led_mode) & priv->supp_led_modes)) {
 		phydev_err(phydev, "DT %s invalid\n", led);
 		return -EINVAL;
 	}
@@ -655,6 +672,7 @@ static int vsc85xx_probe(struct phy_device *phydev)
 
 	vsc8531->rate_magic = rate_magic;
 	vsc8531->nleds = 2;
+	vsc8531->supp_led_modes = VSC85XX_SUPP_LED_MODES;
 
 	return vsc85xx_dt_led_modes_get(phydev, default_mode);
 }
-- 
2.17.1
