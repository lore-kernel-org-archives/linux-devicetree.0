Return-Path: <devicetree-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:41632 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718Ab3HUIl3 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 04:41:29 -0400
Date: Wed, 21 Aug 2013 11:41:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] usb: phy: signedness bugs in suspend/resume functions
Message-ID: <20130821084122.GL5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

"ret" needs to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't compile this.

diff --git a/drivers/usb/phy/phy-omap-usb2.c b/drivers/usb/phy/phy-omap-usb2.c
index 844ab68..d266861 100644
--- a/drivers/usb/phy/phy-omap-usb2.c
+++ b/drivers/usb/phy/phy-omap-usb2.c
@@ -98,8 +98,8 @@ static int omap_usb_set_peripheral(struct usb_otg *otg,
 
 static int omap_usb2_suspend(struct usb_phy *x, int suspend)
 {
-	u32 ret;
 	struct omap_usb *phy = phy_to_omapusb(x);
+	int ret;
 
 	if (suspend && !phy->is_suspended) {
 		omap_control_usb_phy_power(phy->control_dev, 0);
@@ -108,8 +108,7 @@ static int omap_usb2_suspend(struct usb_phy *x, int suspend)
 	} else if (!suspend && phy->is_suspended) {
 		ret = pm_runtime_get_sync(phy->dev);
 		if (ret < 0) {
-			dev_err(phy->dev, "get_sync failed with err %d\n",
-									ret);
+			dev_err(phy->dev, "get_sync failed with err %d\n", ret);
 			return ret;
 		}
 		omap_control_usb_phy_power(phy->control_dev, 1);
@@ -209,9 +208,9 @@ static int omap_usb2_runtime_suspend(struct device *dev)
 
 static int omap_usb2_runtime_resume(struct device *dev)
 {
-	u32 ret = 0;
 	struct platform_device	*pdev = to_platform_device(dev);
 	struct omap_usb	*phy = platform_get_drvdata(pdev);
+	int ret;
 
 	ret = clk_enable(phy->wkupclk);
 	if (ret < 0) {
