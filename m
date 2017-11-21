From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using irq data
Date: Tue, 21 Nov 2017 16:21:30 +0800
Message-ID: <1511252491-79952-5-git-send-email-preid@electromag.com.au>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511252491-79952-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The irq polarity is already encoded in the irq config. Use that to
determine the polarity for the mcp32s08 irq output instead of the
custom microchip,irq-active-high property.

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 8ff9b77..6b3f810 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -773,6 +773,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	bool mirror = false;
 	bool irq_active_high = false;
 	bool open_drain = false;
+	u32 irq_trig;
 
 	mutex_init(&mcp->lock);
 
@@ -863,9 +864,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->irq_controller =
 		device_property_read_bool(dev, "interrupt-controller");
 	if (mcp->irq && mcp->irq_controller) {
-		irq_active_high =
-			device_property_read_bool(dev,
-					      "microchip,irq-active-high");
+		if (device_property_present(dev, "microchip,irq-active-high"))
+			dev_warn(dev,
+				 "microchip,irq-active-high is deprecated\n");
+
+		irq_trig = irqd_get_trigger_type(irq_get_irq_data(mcp->irq));
+		if (irq_trig == IRQF_TRIGGER_HIGH)
+			irq_active_high = true;
 
 		mirror = device_property_read_bool(dev, "microchip,irq-mirror");
 		open_drain = device_property_read_bool(dev, "drive-open-drain");
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
