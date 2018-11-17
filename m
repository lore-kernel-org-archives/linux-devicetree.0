From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 7/7] net: phy: icplus: allow configuring the interrupt function on IP101GR
Date: Sat, 17 Nov 2018 19:20:07 +0100
Message-ID: <20181117182007.14791-8-martin.blumenstingl@googlemail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The IP101GR is a 32-pin QFN package variant of the IP101G/IP101GA
Ethernet PHY. Due to it's limited amount of pins the RXER (receive
error) and INTR32 (interrupt) functions share pin 21.
By default the PHY is configured to output the "receive error" status on
pin 21. Depending on the board layout and requirements we may want to
re-configure the PHY to output the interrupt signal there.

The mode of pin 21 can be configured in the "Digital I/O Specific
Control Register" (register 29), bit 2:
- 0 = RXER function
- 1 = INTR(32) function

Depending on the devicetree configuration we will now:
- change the mode to either ther RXER or INTR32 function
- keep the SEL_INTR32 value set by the bootloader (default) if no
  configuration is provided (to ensure that we're not breaking existing
  boards)

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/icplus.c | 71 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index 3dc8bbbe746b..a27e15cb3366 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -25,6 +25,7 @@
 #include <linux/mii.h>
 #include <linux/ethtool.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -48,6 +49,23 @@ MODULE_LICENSE("GPL");
 #define IP101A_G_IRQ_DUPLEX_CHANGE	BIT(1)
 #define IP101A_G_IRQ_LINK_CHANGE	BIT(0)
 
+#define IP101G_DIGITAL_IO_SPEC_CTRL			0x1d
+#define IP101G_DIGITAL_IO_SPEC_CTRL_SEL_INTR32		BIT(2)
+
+/* The 32-pin IP101GR package can re-configure the mode of the RXER/INTR_32 pin
+ * (pin number 21). The hardware default is RXER (receive error) mode. But it
+ * can be configured to interrupt mode manually.
+ */
+enum ip101gr_sel_intr32 {
+	IP101GR_SEL_INTR32_KEEP,
+	IP101GR_SEL_INTR32_INTR,
+	IP101GR_SEL_INTR32_RXER,
+};
+
+struct ip101a_g_phy_priv {
+	enum ip101gr_sel_intr32 sel_intr32;
+};
+
 static int ip175c_config_init(struct phy_device *phydev)
 {
 	int err, i;
@@ -184,14 +202,64 @@ static int ip175c_config_aneg(struct phy_device *phydev)
 	return 0;
 }
 
+static int ip101a_g_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct ip101a_g_phy_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (device_property_read_bool(dev, "icplus,select-rx-error"))
+		priv->sel_intr32 = IP101GR_SEL_INTR32_RXER;
+	else if (device_property_read_bool(dev, "icplus,select-interrupt"))
+		priv->sel_intr32 = IP101GR_SEL_INTR32_INTR;
+	else
+		priv->sel_intr32 = IP101GR_SEL_INTR32_KEEP;
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
 static int ip101a_g_config_init(struct phy_device *phydev)
 {
-	int c;
+	struct ip101a_g_phy_priv *priv = phydev->priv;
+	int err, c;
 
 	c = ip1xx_reset(phydev);
 	if (c < 0)
 		return c;
 
+	/* configure the RXER/INTR_32 pin of the 32-pin IP101GR if needed: */
+	switch (priv->sel_intr32) {
+	case IP101GR_SEL_INTR32_RXER:
+		err = phy_modify(phydev, IP101G_DIGITAL_IO_SPEC_CTRL,
+				 IP101G_DIGITAL_IO_SPEC_CTRL_SEL_INTR32, 0);
+		if (err < 0)
+			return err;
+		break;
+
+	case IP101GR_SEL_INTR32_INTR:
+		err = phy_modify(phydev, IP101G_DIGITAL_IO_SPEC_CTRL,
+				 IP101G_DIGITAL_IO_SPEC_CTRL_SEL_INTR32,
+				 IP101G_DIGITAL_IO_SPEC_CTRL_SEL_INTR32);
+		if (err < 0)
+			return err;
+		break;
+
+	default:
+		/* Don't touch IP101G_DIGITAL_IO_SPEC_CTRL because it's not
+		 * documented on IP101A and it's not clear whether this would
+		 * cause problems.
+		 * For the 32-pin IP101GR we simply keep the SEL_INTR32
+		 * configuration as set by the bootloader when not configured
+		 * to one of the special functions.
+		 */
+		break;
+	}
+
 	/* Enable Auto Power Saving mode */
 	c = phy_read(phydev, IP10XX_SPEC_CTRL_STATUS);
 	c |= IP101A_G_APS_ON;
@@ -257,6 +325,7 @@ static struct phy_driver icplus_driver[] = {
 	.name		= "ICPlus IP101A/G",
 	.phy_id_mask	= 0x0ffffff0,
 	.features	= PHY_BASIC_FEATURES,
+	.probe		= ip101a_g_probe,
 	.config_intr	= ip101a_g_config_intr,
 	.did_interrupt	= ip101a_g_did_interrupt,
 	.ack_interrupt	= ip101a_g_ack_interrupt,
-- 
2.19.1
