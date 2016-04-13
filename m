From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv3 2/2] usb: dwc2: Add reset control to dwc2
Date: Wed, 13 Apr 2016 17:44:02 -0500
Message-ID: <1460587442-21136-2-git-send-email-dinguyen@opensource.altera.com>
References: <1460587442-21136-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460587442-21136-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Allow for platforms that have a reset controller driver in place to bring
the USB IP out of reset.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
v4: use dev_dbg() if not a -EPROBE_DEFER
v3: fix compile error
v2: move to lowlevel_hw_init()
---
 drivers/usb/dwc2/core.h     |  1 +
 drivers/usb/dwc2/platform.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 3c58d63..f748132 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -837,6 +837,7 @@ struct dwc2_hsotg {
 	void *priv;
 	int     irq;
 	struct clk *clk;
+	struct reset_control *reset;
 
 	unsigned int queuing_high_bandwidth:1;
 	unsigned int srp_success:1;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 88629be..5e89af1 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -45,6 +45,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
+#include <linux/reset.h>
 
 #include <linux/usb/of.h>
 
@@ -337,6 +338,17 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 {
 	int i, ret;
 
+	hsotg->reset = devm_reset_control_get(hsotg->dev, "dwc2");
+	if (IS_ERR(hsotg->reset)) {
+		if (PTR_ERR(hsotg->reset) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_dbg(hsotg->dev, "Could not get reset control.\n");
+		hsotg->reset = NULL;
+	}
+
+	if(hsotg->reset)
+		reset_control_deassert(hsotg->reset);
+
 	/* Set default UTMI width */
 	hsotg->phyif = GUSBCFG_PHYIF16;
 
@@ -434,6 +446,9 @@ static int dwc2_driver_remove(struct platform_device *dev)
 	if (hsotg->ll_hw_enabled)
 		dwc2_lowlevel_hw_disable(hsotg);
 
+	if (hsotg->reset)
+		reset_control_assert(hsotg->reset);
+
 	return 0;
 }
 
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
