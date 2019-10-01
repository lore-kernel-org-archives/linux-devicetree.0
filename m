From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 2/3] net: phy: realtek: add config hack for
 broken RTL8211E on Pine64+ boards
Date: Tue,  1 Oct 2019 16:29:11 +0800
Message-ID: <20191001082912.12905-3-icenowy@aosc.io>
References: <20191001082912.12905-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBEE6ZTWAKGQEUJO5Z7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20191001082912.12905-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some RTL8211E chips have broken GbE function, which needs a hack to
fix.

Currently only some Pine64+ boards are known to used this broken batch
of RTL8211E chips.

Enable this hack when a certain device tree property is set.

As this hack is not documented on the datasheet at all, it contains
magic numbers, and could not be revealed. These magic numbers are
received from Realtek via Pine64.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/net/phy/realtek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 677c45985338..f696f2085368 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -9,6 +9,7 @@
  * Copyright (c) 2004 Freescale Semiconductor, Inc.
  */
 #include <linux/bitops.h>
+#include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/module.h>
 
@@ -32,6 +33,12 @@
 #define RTL8211E_TX_DELAY			BIT(1)
 #define RTL8211E_RX_DELAY			BIT(2)
 #define RTL8211E_MODE_MII_GMII			BIT(3)
+/* The following number resides in the same register with
+ * the delay bits and mode bit above. However, no known
+ * document can explain this, and this value is directly
+ * received from Realtek via Pine64.
+ */
+#define RTL8211E_CONF_MAGIC_PINE64		0xb400
 
 #define RTL8201F_ISR				0x1e
 #define RTL8201F_IER				0x13
@@ -196,6 +203,7 @@ static int rtl8211e_config_init(struct phy_device *phydev)
 {
 	int ret = 0, oldpage;
 	u16 val;
+	struct device_node *of_node = phydev->mdio.dev.of_node;
 
 	/* enable TX/RX delay for rgmii-* modes, and disable them for rgmii. */
 	switch (phydev->interface) {
@@ -234,6 +242,12 @@ static int rtl8211e_config_init(struct phy_device *phydev)
 	ret = __phy_modify(phydev, 0x1c, RTL8211E_TX_DELAY | RTL8211E_RX_DELAY,
 			   val);
 
+	if (of_node &&
+	    of_property_read_bool(of_node, "realtek,config-magic-for-pine64")) {
+		ret = __phy_modify(phydev, 0x1c, GENMASK(15, 8),
+				   RTL8211E_CONF_MAGIC_PINE64);
+	}
+
 err_restore_page:
 	return phy_restore_page(phydev, oldpage, ret);
 }
-- 
2.21.0
