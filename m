From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v3 07/11] usb: phy-mxs: Add implementation of nofity_suspend and notify_resume
Date: Tue, 5 Nov 2013 09:49:39 +0800
Message-ID: <1383616183-10511-8-git-send-email-peter.chen@freescale.com>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Implementation of notify_suspend and notify_resume will be different
according to mxs_phy_platform_flag->flags.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 drivers/usb/phy/phy-mxs-usb.c |   54 +++++++++++++++++++++++++++++++++++++---
 1 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 8cdfbf1..c794011 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -161,8 +161,8 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
 static int mxs_phy_on_connect(struct usb_phy *phy,
 		enum usb_device_speed speed)
 {
-	dev_dbg(phy->dev, "%s speed device has connected\n",
-		(speed == USB_SPEED_HIGH) ? "high" : "non-high");
+	dev_dbg(phy->dev, "%s device has connected\n",
+		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
 
 	if (speed == USB_SPEED_HIGH)
 		writel(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
@@ -174,8 +174,8 @@ static int mxs_phy_on_connect(struct usb_phy *phy,
 static int mxs_phy_on_disconnect(struct usb_phy *phy,
 		enum usb_device_speed speed)
 {
-	dev_dbg(phy->dev, "%s speed device has disconnected\n",
-		(speed == USB_SPEED_HIGH) ? "high" : "non-high");
+	dev_dbg(phy->dev, "%s device has disconnected\n",
+		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
 
 	if (speed == USB_SPEED_HIGH)
 		writel(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
@@ -184,6 +184,48 @@ static int mxs_phy_on_disconnect(struct usb_phy *phy,
 	return 0;
 }
 
+static int mxs_phy_on_suspend(struct usb_phy *phy,
+		enum usb_device_speed speed)
+{
+	struct mxs_phy *mxs_phy = to_mxs_phy(phy);
+
+	dev_dbg(phy->dev, "%s device has suspended\n",
+		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
+
+	/* delay 4ms to wait bus entering idle */
+	usleep_range(4000, 5000);
+
+	if (mxs_phy->flags & MXS_PHY_ABNORAML_IN_SUSPEND) {
+		writel_relaxed(0xffffffff, phy->io_priv + HW_USBPHY_PWD);
+		writel_relaxed(0, phy->io_priv + HW_USBPHY_PWD);
+	}
+
+	if (speed == USB_SPEED_HIGH)
+		writel_relaxed(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
+				phy->io_priv + HW_USBPHY_CTRL_CLR);
+
+	return 0;
+}
+
+/*
+ * The resume signal must be finished here.
+ */
+static int mxs_phy_on_resume(struct usb_phy *phy,
+		enum usb_device_speed speed)
+{
+	dev_dbg(phy->dev, "%s device has resumed\n",
+		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
+
+	if (speed == USB_SPEED_HIGH) {
+		/* Make sure the device has switched to High-Speed mode */
+		udelay(500);
+		writel_relaxed(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
+				phy->io_priv + HW_USBPHY_CTRL_SET);
+	}
+
+	return 0;
+}
+
 static int mxs_phy_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -239,6 +281,10 @@ static int mxs_phy_probe(struct platform_device *pdev)
 
 	mxs_phy->clk = clk;
 	mxs_phy->flags = platform_flag->flags;
+	if (mxs_phy->flags & MXS_PHY_SENDING_SOF_TOO_FAST) {
+		mxs_phy->phy.notify_suspend = mxs_phy_on_suspend;
+		mxs_phy->phy.notify_resume = mxs_phy_on_resume;
+	}
 
 	platform_set_drvdata(pdev, &mxs_phy->phy);
 
-- 
1.7.1


