From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 15/67] usb: gadget: pxa27x_udc: add devicetree support
Date: Fri, 17 Oct 2014 12:16:22 -0500
Message-ID: <1413566234-13537-16-git-send-email-balbi@ti.com>
References: <1413566234-13537-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413566234-13537-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Paul Zimmerman <paul.zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>

Add support for device-tree device discovery. If devicetree is not
provided, fallback to legacy platform data "discovery".

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 5280f64..55598c0 100644
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
@@ -2427,6 +2435,8 @@ static int pxa_udc_probe(struct platform_device *pdev)
 			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
 		}
 		udc->udc_command = mach->udc_command;
+	} else {
+		udc->gpiod = devm_gpiod_get(&pdev->dev, NULL);
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2618,6 +2628,7 @@ static struct platform_driver udc_driver = {
 	.driver		= {
 		.name	= "pxa27x-udc",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(udc_pxa_dt_ids),
 	},
 	.probe		= pxa_udc_probe,
 	.remove		= pxa_udc_remove,
-- 
2.1.0.GIT

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
