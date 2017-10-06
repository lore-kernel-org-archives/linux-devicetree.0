From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v2 6/7] pinctrl: mcp23s08: remove hardcoded irq polarity in irq_setup
Date: Fri,  6 Oct 2017 13:08:10 +0800
Message-ID: <1507266491-73971-7-git-send-email-preid@electromag.com.au>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507266491-73971-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The irq_active_high flag is for controlling the polarity of the output
from the mcp23s08 series devices. The polarity of the irq could be altered
by additional logic (eg inverters) between the device and irq input device.
The device-tree already allows for this as the irq can be specified in the
binding. So hardcoding it in the driver is overly restrictive.

There are no inkernel users of the mcp23s08 driver with irq's.

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 150f216..8dceaa1 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -630,11 +630,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
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
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
