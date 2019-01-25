From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 1/3] net: phy: at803x: Introduce quirk to disable SmartEEE
Date: Fri, 25 Jan 2019 12:55:11 +0000
Message-ID: <20190125125513.23656-2-ccaione@baylibre.com>
References: <20190125125513.23656-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125125513.23656-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, aisheng.dong@nxp.com, abailon@baylibre.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

The proprietary SmartEEE mode makes the PHY entering a sleep mode after
a configurable idle time. It does this without LPI signals coming from
MAC.

Since this is a configurable behavior and it is known to cause issues
add a way to disable it using a custom quirk.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/net/phy/at803x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index f9432d053a22..509cd7a4f7eb 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -38,12 +38,14 @@
 #define AT803X_DEVICE_ADDR			0x03
 #define AT803X_LOC_MAC_ADDR_0_15_OFFSET		0x804C
 #define AT803X_LOC_MAC_ADDR_16_31_OFFSET	0x804B
+#define AT803X_SMARTEEE_CTL3_OFFSET		0x805D
 #define AT803X_LOC_MAC_ADDR_32_47_OFFSET	0x804A
 #define AT803X_MMD_ACCESS_CONTROL		0x0D
 #define AT803X_MMD_ACCESS_CONTROL_DATA		0x0E
 #define AT803X_FUNC_DATA			0x4003
 #define AT803X_REG_CHIP_CONFIG			0x1f
 #define AT803X_BT_BX_REG_SEL			0x8000
+#define AT803X_SMARTEEE_DISABLED_VAL		0x1000
 
 #define AT803X_DEBUG_ADDR			0x1D
 #define AT803X_DEBUG_DATA			0x1E
@@ -65,12 +67,15 @@
 #define ATH8035_PHY_ID 0x004dd072
 #define AT803X_PHY_ID_MASK			0xffffffef
 
+#define AT803X_SMARTEEE_FEATURE_DISABLE		BIT(1)
+
 MODULE_DESCRIPTION("Atheros 803x PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
 
 struct at803x_priv {
 	bool phy_reset:1;
+	u32 quirks;
 };
 
 struct at803x_context {
@@ -210,6 +215,13 @@ static void at803x_get_wol(struct phy_device *phydev,
 		wol->wolopts |= WAKE_MAGIC;
 }
 
+static int at803x_disable_smarteee(struct phy_device *phydev)
+{
+	return phy_write_mmd(phydev, AT803X_DEVICE_ADDR,
+			     AT803X_SMARTEEE_CTL3_OFFSET,
+			     AT803X_SMARTEEE_DISABLED_VAL);
+}
+
 static int at803x_suspend(struct phy_device *phydev)
 {
 	int value;
@@ -242,6 +254,9 @@ static int at803x_probe(struct phy_device *phydev)
 	if (!priv)
 		return -ENOMEM;
 
+	if (of_property_read_bool(dev->of_node, "at803x,smarteee-disabled"))
+		priv->quirks |= AT803X_SMARTEEE_FEATURE_DISABLE;
+
 	phydev->priv = priv;
 
 	return 0;
@@ -249,6 +264,7 @@ static int at803x_probe(struct phy_device *phydev)
 
 static int at803x_config_init(struct phy_device *phydev)
 {
+	struct at803x_priv *priv = phydev->priv;
 	int ret;
 
 	ret = genphy_config_init(phydev);
@@ -269,6 +285,12 @@ static int at803x_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
+	if (priv->quirks & AT803X_SMARTEEE_FEATURE_DISABLE) {
+		ret = at803x_disable_smarteee(phydev);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.19.1
