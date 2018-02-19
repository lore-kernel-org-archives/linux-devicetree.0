Return-Path: <SRS0=/mGh=FN=electromag.com.au=preid@kernel.org>
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration for irq output
Date: Mon, 19 Feb 2018 17:25:20 +0800
Message-Id: <1519032320-103817-4-git-send-email-preid@electromag.com.au>
In-Reply-To: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, preid@electromag.com.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, jan.kundrat@cesnet.cz
List-ID: <devicetree@vger.kernel.org>

The mcp23s08 series device can be configured for wired and interrupts
using an external pull-up and open drain output via the IOCON_ODR bit.
And "drive-open-drain" property to enable this.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 83277570..022307d 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -771,6 +771,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 {
 	int status, ret;
 	bool mirror = false;
+	bool open_drain = false;
 	struct regmap_config *one_regmap_config = NULL;
 	int raw_chip_address = (addr & ~0x40) >> 1;
 
@@ -883,10 +884,11 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 					      "microchip,irq-active-high");
 
 		mirror = device_property_read_bool(dev, "microchip,irq-mirror");
+		open_drain = device_property_read_bool(dev, "drive-open-drain");
 	}
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
-	     mcp->irq_active_high) {
+	     mcp->irq_active_high || open_drain) {
 		/* mcp23s17 has IOCON twice, make sure they are in sync */
 		status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
 		status |= IOCON_HAEN | (IOCON_HAEN << 8);
@@ -898,6 +900,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (mirror)
 			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
 
+		if (open_drain)
+			status |= IOCON_ODR | (IOCON_ODR << 8);
+
 		if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
 			status |= IOCON_INTCC | (IOCON_INTCC << 8);
 
-- 
1.8.3.1
