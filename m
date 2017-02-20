From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 2/2] usb: host: ehci-platform: fix usb 1.1 device is not connected in system resume
Date: Mon, 20 Feb 2017 16:35:11 +0900
Message-ID: <1487576111-29287-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1487576111-29287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487576111-29287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch fixes an issue that a usb 1.1 device is not connected in
system resume and then the following message appeared if debug messages
are enabled:
	usb 2-1: Waited 2000ms for CONNECT

To resolve this issue, the EHCI controller must be resumed after its
companion controllers. So, this patch adds such code on the driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/ehci-platform.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index a268d9e..65a7725 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -34,6 +34,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ehci_pdriver.h>
+#include <linux/usb/of.h>
 
 #include "ehci.h"
 
@@ -297,6 +298,8 @@ static int ehci_platform_probe(struct platform_device *dev)
 		goto err_power;
 
 	device_wakeup_enable(hcd->self.controller);
+	if (usb_of_has_companion(hcd->self.controller))
+		device_enable_async_suspend(hcd->self.controller);
 	platform_set_drvdata(dev, hcd);
 
 	return err;
@@ -370,6 +373,7 @@ static int ehci_platform_resume(struct device *dev)
 	struct usb_ehci_pdata *pdata = dev_get_platdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
+	struct device *companion_dev;
 
 	if (pdata->power_on) {
 		int err = pdata->power_on(pdev);
@@ -377,6 +381,10 @@ static int ehci_platform_resume(struct device *dev)
 			return err;
 	}
 
+	companion_dev = usb_of_get_companion_dev(hcd->self.controller);
+	if (companion_dev)
+		device_pm_wait_for_dev(hcd->self.controller, companion_dev);
+
 	ehci_resume(hcd, priv->reset_on_resume);
 	return 0;
 }
-- 
1.9.1
