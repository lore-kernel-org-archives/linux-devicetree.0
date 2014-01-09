From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/6] usb: gadget: gr_udc: Use platform_get_irq instead of irq_of_parse_and_map
Date: Thu,  9 Jan 2014 11:54:15 +0100
Message-ID: <1389264858-32664-4-git-send-email-andreas@gaisler.com>
References: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389264858-32664-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use platform_get_irq as no mapping needs to be done. No functional difference
for SPARC which is the typical environment for the driver though. Suggested by
Mark Rutland.

Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/gadget/gr_udc.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index e66dcf0..e471db3 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -2114,20 +2114,22 @@ static int gr_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	dev->irq = irq_of_parse_and_map(dev->dev->of_node, 0);
-	if (!dev->irq) {
+	dev->irq = platform_get_irq(pdev, 0);
+	if (dev->irq <= 0) {
 		dev_err(dev->dev, "No irq found\n");
 		return -ENODEV;
 	}
 
 	/* Some core configurations has separate irqs for IN and OUT events */
-	dev->irqi = irq_of_parse_and_map(dev->dev->of_node, 1);
-	if (dev->irqi) {
-		dev->irqo = irq_of_parse_and_map(dev->dev->of_node, 2);
-		if (!dev->irqo) {
+	dev->irqi = platform_get_irq(pdev, 1);
+	if (dev->irqi > 0) {
+		dev->irqo = platform_get_irq(pdev, 2);
+		if (dev->irqo <= 0) {
 			dev_err(dev->dev, "Found irqi but not irqo\n");
 			return -ENODEV;
 		}
+	} else {
+		dev->irqi = 0;
 	}
 
 	dev->gadget.name = driver_name;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
