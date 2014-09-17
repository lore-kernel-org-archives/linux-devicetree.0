From: Weike Chen <alvin.chen@intel.com>
Subject: [PATCH 3/4 v5] GPIO: gpio-dwapb: Support Debounce
Date: Wed, 17 Sep 2014 09:18:41 -0700
Message-ID: <1410970722-8579-4-git-send-email-alvin.chen@intel.com>
References: <1410970722-8579-1-git-send-email-alvin.chen@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410970722-8579-1-git-send-email-alvin.chen@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alvin Chen <alvin.chen@intel.com>
List-Id: devicetree@vger.kernel.org

This patch enables 'debounce' for the designware GPIO, and
it is based on Josef Ahmad's previous work.

Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Weike Chen <alvin.chen@intel.com>
---
 drivers/gpio/gpio-dwapb.c |   36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 551eaf7..db059bb 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -37,6 +37,7 @@
 #define GPIO_INTTYPE_LEVEL	0x38
 #define GPIO_INT_POLARITY	0x3c
 #define GPIO_INTSTATUS		0x40
+#define GPIO_PORTA_DEBOUNCE	0x48
 #define GPIO_PORTA_EOI		0x4c
 #define GPIO_EXT_PORTA		0x50
 #define GPIO_EXT_PORTB		0x54
@@ -64,6 +65,12 @@ struct dwapb_gpio {
 	struct irq_domain	*domain;
 };
 
+static inline struct dwapb_gpio_port *
+to_dwapb_gpio_port(struct bgpio_chip *bgc)
+{
+	return container_of(bgc, struct dwapb_gpio_port, bgc);
+}
+
 static inline u32 dwapb_read(struct dwapb_gpio *gpio, unsigned int offset)
 {
 	struct bgpio_chip *bgc	= &gpio->ports[0].bgc;
@@ -84,8 +91,7 @@ static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
 static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
-	struct dwapb_gpio_port *port = container_of(bgc, struct
-						    dwapb_gpio_port, bgc);
+	struct dwapb_gpio_port *port = to_dwapb_gpio_port(bgc);
 	struct dwapb_gpio *gpio = port->gpio;
 
 	return irq_find_mapping(gpio->domain, offset);
@@ -235,6 +241,28 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	return 0;
 }
 
+static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
+				   unsigned offset, unsigned debounce)
+{
+	struct bgpio_chip *bgc = to_bgpio_chip(gc);
+	struct dwapb_gpio_port *port = to_dwapb_gpio_port(bgc);
+	struct dwapb_gpio *gpio = port->gpio;
+	unsigned long flags, val_deb;
+	unsigned long mask = bgc->pin2mask(bgc, offset);
+
+	spin_lock_irqsave(&bgc->lock, flags);
+
+	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
+	if (debounce)
+		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb | mask);
+	else
+		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb & ~mask);
+
+	spin_unlock_irqrestore(&bgc->lock, flags);
+
+	return 0;
+}
+
 static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 {
 	u32 worked;
@@ -373,6 +401,10 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	port->bgc.gc.ngpio = pp->ngpio;
 	port->bgc.gc.base = pp->gpio_base;
 
+	/* Only port A support debounce */
+	if (pp->idx == 0)
+		port->bgc.gc.set_debounce = dwapb_gpio_set_debounce;
+
 	if (pp->irq)
 		dwapb_configure_irqs(gpio, port, pp);
 
-- 
1.7.9.5
