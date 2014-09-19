From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v6 2/5] usb: gadget: pxa27x_udc: add devicetree support
Date: Fri, 19 Sep 2014 21:46:23 +0200
Message-ID: <1411155986-14895-2-git-send-email-robert.jarzmik@free.fr>
References: <1411155986-14895-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411155986-14895-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for device-tree device discovery. If devicetree is not
provided, fallback to legacy platform data "discovery".

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

---
Since V1: change OF id mrvl,pxa27x_udc -> marvell,pxa27x-udc
          This is a consequence of other DT reviews on the marvell
          namings.
Since V2: address Mark's comments:
            - wildcard pxa27x becomes pxa270
            - pullup gpio is described as standard dt gpio
            - bool XXX_probe_dt becomes int XXX_probe_dt
Since v5: split out into 2 patches, this one being the second
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 44 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 0e356c0..42f4929 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -26,6 +26,8 @@
 #include <linux/prefetch.h>
 #include <linux/byteorder/generic.h>
 #include <linux/platform_data/pxa2xx_udc.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
 
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
@@ -2405,6 +2407,41 @@ static struct pxa_udc memory = {
 	}
 };
 
+static struct of_device_id udc_pxa_dt_ids[] = {
+	{ .compatible = "marvell,pxa270-udc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, udc_pxa_dt_ids);
+
+/**
+ * pxa_udc_probe_dt - device tree specific probe
+ * @pdev: platform data
+ * @udc: pxa_udc structure to fill
+ *
+ * Fills udc from platform data out of device tree.
+ *
+ * Returns 0 if DT found, 1 if DT not found, and <0 on error
+ */
+static int pxa_udc_probe_dt(struct platform_device *pdev, struct pxa_udc *udc)
+{
+	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *of_id =
+			of_match_device(udc_pxa_dt_ids, &pdev->dev);
+	u32 gpio_pullup;
+	enum of_gpio_flags flags;
+
+	if (!np || !of_id)
+		return 1;
+	pdev->id = -1;
+
+	gpio_pullup = of_get_gpio_flags(np, 0, &flags);
+	if (gpio_pullup >= 0) {
+		udc->gpio_pullup = gpio_pullup;
+		udc->gpio_pullup_inverted = (flags & OF_GPIO_ACTIVE_LOW);
+	}
+	return 0;
+}
+
 /**
  * pxa_udc_probe_pdata - legacy platform data probe
  * @pdev: platform device
@@ -2433,7 +2470,11 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0;
 
-	pxa_udc_probe_pdata(pdev, udc);
+	retval = pxa_udc_probe_dt(pdev, udc);
+	if (retval < 0)
+		return retval;
+	if (retval > 0)
+		pxa_udc_probe_pdata(pdev, udc);
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs)
@@ -2633,6 +2674,7 @@ static struct platform_driver udc_driver = {
 	.driver		= {
 		.name	= "pxa27x-udc",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(udc_pxa_dt_ids),
 	},
 	.probe		= pxa_udc_probe,
 	.remove		= pxa_udc_remove,
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
