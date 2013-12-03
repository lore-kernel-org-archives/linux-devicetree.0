From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 03/17] usb: phy-mxs: Add auto clock and power setting
Date: Tue, 3 Dec 2013 15:36:57 +0800
Message-ID: <1386056231-17258-4-git-send-email-peter.chen@freescale.com>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386056231-17258-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

With the auto setting, the PHY's clock and power can be
recovered correctly from low power mode, it is ganranteed by IC logic.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index f6cbc78..70b084d 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -31,6 +31,11 @@
 
 #define BM_USBPHY_CTRL_SFTRST			BIT(31)
 #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
+#define BM_USBPHY_CTRL_ENAUTOSET_USBCLKS	BIT(26)
+#define BM_USBPHY_CTRL_ENAUTOCLR_USBCLKGATE	BIT(25)
+#define BM_USBPHY_CTRL_ENAUTOCLR_PHY_PWD	BIT(20)
+#define BM_USBPHY_CTRL_ENAUTOCLR_CLKGATE	BIT(19)
+#define BM_USBPHY_CTRL_ENAUTO_PWRON_PLL		BIT(18)
 #define BM_USBPHY_CTRL_ENUTMILEVEL3		BIT(15)
 #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
 #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
@@ -96,9 +101,18 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	/* Power up the PHY */
 	writel(0, base + HW_USBPHY_PWD);
 
-	/* enable FS/LS device */
-	writel(BM_USBPHY_CTRL_ENUTMILEVEL2 |
-	       BM_USBPHY_CTRL_ENUTMILEVEL3,
+	/*
+	 * USB PHY Ctrl Setting
+	 * - Auto clock/power on
+	 * - Enable full/low speed support
+	 */
+	writel(BM_USBPHY_CTRL_ENAUTOSET_USBCLKS |
+		BM_USBPHY_CTRL_ENAUTOCLR_USBCLKGATE |
+		BM_USBPHY_CTRL_ENAUTOCLR_PHY_PWD |
+		BM_USBPHY_CTRL_ENAUTOCLR_CLKGATE |
+		BM_USBPHY_CTRL_ENAUTO_PWRON_PLL |
+		BM_USBPHY_CTRL_ENUTMILEVEL2 |
+		BM_USBPHY_CTRL_ENUTMILEVEL3,
 	       base + HW_USBPHY_CTRL_SET);
 
 	return 0;
-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
