From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v6 partial v2 3/3] usb: gadget: pxa27x_udc: add devicetree support
Date: Wed, 24 Sep 2014 23:06:01 +0200
Message-ID: <1411592761-417-3-git-send-email-robert.jarzmik@free.fr>
References: <1411592761-417-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411592761-417-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Since v5: split out into 2 patches, this one being the true device-tree port
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index e11f9c5..8961530 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -27,6 +27,8 @@
 #include <linux/prefetch.h>
 #include <linux/byteorder/generic.h>
 #include <linux/platform_data/pxa2xx_udc.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
 
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
@@ -2400,6 +2402,12 @@ static struct pxa_udc memory = {
 	}
 };
 
+static struct of_device_id udc_pxa_dt_ids[] = {
+	{ .compatible = "marvell,pxa270-udc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, udc_pxa_dt_ids);
+
 /**
  * pxa_udc_probe - probes the udc device
  * @_dev: platform device
@@ -2417,6 +2425,8 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	if (mach) {
 		udc->gpiod = gpio_to_desc(mach->gpio_pullup);
 		udc->udc_command = mach->udc_command;
+	} else {
+		udc->gpiod = devm_gpiod_get(&pdev->dev, NULL);
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2608,6 +2618,7 @@ static struct platform_driver udc_driver = {
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
