From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v12 07/15] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Mon, 3 Mar 2014 16:41:50 +0800
Message-ID: <1393836118-4265-8-git-send-email-peter.chen@freescale.com>
References: <1393836118-4265-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393836118-4265-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Two PHY bugs are fixed by IC logic, but these bits are not
enabled by default, so we enable them at driver.
The two bugs are: MXS_PHY_ABNORMAL_IN_SUSPEND and MXS_PHY_SENDING_SOF_TOO_FAST
which are described at code.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |   23 +++++++++++++++++++++--
 1 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 1663a66..cb71135 100644
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
@@ -60,6 +66,14 @@
  */
 #define MXS_PHY_SENDING_SOF_TOO_FAST		BIT(2)
 
+/*
+ * IC has bug fixes logic, they include
+ * MXS_PHY_ABNORMAL_IN_SUSPEND and MXS_PHY_SENDING_SOF_TOO_FAST
+ * which are described at above flags, the RTL will handle it
+ * according to different versions.
+ */
+#define MXS_PHY_NEED_IP_FIX			BIT(3)
+
 struct mxs_phy_data {
 	unsigned int flags;
 };
@@ -70,11 +84,13 @@ static const struct mxs_phy_data imx23_phy_data = {
 
 static const struct mxs_phy_data imx6q_phy_data = {
 	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
-		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_NEED_IP_FIX,
 };
 
 static const struct mxs_phy_data imx6sl_phy_data = {
-	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_NEED_IP_FIX,
 };
 
 static const struct of_device_id mxs_phy_dt_ids[] = {
@@ -118,6 +134,9 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 		BM_USBPHY_CTRL_ENUTMILEVEL3,
 	       base + HW_USBPHY_CTRL_SET);
 
+	if (mxs_phy->data->flags & MXS_PHY_NEED_IP_FIX)
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
