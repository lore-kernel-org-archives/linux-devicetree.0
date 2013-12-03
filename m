From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 09/17] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 3 Dec 2013 15:37:03 +0800
Message-ID: <1386056231-17258-10-git-send-email-peter.chen@freescale.com>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386056231-17258-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some PHY bugs are fixed by IC logic, but these bits are not
enabled by default, so we enable them at driver.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 8738890..0908d74 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -31,6 +31,10 @@
 #define HW_USBPHY_CTRL_SET			0x34
 #define HW_USBPHY_CTRL_CLR			0x38
 
+#define HW_USBPHY_IP				0x90
+#define HW_USBPHY_IP_SET			0x94
+#define HW_USBPHY_IP_CLR			0x98
+
 #define BM_USBPHY_CTRL_SFTRST			BIT(31)
 #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
 #define BM_USBPHY_CTRL_ENAUTOSET_USBCLKS	BIT(26)
@@ -42,6 +46,8 @@
 #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
 #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
 
+#define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
+
 #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
 
 /* Do disconnection between PHY and controller without vbus */
@@ -97,6 +103,16 @@ struct mxs_phy {
 	struct regmap *regmap_anatop;
 };
 
+static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx6q_phy_data;
+}
+
+static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx6sl_phy_data;
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
@@ -123,6 +139,10 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 		BM_USBPHY_CTRL_ENUTMILEVEL3,
 	       base + HW_USBPHY_CTRL_SET);
 
+	/* Enable IC solution */
+	if (is_imx6q_phy(mxs_phy) || is_imx6sl_phy(mxs_phy))
+		writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
+
 	return 0;
 }
 
-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
