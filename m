From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 3/3] gpio: mcp23s08: Add option to configure IRQ as active high
Date: Mon, 17 Nov 2014 09:38:11 +0100
Message-ID: <1416213491-9775-3-git-send-email-alexander.stein@systec-electronic.com>
References: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Default is active low, but if property is specified in DT set INTPOL flag.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 .../devicetree/bindings/gpio/gpio-mcp23s08.txt     |  2 ++
 drivers/gpio/gpio-mcp23s08.c                       | 30 +++++++++++++++++-----
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
index c306a2d0..47dab72 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
@@ -57,6 +57,8 @@ Optional device specific properties:
         occurred on. If it is not set, the interrupt are only generated for the
         bank they belong to.
         On devices with only one interrupt output this property is useless.
+- microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
+        configures the IRQ output as active high.
 
 Example I2C (with interrupt):
 gpiom1: gpio@20 {
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 529025e..1d5ffb4 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -65,6 +65,7 @@ struct mcp23s08_ops {
 
 struct mcp23s08 {
 	u8			addr;
+	bool			irq_active_high;
 
 	u16			cache[11];
 	u16			irq_rise;
@@ -476,6 +477,7 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 {
 	struct gpio_chip *chip = &mcp->chip;
 	int err, irq, j;
+	unsigned long irqflags = IRQF_ONESHOT | IRQF_SHARED;
 
 	mutex_init(&mcp->irq_lock);
 
@@ -484,10 +486,13 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 	if (!mcp->irq_domain)
 		return -ENODEV;
 
+	if (mcp->irq_active_high)
+		irqflags |= IRQF_TRIGGER_HIGH;
+	else
+		irqflags |= IRQF_TRIGGER_LOW;
+
 	err = devm_request_threaded_irq(chip->dev, mcp->irq, NULL, mcp23s08_irq,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
-					IRQF_SHARED,
-					dev_name(chip->dev), mcp);
+					irqflags, dev_name(chip->dev), mcp);
 	if (err != 0) {
 		dev_err(chip->dev, "unable to request IRQ#%d: %d\n",
 			mcp->irq, err);
@@ -589,6 +594,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	mcp->data = data;
 	mcp->addr = addr;
+	mcp->irq_active_high = false;
 
 	mcp->chip.direction_input = mcp23s08_direction_input;
 	mcp->chip.get = mcp23s08_get;
@@ -648,14 +654,24 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		goto fail;
 
 	mcp->irq_controller = pdata->irq_controller;
-	if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
-		mirror = pdata->mirror;
+	if (mcp->irq && mcp->irq_controller) {
+		mcp->irq_active_high = of_property_read_bool(mcp->chip.of_node,
+				"microchip,irq-active-high");
 
-	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror) {
+		if (type == MCP_TYPE_017)
+			mirror = pdata->mirror;
+	}
+
+	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
+	     mcp->irq_active_high) {
 		/* mcp23s17 has IOCON twice, make sure they are in sync */
 		status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
 		status |= IOCON_HAEN | (IOCON_HAEN << 8);
-		status &= ~(IOCON_INTPOL | (IOCON_INTPOL << 8));
+		if (mcp->irq_active_high)
+			status |= IOCON_INTPOL | (IOCON_INTPOL << 8);
+		else
+			status &= ~(IOCON_INTPOL | (IOCON_INTPOL << 8));
+
 		if (mirror)
 			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
 
-- 
2.0.4

