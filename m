From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCH v3 2/8] phy: phy-mt65xx-usb3: increase LFPS filter
 threshold
Date: Mon, 6 Mar 2017 21:49:23 +0800
Message-ID: <1488808169-6031-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1488808169-6031-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488808169-6031-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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
