From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v3 3/5] pinctrl: mcp23s08: add open drain configuration for irq output
Date: Tue, 21 Nov 2017 16:21:29 +0800
Message-ID: <1511252491-79952-4-git-send-email-preid@electromag.com.au>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511252491-79952-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The mcp23s08 series device can be configured for wired and interrupts
using an external pull-up and open drain output via the IOCON_ODR bit.
And "drive-open-drain" property to enable this.

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cc1f9f6..8ff9b77 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -772,6 +772,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	int status, ret;
 	bool mirror = false;
 	bool irq_active_high = false;
+	bool open_drain = false;
 
 	mutex_init(&mcp->lock);
 
@@ -867,10 +868,11 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 					      "microchip,irq-active-high");
 
 		mirror = device_property_read_bool(dev, "microchip,irq-mirror");
+		open_drain = device_property_read_bool(dev, "drive-open-drain");
 	}
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
-	     irq_active_high) {
+	     irq_active_high || open_drain) {
 		/* mcp23s17 has IOCON twice, make sure they are in sync */
 		status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
 		status |= IOCON_HAEN | (IOCON_HAEN << 8);
@@ -882,6 +884,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (mirror)
 			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
 
+		if (open_drain)
+			status |= IOCON_ODR | (IOCON_ODR << 8);
+
 		if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
 			status |= IOCON_INTCC | (IOCON_INTCC << 8);
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
