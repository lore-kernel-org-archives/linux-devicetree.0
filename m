From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 08/11] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 5 Nov 2013 09:49:40 +0800
Message-ID: <1383616183-10511-9-git-send-email-peter.chen@freescale.com>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383616183-10511-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some PHY bugs are fixed by IC logic, but these bits are not
enabled by default, so we enable them at driver.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |   32 ++++++++++++++++++++++++++++++--
 1 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index c794011..b7e1744 100644
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
@@ -60,6 +64,18 @@
  */
 #define MXS_PHY_SENDING_SOF_TOO_FAST		BIT(2)
 
+/*
+ * IC fix for MXS_PHY_ABNORAML_IN_SUSPEND, bit 17 is the effective bit
+ * in HW_USBPHY_IP.
+ */
+#define MXS_PHY_FIX_ABNORAML_IN_SUSPEND		BIT(17)
+
+/*
+ * IC fix for MXS_PHY_SENDING_SOF_TOO_FAST, bit 18 is the effective bit
+ * in HW_USBPHY_IP.
+ */
+#define MXS_PHY_FIX_SENDING_SOF_TOO_FAST	BIT(18)
+
 struct mxs_phy_platform_flag {
 	unsigned int flags;
 };
@@ -70,11 +86,14 @@ static const struct mxs_phy_platform_flag imx23_phy_data = {
 
 static const struct mxs_phy_platform_flag imx6q_phy_data = {
 	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
-		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_FIX_ABNORAML_IN_SUSPEND,
 };
 
 static const struct mxs_phy_platform_flag imx6sl_phy_data = {
-	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_FIX_ABNORAML_IN_SUSPEND |
+		MXS_PHY_FIX_SENDING_SOF_TOO_FAST,
 };
 
 static const struct of_device_id mxs_phy_dt_ids[] = {
@@ -118,6 +137,15 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 		BM_USBPHY_CTRL_ENUTMILEVEL3,
 	       base + HW_USBPHY_CTRL_SET);
 
+	/* Enable IC solution */
+	if (mxs_phy->flags & MXS_PHY_FIX_ABNORAML_IN_SUSPEND)
+		writel(MXS_PHY_FIX_ABNORAML_IN_SUSPEND,
+			base + HW_USBPHY_IP_SET);
+
+	if (mxs_phy->flags & MXS_PHY_FIX_SENDING_SOF_TOO_FAST)
+		writel(MXS_PHY_FIX_SENDING_SOF_TOO_FAST,
+			base + HW_USBPHY_IP_SET);
+
 	return 0;
 }
 
-- 
1.7.1


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
