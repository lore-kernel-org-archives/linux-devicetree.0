From: Hui Song <hui.song_1@nxp.com>
Subject: [PATCH 2/2] gpio: mpc8xxx: Add ls1028a device specify function.
Date: Thu, 18 Jul 2019 17:49:02 +0800
Message-ID: <20190718094902.15562-2-hui.song_1@nxp.com>
References: <20190718094902.15562-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094902.15562-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Song Hui <hui.song_1@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

There is a device specify register(named GPIO_IBE)
on ls1028a need to enable in initial stage.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c8673a5..1a680aa 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -32,6 +32,7 @@
 #define GPIO_IMR		0x10
 #define GPIO_ICR		0x14
 #define GPIO_ICR2		0x18
+#define GPIO_IBE		0x18
 
 struct mpc8xxx_gpio_chip {
 	struct gpio_chip	gc;
@@ -45,6 +46,27 @@ struct mpc8xxx_gpio_chip {
 	unsigned int irqn;
 };
 
+/* The GPIO Input Buffer Enable register(GPIO_IBE) is used to
+ * control the input enable of each individual GPIO port.
+ * When an individual GPIO port’s direction is set to
+ * input (GPIO_GPDIR[DRn=0]), the associated input enable must be
+ * set (GPIOxGPIE[IEn]=1) to propagate the port value to the GPIO
+ * Data Register.
+ */
+static int ls1028a_gpio_dir_in_init(struct gpio_chip *gc)
+{
+	unsigned long flags;
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
+}
+
 /*
  * This hardware has a big endian bit assignment such that GPIO line 0 is
  * connected to bit 31, line 1 to bit 30 ... line 31 to bit 0.
@@ -261,6 +283,7 @@ static const struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
 };
 
 struct mpc8xxx_gpio_devtype {
+	int (*gpio_dir_in_init)(struct gpio_chip *chip);
 	int (*gpio_dir_out)(struct gpio_chip *, unsigned int, int);
 	int (*gpio_get)(struct gpio_chip *, unsigned int);
 	int (*irq_set_type)(struct irq_data *, unsigned int);
@@ -271,6 +294,10 @@ static const struct mpc8xxx_gpio_devtype mpc512x_gpio_devtype = {
 	.irq_set_type = mpc512x_irq_set_type,
 };
 
+static const struct mpc8xxx_gpio_devtype ls1028a_gpio_devtype = {
+	.gpio_dir_in_init = ls1028a_gpio_dir_in_init,
+};
+
 static const struct mpc8xxx_gpio_devtype mpc5125_gpio_devtype = {
 	.gpio_dir_out = mpc5125_gpio_dir_out,
 	.irq_set_type = mpc512x_irq_set_type,
@@ -291,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
 	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
 	{ .compatible = "fsl,pq3-gpio",     },
+	{ .compatible = "fsl,ls1028a-gpio", .data = &ls1028a_gpio_devtype, },
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
@@ -376,6 +404,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	/* ack and mask all irqs */
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
+	/* enable input buffer  */
+	if (devtype->gpio_dir_in_init)
+		devtype->gpio_dir_in_init(gc);
 
 	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
 					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
-- 
2.9.5
