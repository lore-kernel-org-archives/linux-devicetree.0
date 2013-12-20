From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v7 07/14] usb: phy-mxs: change description of usb device speed
Date: Fri, 20 Dec 2013 15:52:03 +0800
Message-ID: <1387525930-27313-8-git-send-email-peter.chen@freescale.com>
References: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387525930-27313-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Change "high speed" to "HS"
Change "non-high speed" to "FS/LS"

Implementation of notify_suspend and notify_resume will be different
according to mxs_phy_data->flags.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 0ef930a..489096f 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -166,8 +166,8 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
 static int mxs_phy_on_connect(struct usb_phy *phy,
 		enum usb_device_speed speed)
 {
-	dev_dbg(phy->dev, "%s speed device has connected\n",
-		(speed == USB_SPEED_HIGH) ? "high" : "non-high");
+	dev_dbg(phy->dev, "%s device has connected\n",
+		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
 
 	if (speed == USB_SPEED_HIGH)
 		writel(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
@@ -179,8 +179,8 @@ static int mxs_phy_on_connect(struct usb_phy *phy,
 static int mxs_phy_on_disconnect(struct usb_phy *phy,
 		enum usb_device_speed speed)
 {
-	dev_dbg(phy->dev, "%s speed device has disconnected\n",
-		(speed == USB_SPEED_HIGH) ? "high" : "non-high");
+	dev_dbg(phy->dev, "%s device has disconnected\n",
+		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
 
 	if (speed == USB_SPEED_HIGH)
 		writel(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
