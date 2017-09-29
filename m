From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: gadget: udc: renesas_usb3: Add suspend/resume functions
Date: Fri, 29 Sep 2017 20:45:00 +0900
Message-ID: <1506685501-24988-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support suspend/resume functions

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
[shimoda: add the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7d99774..d55a06b 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2644,11 +2644,45 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int renesas_usb3_suspend(struct device *dev)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+
+	/* Not started */
+	if (!usb3->driver)
+		return 0;
+
+	renesas_usb3_stop_controller(usb3);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int renesas_usb3_resume(struct device *dev)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+
+	/* Not started */
+	if (!usb3->driver)
+		return 0;
+
+	pm_runtime_get_sync(dev);
+	renesas_usb3_init_controller(usb3);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(renesas_usb3_pm_ops, renesas_usb3_suspend,
+			renesas_usb3_resume);
+
 static struct platform_driver renesas_usb3_driver = {
 	.probe		= renesas_usb3_probe,
 	.remove		= renesas_usb3_remove,
 	.driver		= {
 		.name =	(char *)udc_name,
+		.pm		= &renesas_usb3_pm_ops,
 		.of_match_table = of_match_ptr(usb3_of_match),
 	},
 };
-- 
1.9.1
