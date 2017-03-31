From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 1/9] phy: phy-mt65xx-usb3: improve RX detection stable time
Date: Fri, 31 Mar 2017 15:35:27 +0800
Message-ID: <1490945735-9531-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The default value of RX detection stable time is 10us, and this
margin is too big for some critical cases which cause U3 link fail
and link to U2(probability is about 1%). So change it to 5us.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/phy-mt65xx-usb3.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/phy-mt65xx-usb3.c b/drivers/phy/phy-mt65xx-usb3.c
index d972067..fe2392a 100644
--- a/drivers/phy/phy-mt65xx-usb3.c
+++ b/drivers/phy/phy-mt65xx-usb3.c
@@ -112,6 +112,14 @@
 #define P3D_RG_CDR_BIR_LTD0		GENMASK(12, 8)
 #define P3D_RG_CDR_BIR_LTD0_VAL(x)	((0x1f & (x)) << 8)
 
+#define U3P_U3_PHYD_RXDET1		(SSUSB_SIFSLV_U3PHYD_BASE + 0x128)
+#define P3D_RG_RXDET_STB2_SET		GENMASK(17, 9)
+#define P3D_RG_RXDET_STB2_SET_VAL(x)	((0x1ff & (x)) << 9)
+
+#define U3P_U3_PHYD_RXDET2		(SSUSB_SIFSLV_U3PHYD_BASE + 0x12c)
+#define P3D_RG_RXDET_STB2_SET_P3	GENMASK(8, 0)
+#define P3D_RG_RXDET_STB2_SET_P3_VAL(x)	(0x1ff & (x))
+
 #define U3P_XTALCTL3		(SSUSB_SIFSLV_SPLLC + 0x0018)
 #define XC3_RG_U3_XTAL_RX_PWD		BIT(9)
 #define XC3_RG_U3_FRC_XTAL_RX_PWD	BIT(8)
@@ -295,6 +303,16 @@ static void phy_instance_init(struct mt65xx_u3phy *u3phy,
 	tmp |= P3D_RG_CDR_BIR_LTD0_VAL(0xc) | P3D_RG_CDR_BIR_LTD1_VAL(0x3);
 	writel(tmp, port_base + U3P_PHYD_CDR1);
 
+	tmp = readl(port_base + U3P_U3_PHYD_RXDET1);
+	tmp &= ~P3D_RG_RXDET_STB2_SET;
+	tmp |= P3D_RG_RXDET_STB2_SET_VAL(0x10);
+	writel(tmp, port_base + U3P_U3_PHYD_RXDET1);
+
+	tmp = readl(port_base + U3P_U3_PHYD_RXDET2);
+	tmp &= ~P3D_RG_RXDET_STB2_SET_P3;
+	tmp |= P3D_RG_RXDET_STB2_SET_P3_VAL(0x10);
+	writel(tmp, port_base + U3P_U3_PHYD_RXDET2);
+
 	dev_dbg(u3phy->dev, "%s(%d)\n", __func__, index);
 }
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
