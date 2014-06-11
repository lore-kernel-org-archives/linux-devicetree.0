From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [RESEND DT 1/2] usb: gadget: pxa27x_udc: add devicetree support
Date: Wed, 11 Jun 2014 23:12:20 +0200
Message-ID: <1402521141-26235-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for device-tree device discovery. If devicetree is not
provided, fallback to legacy platform data "discovery".

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 drivers/usb/gadget/pxa27x_udc.c | 105 ++++++++++++++++++++++++++++++++--------
 drivers/usb/gadget/pxa27x_udc.h |   4 ++
 2 files changed, 90 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/pxa27x_udc.c b/drivers/usb/gadget/pxa27x_udc.c
index cdf4d67..6236848 100644
--- a/drivers/usb/gadget/pxa27x_udc.c
+++ b/drivers/usb/gadget/pxa27x_udc.c
@@ -24,12 +24,15 @@
 #include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/prefetch.h>
-#include <linux/byteorder/generic.h>
-#include <linux/platform_data/pxa2xx_udc.h>
+#include <linux/of_device.h>
+
+#include <asm/byteorder.h>
+#include <mach/hardware.h>
 
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <mach/udc.h>
 
 #include "pxa27x_udc.h"
 
@@ -1508,16 +1511,16 @@ static struct usb_ep_ops pxa_ep_ops = {
 static void dplus_pullup(struct pxa_udc *udc, int on)
 {
 	if (on) {
-		if (gpio_is_valid(udc->mach->gpio_pullup))
-			gpio_set_value(udc->mach->gpio_pullup,
-				       !udc->mach->gpio_pullup_inverted);
-		if (udc->mach->udc_command)
+		if (gpio_is_valid(udc->gpio_pullup))
+			gpio_set_value(udc->gpio_pullup,
+				       !udc->gpio_pullup_inverted);
+		if (udc->mach && udc->mach->udc_command)
 			udc->mach->udc_command(PXA2XX_UDC_CMD_CONNECT);
 	} else {
-		if (gpio_is_valid(udc->mach->gpio_pullup))
-			gpio_set_value(udc->mach->gpio_pullup,
-				       udc->mach->gpio_pullup_inverted);
-		if (udc->mach->udc_command)
+		if (gpio_is_valid(udc->gpio_pullup))
+			gpio_set_value(udc->gpio_pullup,
+				       udc->gpio_pullup_inverted);
+		if (udc->mach && udc->mach->udc_command)
 			udc->mach->udc_command(PXA2XX_UDC_CMD_DISCONNECT);
 	}
 	udc->pullup_on = on;
@@ -1609,7 +1612,8 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
 
-	if (!gpio_is_valid(udc->mach->gpio_pullup) && !udc->mach->udc_command)
+	if (!gpio_is_valid(udc->gpio_pullup)
+	    && !(udc->mach && udc->mach->udc_command))
 		return -EOPNOTSUPP;
 
 	dplus_pullup(udc, is_active);
@@ -2404,6 +2408,56 @@ static struct pxa_udc memory = {
 	}
 };
 
+static struct of_device_id udc_pxa_dt_ids[] = {
+	{ .compatible = "mrvl,pxa27x_udc" },
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
+bool pxa_udc_probe_dt(struct platform_device *pdev, struct pxa_udc *udc)
+{
+	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *of_id =
+			of_match_device(udc_pxa_dt_ids, &pdev->dev);
+	int ret;
+	u32 gpio_pullup;
+
+	if (!np || !of_id)
+		return 1;
+	ret = of_alias_get_id(np, "udc");
+	pdev->id = (ret >= 0) ? ret : -1;
+
+	if (!of_property_read_u32(np, "udc-pullup-gpio", &gpio_pullup))
+		udc->gpio_pullup = gpio_pullup;
+	udc->gpio_pullup_inverted =
+		of_property_read_bool(np, "udc-pullup-gpio-inverted");
+	return 0;
+}
+
+/**
+ * pxa_udc_probe_pdata - legacy platform data probe
+ * @pdev: platform device
+ * @udc: pxa_udc structure to fill
+ *
+ * Simple copy of data from platform_data to udc control structure
+ */
+static void pxa_udc_probe_pdata(struct platform_device *pdev,
+			       struct pxa_udc *udc)
+{
+	udc->mach = dev_get_platdata(&pdev->dev);
+	udc->gpio_pullup = udc->mach->gpio_pullup;
+	udc->gpio_pullup_inverted = udc->mach->gpio_pullup_inverted;
+}
+
 /**
  * pxa_udc_probe - probes the udc device
  * @_dev: platform device
@@ -2415,7 +2469,13 @@ static int pxa_udc_probe(struct platform_device *pdev)
 {
 	struct resource *regs;
 	struct pxa_udc *udc = &memory;
-	int retval = 0, gpio;
+	int retval = 0;
+
+	retval = pxa_udc_probe_dt(pdev, udc);
+	if (retval < 0)
+		return retval;
+	if (retval > 0)
+		pxa_udc_probe_pdata(pdev, udc);
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs)
@@ -2425,19 +2485,17 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		return udc->irq;
 
 	udc->dev = &pdev->dev;
-	udc->mach = dev_get_platdata(&pdev->dev);
 	udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
 
-	gpio = udc->mach->gpio_pullup;
-	if (gpio_is_valid(gpio)) {
-		retval = gpio_request(gpio, "USB D+ pullup");
+	if (gpio_is_valid(udc->gpio_pullup)) {
+		retval = gpio_request(udc->gpio_pullup, "USB D+ pullup");
 		if (retval == 0)
-			gpio_direction_output(gpio,
-				       udc->mach->gpio_pullup_inverted);
+			gpio_direction_output(udc->gpio_pullup,
+				       udc->gpio_pullup_inverted);
 	}
 	if (retval) {
 		dev_err(&pdev->dev, "Couldn't request gpio %d : %d\n",
-			gpio, retval);
+			udc->gpio_pullup, retval);
 		return retval;
 	}
 
@@ -2446,6 +2504,9 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		retval = PTR_ERR(udc->clk);
 		goto err_clk;
 	}
+	retval = clk_prepare(udc->clk);
+	if (retval)
+		goto err_clk_prepare;
 
 	retval = -ENOMEM;
 	udc->regs = ioremap(regs->start, resource_size(regs));
@@ -2483,9 +2544,13 @@ err_add_udc:
 err_irq:
 	iounmap(udc->regs);
 err_map:
+	clk_unprepare(udc->clk);
+err_clk_prepare:
 	clk_put(udc->clk);
 	udc->clk = NULL;
 err_clk:
+	if (gpio_is_valid(udc->gpio_pullup))
+		gpio_free(udc->gpio_pullup);
 	return retval;
 }
 
@@ -2509,6 +2574,7 @@ static int pxa_udc_remove(struct platform_device *_dev)
 
 	udc->transceiver = NULL;
 	the_controller = NULL;
+	clk_unprepare(udc->clk);
 	clk_put(udc->clk);
 	iounmap(udc->regs);
 
@@ -2609,6 +2675,7 @@ static struct platform_driver udc_driver = {
 	.driver		= {
 		.name	= "pxa27x-udc",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(udc_pxa_dt_ids),
 	},
 	.probe		= pxa_udc_probe,
 	.remove		= pxa_udc_remove,
diff --git a/drivers/usb/gadget/pxa27x_udc.h b/drivers/usb/gadget/pxa27x_udc.h
index 28f2b53..8995b34 100644
--- a/drivers/usb/gadget/pxa27x_udc.h
+++ b/drivers/usb/gadget/pxa27x_udc.h
@@ -421,6 +421,8 @@ struct udc_stats {
  * @driver: bound gadget (zero, g_ether, g_mass_storage, ...)
  * @dev: device
  * @mach: machine info, used to activate specific GPIO
+ * @gpio_pullup: if valid, D+ pullup GPIO
+ * @gpio_pullup_inverted: 1 if pullup has inverted logic
  * @transceiver: external transceiver to handle vbus sense and D+ pullup
  * @ep0state: control endpoint state machine state
  * @stats: statistics on udc usage
@@ -448,6 +450,8 @@ struct pxa_udc {
 	struct device				*dev;
 	struct pxa2xx_udc_mach_info		*mach;
 	struct usb_phy				*transceiver;
+	int					gpio_pullup;
+	int					gpio_pullup_inverted;
 
 	enum ep0_state				ep0state;
 	struct udc_stats			stats;
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
