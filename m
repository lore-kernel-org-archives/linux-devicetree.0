From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 2/9] phy: phy-mt65xx-usb3: increase LFPS filter threshold
Date: Fri, 31 Mar 2017 15:35:28 +0800
Message-ID: <1490945735-9531-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1490945735-9531-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490945735-9531-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Increase LFPS filter threshold to avoid some fake remote wakeup
signal which cause U3 link fail and link to U2 only at about
0.01% probability.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/phy-mt65xx-usb3.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/phy-mt65xx-usb3.c b/drivers/phy/phy-mt65xx-usb3.c
index fe2392a..4fd47d0 100644
--- a/drivers/phy/phy-mt65xx-usb3.c
+++ b/drivers/phy/phy-mt65xx-usb3.c
@@ -106,6 +106,10 @@
 #define P3A_RG_XTAL_EXT_EN_U3		GENMASK(11, 10)
 #define P3A_RG_XTAL_EXT_EN_U3_VAL(x)	((0x3 & (x)) << 10)
 
+#define U3P_U3_PHYD_LFPS1		(SSUSB_SIFSLV_U3PHYD_BASE + 0x000c)
+#define P3D_RG_FWAKE_TH		GENMASK(21, 16)
+#define P3D_RG_FWAKE_TH_VAL(x)	((0x3f & (x)) << 16)
+
 #define U3P_PHYD_CDR1		(SSUSB_SIFSLV_U3PHYD_BASE + 0x005c)
 #define P3D_RG_CDR_BIR_LTD1		GENMASK(28, 24)
 #define P3D_RG_CDR_BIR_LTD1_VAL(x)	((0x1f & (x)) << 24)
@@ -303,6 +307,11 @@ static void phy_instance_init(struct mt65xx_u3phy *u3phy,
 	tmp |= P3D_RG_CDR_BIR_LTD0_VAL(0xc) | P3D_RG_CDR_BIR_LTD1_VAL(0x3);
 	writel(tmp, port_base + U3P_PHYD_CDR1);
 
+	tmp = readl(port_base + U3P_U3_PHYD_LFPS1);
+	tmp &= ~P3D_RG_FWAKE_TH;
+	tmp |= P3D_RG_FWAKE_TH_VAL(0x34);
+	writel(tmp, port_base + U3P_U3_PHYD_LFPS1);
+
 	tmp = readl(port_base + U3P_U3_PHYD_RXDET1);
 	tmp &= ~P3D_RG_RXDET_STB2_SET;
 	tmp |= P3D_RG_RXDET_STB2_SET_VAL(0x10);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
