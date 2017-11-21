From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v3 1/5] pinctrl: mcp23s08: remove hard coded irq polarity in irq_setup
Date: Tue, 21 Nov 2017 16:21:27 +0800
Message-ID: <1511252491-79952-2-git-send-email-preid@electromag.com.au>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511252491-79952-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The polarity of the irq should be defined in the configuration
for the irq. eg The device tree bind already allows for either
active high / low interrupt configuration.

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 0aef30e..cc1f9f6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -56,7 +56,6 @@
 
 struct mcp23s08 {
 	u8			addr;
-	bool			irq_active_high;
 	bool			reg_shift;
 
 	u16			irq_rise;
@@ -627,11 +626,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 	int err;
 	unsigned long irqflags = IRQF_ONESHOT | IRQF_SHARED;
 
-	if (mcp->irq_active_high)
-		irqflags |= IRQF_TRIGGER_HIGH;
-	else
-		irqflags |= IRQF_TRIGGER_LOW;
-
 	err = devm_request_threaded_irq(chip->parent, mcp->irq, NULL,
 					mcp23s08_irq,
 					irqflags, dev_name(chip->parent), mcp);
@@ -777,12 +771,12 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 {
 	int status, ret;
 	bool mirror = false;
+	bool irq_active_high = false;
 
 	mutex_init(&mcp->lock);
 
 	mcp->dev = dev;
 	mcp->addr = addr;
-	mcp->irq_active_high = false;
 
 	mcp->chip.direction_input = mcp23s08_direction_input;
 	mcp->chip.get = mcp23s08_get;
@@ -868,7 +862,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->irq_controller =
 		device_property_read_bool(dev, "interrupt-controller");
 	if (mcp->irq && mcp->irq_controller) {
-		mcp->irq_active_high =
+		irq_active_high =
 			device_property_read_bool(dev,
 					      "microchip,irq-active-high");
 
@@ -876,11 +870,11 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	}
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
-	     mcp->irq_active_high) {
+	     irq_active_high) {
 		/* mcp23s17 has IOCON twice, make sure they are in sync */
 		status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
 		status |= IOCON_HAEN | (IOCON_HAEN << 8);
-		if (mcp->irq_active_high)
+		if (irq_active_high)
 			status |= IOCON_INTPOL | (IOCON_INTPOL << 8);
 		else
 			status &= ~(IOCON_INTPOL | (IOCON_INTPOL << 8));
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
