From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: [PATCH v2 2/2] usb: gadget: s3c2410: allow probing from device tree
Date: Wed, 11 Jan 2017 20:02:30 -0200
Message-ID: <1484172150-32075-3-git-send-email-sergio.prado@e-labworks.com>
References: <1484172150-32075-1-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484172150-32075-1-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allows configuring Samsung's s3c2410 and compatible USB device
controller using a devicetree.

Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 144 +++++++++++++++++++++++++++++------
 drivers/usb/gadget/udc/s3c2410_udc.h |   4 +
 2 files changed, 124 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index 4643a01262b4..165a510b1971 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -30,6 +30,9 @@
 #include <linux/gpio.h>
 #include <linux/prefetch.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
 
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -55,6 +58,18 @@
 #define DRIVER_AUTHOR	"Herbert Pötzl <herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org>, " \
 			"Arnaud Patard <arnaud.patard-dQbF7i+pzddAfugRpC6u6w@public.gmane.org>"
 
+struct s3c2410_udc_drv_data {
+	int ep_fifo_size;
+};
+
+static const struct s3c2410_udc_drv_data s3c2410_udc_2410_drv_data = {
+	.ep_fifo_size = EP_FIFO_SIZE,
+};
+
+static const struct s3c2410_udc_drv_data s3c2410_udc_2440_drv_data = {
+	.ep_fifo_size = S3C2440_EP_FIFO_SIZE,
+};
+
 static const char		gadget_name[] = "s3c2410_udc";
 static const char		driver_desc[] = DRIVER_DESC;
 
@@ -62,8 +77,6 @@
 static struct clk		*udc_clock;
 static struct clk		*usb_bus_clock;
 static void __iomem		*base_addr;
-static u64			rsrc_start;
-static u64			rsrc_len;
 static struct dentry		*s3c2410_udc_debugfs_root;
 
 static inline u32 udc_read(u32 reg)
@@ -997,7 +1010,7 @@ static irqreturn_t s3c2410_udc_irq(int dummy, void *_dev)
 		}
 	}
 
-	dprintk(DEBUG_VERBOSE, "irq: %d s3c2410_udc_done.\n", IRQ_USBD);
+	dprintk(DEBUG_VERBOSE, "irq: %d s3c2410_udc_done.\n", dev->irq);
 
 	/* Restore old index */
 	udc_write(idx, S3C2410_UDC_INDEX_REG);
@@ -1757,6 +1770,49 @@ static int s3c2410_udc_stop(struct usb_gadget *g)
 
 };
 
+static int s3c2410_udc_probe_dt(struct s3c2410_udc *udc)
+{
+	const struct s3c2410_udc_drv_data *drvdata;
+	struct platform_device *pdev = udc->pdev;
+	struct s3c2410_udc_mach_info *pdata;
+	int gpio;
+
+	drvdata = of_device_get_match_data(&pdev->dev);
+
+	if (drvdata)
+		udc->ep_fifo_size = drvdata->ep_fifo_size;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	gpio = of_get_named_gpio(pdev->dev.of_node, "samsung,vbus-gpio", 0);
+	if (gpio_is_valid(gpio))
+		pdata->vbus_pin = gpio;
+
+	gpio = of_get_named_gpio(pdev->dev.of_node, "samsung,pullup-gpio", 0);
+	if (gpio_is_valid(gpio))
+		pdata->pullup_pin = gpio;
+
+	pdev->dev.platform_data = pdata;
+
+	return 0;
+}
+
+static int s3c2410_udc_probe_pdata(struct s3c2410_udc *udc)
+{
+	const struct s3c2410_udc_drv_data *drvdata;
+	struct platform_device *pdev = udc->pdev;
+
+	drvdata = (struct s3c2410_udc_drv_data *)
+		platform_get_device_id(pdev)->driver_data;
+
+	if (drvdata)
+		udc->ep_fifo_size = drvdata->ep_fifo_size;
+
+	return 0;
+}
+
 /*
  *	probe - binds to the platform device
  */
@@ -1769,7 +1825,17 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "%s()\n", __func__);
 
-	usb_bus_clock = clk_get(NULL, "usb-bus-gadget");
+	udc->pdev = pdev;
+
+	if (pdev->dev.of_node)
+		retval = s3c2410_udc_probe_dt(udc);
+	else
+		retval = s3c2410_udc_probe_pdata(udc);
+
+	if (retval)
+		return retval;
+
+	usb_bus_clock = clk_get(NULL, "uclk");
 	if (IS_ERR(usb_bus_clock)) {
 		dev_err(dev, "failed to get usb bus clock source\n");
 		return PTR_ERR(usb_bus_clock);
@@ -1789,24 +1855,27 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "got and enabled clocks\n");
 
-	if (strncmp(pdev->name, "s3c2440", 7) == 0) {
-		dev_info(dev, "S3C2440: increasing FIFO to 128 bytes\n");
-		memory.ep[1].fifo_size = S3C2440_EP_FIFO_SIZE;
-		memory.ep[2].fifo_size = S3C2440_EP_FIFO_SIZE;
-		memory.ep[3].fifo_size = S3C2440_EP_FIFO_SIZE;
-		memory.ep[4].fifo_size = S3C2440_EP_FIFO_SIZE;
+	if (udc->ep_fifo_size) {
+		dev_info(dev, "setting FIFO to %d bytes\n", udc->ep_fifo_size);
+		memory.ep[1].fifo_size = udc->ep_fifo_size;
+		memory.ep[2].fifo_size = udc->ep_fifo_size;
+		memory.ep[3].fifo_size = udc->ep_fifo_size;
+		memory.ep[4].fifo_size = udc->ep_fifo_size;
 	}
 
 	spin_lock_init(&udc->lock);
 	udc_info = dev_get_platdata(&pdev->dev);
 
-	rsrc_start = S3C2410_PA_USBDEV;
-	rsrc_len   = S3C24XX_SZ_USBDEV;
+	udc->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!udc->mem) {
+		dev_err(dev, "failed to get I/O memory region\n");
+		return -ENOENT;
+	}
 
-	if (!request_mem_region(rsrc_start, rsrc_len, gadget_name))
+	if (!request_mem_region(udc->mem->start, resource_size(udc->mem), gadget_name))
 		return -EBUSY;
 
-	base_addr = ioremap(rsrc_start, rsrc_len);
+	base_addr = ioremap(udc->mem->start, resource_size(udc->mem));
 	if (!base_addr) {
 		retval = -ENOMEM;
 		goto err_mem;
@@ -1818,17 +1887,24 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	s3c2410_udc_disable(udc);
 	s3c2410_udc_reinit(udc);
 
+	udc->irq = platform_get_irq(pdev, 0);
+	if (udc->irq == 0) {
+		dev_err(dev, "failed to get interrupt\n");
+		retval = -EINVAL;
+		goto err_map;
+	}
+
 	/* irq setup after old hardware state is cleaned up */
-	retval = request_irq(IRQ_USBD, s3c2410_udc_irq,
+	retval = request_irq(udc->irq, s3c2410_udc_irq,
 			     0, gadget_name, udc);
 
 	if (retval != 0) {
-		dev_err(dev, "cannot get irq %i, err %d\n", IRQ_USBD, retval);
+		dev_err(dev, "cannot get irq %i, err %d\n", udc->irq, retval);
 		retval = -EBUSY;
 		goto err_map;
 	}
 
-	dev_dbg(dev, "got irq %i\n", IRQ_USBD);
+	dev_dbg(dev, "got irq %i\n", udc->irq);
 
 	if (udc_info && udc_info->vbus_pin > 0) {
 		retval = gpio_request(udc_info->vbus_pin, "udc vbus");
@@ -1899,11 +1975,11 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	if (udc_info && udc_info->vbus_pin > 0)
 		gpio_free(udc_info->vbus_pin);
 err_int:
-	free_irq(IRQ_USBD, udc);
+	free_irq(udc->irq, udc);
 err_map:
 	iounmap(base_addr);
 err_mem:
-	release_mem_region(rsrc_start, rsrc_len);
+	release_mem_region(udc->mem->start, resource_size(udc->mem));
 
 	return retval;
 }
@@ -1933,10 +2009,10 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 		free_irq(irq, udc);
 	}
 
-	free_irq(IRQ_USBD, udc);
+	free_irq(udc->irq, udc);
 
 	iounmap(base_addr);
-	release_mem_region(rsrc_start, rsrc_len);
+	release_mem_region(udc->mem->start, resource_size(udc->mem));
 
 	if (!IS_ERR(udc_clock) && udc_clock != NULL) {
 		clk_disable_unprepare(udc_clock);
@@ -1974,16 +2050,36 @@ static int s3c2410_udc_resume(struct platform_device *pdev)
 #define s3c2410_udc_resume	NULL
 #endif
 
+static const struct of_device_id s3c_udc_dt_ids[] = {
+	{
+		.compatible = "samsung,s3c2410-udc",
+		.data = &s3c2410_udc_2410_drv_data,
+	},
+	{
+		.compatible = "samsung,s3c2440-udc",
+		.data = &s3c2410_udc_2440_drv_data,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, s3c_udc_dt_ids);
+
 static const struct platform_device_id s3c_udc_ids[] = {
-	{ "s3c2410-usbgadget", },
-	{ "s3c2440-usbgadget", },
-	{ }
+	{
+		.name = "s3c2410-usbgadget",
+		.driver_data = (kernel_ulong_t) &s3c2410_udc_2410_drv_data,
+	},
+	{
+		.name = "s3c2440-usbgadget",
+		.driver_data = (kernel_ulong_t) &s3c2410_udc_2440_drv_data,
+	},
+	{ /* sentinel */},
 };
 MODULE_DEVICE_TABLE(platform, s3c_udc_ids);
 
 static struct platform_driver udc_driver_24x0 = {
 	.driver		= {
 		.name	= "s3c24x0-usbgadget",
+		.of_match_table = s3c_udc_dt_ids,
 	},
 	.probe		= s3c2410_udc_probe,
 	.remove		= s3c2410_udc_remove,
diff --git a/drivers/usb/gadget/udc/s3c2410_udc.h b/drivers/usb/gadget/udc/s3c2410_udc.h
index 93bf225f1969..8fdbe77a804d 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.h
+++ b/drivers/usb/gadget/udc/s3c2410_udc.h
@@ -94,6 +94,10 @@ struct s3c2410_udc {
 	unsigned			req_pending : 1;
 	u8				vbus;
 	struct dentry			*regs_info;
+	struct platform_device		*pdev;
+	struct resource			*mem;
+	int				irq;
+	unsigned int			ep_fifo_size;
 };
 #define to_s3c2410(g)	(container_of((g), struct s3c2410_udc, gadget))
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
