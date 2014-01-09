From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/6] usb: gadget: gr_udc: Make struct platform_device variable name clearer
Date: Thu,  9 Jan 2014 11:54:13 +0100
Message-ID: <1389264858-32664-2-git-send-email-andreas@gaisler.com>
References: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389264858-32664-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rename struct platform_device pointers from ofdev to pdev for clarity.
Suggested by Mark Rutland.

Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/gadget/gr_udc.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index 914cbd8..e66dcf0 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -2071,9 +2071,9 @@ static int gr_udc_init(struct gr_udc *dev)
 	return 0;
 }
 
-static int gr_remove(struct platform_device *ofdev)
+static int gr_remove(struct platform_device *pdev)
 {
-	struct gr_udc *dev = dev_get_drvdata(&ofdev->dev);
+	struct gr_udc *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->added)
 		usb_del_gadget_udc(&dev->gadget); /* Shuts everything down */
@@ -2083,7 +2083,7 @@ static int gr_remove(struct platform_device *ofdev)
 	gr_dfs_delete(dev);
 	if (dev->desc_pool)
 		dma_pool_destroy(dev->desc_pool);
-	dev_set_drvdata(&ofdev->dev, NULL);
+	dev_set_drvdata(&pdev->dev, NULL);
 
 	gr_free_request(&dev->epi[0].ep, &dev->ep0reqi->req);
 	gr_free_request(&dev->epo[0].ep, &dev->ep0reqo->req);
@@ -2096,7 +2096,7 @@ static int gr_request_irq(struct gr_udc *dev, int irq)
 					 IRQF_SHARED, driver_name, dev);
 }
 
-static int gr_probe(struct platform_device *ofdev)
+static int gr_probe(struct platform_device *pdev)
 {
 	struct gr_udc *dev;
 	struct resource *res;
@@ -2104,12 +2104,12 @@ static int gr_probe(struct platform_device *ofdev)
 	int retval;
 	u32 status;
 
-	dev = devm_kzalloc(&ofdev->dev, sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-	dev->dev = &ofdev->dev;
+	dev->dev = &pdev->dev;
 
-	res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev->dev, res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -2138,7 +2138,7 @@ static int gr_probe(struct platform_device *ofdev)
 	spin_lock_init(&dev->lock);
 	dev->regs = regs;
 
-	dev_set_drvdata(&ofdev->dev, dev);
+	dev_set_drvdata(&pdev->dev, dev);
 
 	/* Determine number of endpoints and data interface mode */
 	status = gr_read32(&dev->regs->status);
@@ -2210,7 +2210,7 @@ out:
 	spin_unlock(&dev->lock);
 
 	if (retval)
-		gr_remove(ofdev);
+		gr_remove(pdev);
 
 	return retval;
 }
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
