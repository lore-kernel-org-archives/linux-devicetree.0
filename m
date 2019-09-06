From: Hui Song <hui.song_1@nxp.com>
Subject: [PATCH] gpio/mpc8xxx: change irq handler from chained to normal
Date: Fri,  6 Sep 2019 18:37:00 +0800
Message-ID: <20190906103700.2034-1-hui.song_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Song Hui <hui.song_1@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

more one gpio controller use share one interrupt,
make request interrupt to be shared.

Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 1a680aa..4006250 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -22,6 +22,7 @@
 #include <linux/irq.h>
 #include <linux/gpio/driver.h>
 #include <linux/bitops.h>
+#include <linux/interrupt.h>
 
 #define MPC8XXX_GPIO_PINS	32
 
@@ -127,10 +128,9 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 		return -ENXIO;
 }
 
-static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
+static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = (struct mpc8xxx_gpio_chip *)data;
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned int mask;
 
@@ -139,8 +139,8 @@ static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
 	if (mask)
 		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
 						     32 - ffs(mask)));
-	if (chip->irq_eoi)
-		chip->irq_eoi(&desc->irq_data);
+
+	return IRQ_HANDLED;
 }
 
 static void mpc8xxx_irq_unmask(struct irq_data *d)
@@ -319,6 +319,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
 	{ .compatible = "fsl,pq3-gpio",     },
 	{ .compatible = "fsl,ls1028a-gpio", .data = &ls1028a_gpio_devtype, },
+	{ .compatible = "fsl,ls1088a-gpio", .data = &ls1028a_gpio_devtype, },
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
@@ -408,8 +409,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (devtype->gpio_dir_in_init)
 		devtype->gpio_dir_in_init(gc);
 
-	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
-					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
+	ret = request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
+		IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade", mpc8xxx_gc);
+	if (ret) {
+		pr_err("%s: failed to request_irq(%d), ret = %d\n",
+				np->full_name, mpc8xxx_gc->irqn, ret);
+		goto err;
+	}
+
 	return 0;
 err:
 	iounmap(mpc8xxx_gc->regs);
-- 
2.9.5
