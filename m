Return-Path: <SRS0=UyCb=MU=kleine-koenig.org=uwe@kernel.org>
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH RFC] gpio: new driver for a gpio simulator
Date: Mon,  8 Oct 2018 12:13:56 +0200
Message-Id: <20181008101356.5672-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

A gpio simulator device provides 2x 32 virtual GPIOs that are pairwise
connected.

That is, if both GPIOs are configured as input both read a zero. If one
is an output the other reads the first's output value.

This can for example be used to add a push button device on one side and
"push" it by driving the other side via gpioctl.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
Hello,

this is a patch that I intend to use to test a few patches that are
still on my todo list.

Do you consider it interesting enough to be suitable for mainline?

There is one issue (that I'm aware of): If the driver is unbound (via
sysfs) I get warnings that the gpios and/or irqs are still in use. Not
sure how to fix this properly.

Best regards
Uwe

 .../bindings/gpio/gpio-simulator.txt          |  49 ++
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-simulator.c                 | 456 ++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-simulator.txt
 create mode 100644 drivers/gpio/gpio-simulator.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-simulator.txt b/Documentation/devicetree/bindings/gpio/gpio-simulator.txt
new file mode 100644
index 000000000000..4540b656f7c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-simulator.txt
@@ -0,0 +1,49 @@
+GPIO simulator
+==============
+
+This is a completely simulated device that connects the 32 GPIOs of one side
+pairwise to the 32 GPIOs on the other side such that controlling a GPIO changes
+the level for the matching GPIO on the other side. In hardware such a pair
+would look as follows:
+
+                       ,-------.         ,-------.
+     portA GPIO i ] ---| 100 Ω |----+----| 100 Ω |---[ portB GPIO i
+                       `-------'    |    `-------'
+                                  ,---.
+                                  | 1 |
+                                  | 0 |
+                                  | k |
+                                  | Ω |
+                                  `---'
+                                    |
+                                    ⏚
+
+Required properties
+-------------------
+
+- compatible: "gpio-simulator"
+
+The node is expected to have two sub-nodes called "sidea" and "sideb" that
+implement a gpio-controller and an interrupt-controller with 2 cells each.
+
+
+Example:
+	gpiosim {
+	        compatible = "gpio-simulator";
+
+	        gpiosima: sidea {
+	                gpio-controller;
+	                #gpio-cells = <2>;
+
+	                interrupt-controller;
+	                #interrupt-cells = <2>;
+	        };
+
+	        gpiosimb: sideb {
+	                gpio-controller;
+	                #gpio-cells = <2>;
+
+	                interrupt-controller;
+	                #interrupt-cells = <2>;
+	        };
+	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4f52c3a8ec99..1db13cc4bedb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1387,4 +1387,16 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+config GPIO_SIMULATOR
+	tristate "GPIO simulator"
+	help
+	  This provides a driver for a virtual device that exposes two banks
+	  with 32 GPIOs each.
+	  The virtual lines are pairwise connected, so setting the first GPIO
+	  on the first bank as output and toggling its value makes the first GPIO
+	  on the second bank (configured as input) change the level
+	  accordingly. This way you can attach (say) a GPIO button device to
+	  one of the GPIOs and "press" it by using /dev/gpioctl on the
+	  companion GPIO.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c256aff66a65..3560c656a984 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_GPIO_REG)		+= gpio-reg.o
 obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
 obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
+obj-$(CONFIG_GPIO_SIMULATOR)	+= gpio-simulator.o
 obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)		+= gpio-sprd.o
diff --git a/drivers/gpio/gpio-simulator.c b/drivers/gpio/gpio-simulator.c
new file mode 100644
index 000000000000..e8ad5539bd4a
--- /dev/null
+++ b/drivers/gpio/gpio-simulator.c
@@ -0,0 +1,456 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/kthread.h>
+#include <linux/platform_device.h>
+
+struct gpio_simulator_ddata;
+
+struct gpio_simulator_port {
+	struct gpio_simulator_port *other;
+	struct gpio_simulator_ddata *ddata;
+
+	/*
+	 * Each bit specifies the direction of a gpio. 1=output; 0=input
+	 */
+	u32 output;
+
+	/*
+	 * Each bit specifies the output value of a gpio (if the matching bit in
+	 * .output is 1).
+	 */
+	u32 output_value;
+
+	/*
+	 * A one in .xxx_enable enables setting the respective bit in
+	 * .xxx_status if the matching event happens.
+	 */
+	u32 irq_level_low_enable;
+	u32 irq_level_high_enable;
+	u32 irq_edge_falling_enable;
+	u32 irq_edge_raising_enable;
+
+	/*
+	 * .xxx_status triggers the respective irq if the matching bit in
+	 * .irq_enable is one
+	 */
+	u32 irq_level_low_status;
+	u32 irq_level_high_status;
+	u32 irq_edge_falling_status;
+	u32 irq_edge_raising_status;
+
+	u32 irq_enable;
+
+	struct gpio_chip gchip;
+	struct irq_chip ichip;
+
+	u32 level_cache;
+};
+
+struct gpio_simulator_ddata {
+	struct gpio_simulator_port port[2];
+	spinlock_t lock;
+	struct task_struct *irqtrigger_thread;
+};
+
+static u32 gpio_simulator_get_pending_irq(struct gpio_simulator_port *port)
+{
+	u32 ret;
+
+	ret = port->irq_enable & (port->irq_level_low_status |
+				   port->irq_level_high_status |
+				   port->irq_edge_falling_status |
+				   port->irq_edge_raising_status);
+
+	return ret;
+}
+
+static void gpio_simulator_update_port(struct gpio_simulator_port *port)
+{
+	struct gpio_simulator_port *otherport = port->other;
+	u32 level;
+
+	level = (port->output & port->output_value) |
+		(otherport->output & otherport->output_value & ~port->output);
+
+	port->irq_level_low_status = ~level & port->irq_level_low_enable;
+	port->irq_level_high_status = level & port->irq_level_high_enable;
+
+	port->irq_edge_falling_status |=
+		port->level_cache & ~level & port->irq_edge_falling_enable;
+	port->irq_edge_raising_status |=
+		~port->level_cache & level & port->irq_edge_raising_enable;
+
+	port->level_cache = level;
+
+	if (gpio_simulator_get_pending_irq(port))
+		wake_up_process(port->ddata->irqtrigger_thread);
+}
+
+static void gpio_simulator_update(struct gpio_simulator_ddata *ddata)
+{
+	gpio_simulator_update_port(&ddata->port[0]);
+	gpio_simulator_update_port(&ddata->port[1]);
+}
+
+static int gpio_simulator_get_direction(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct gpio_simulator_port *port =
+		container_of(chip, struct gpio_simulator_port, gchip);
+
+	if (port->output & (1 << offset))
+		return GPIOF_DIR_OUT;
+	else
+		return GPIOF_DIR_IN;
+}
+
+static int gpio_simulator_direction_input(struct gpio_chip *chip,
+					  unsigned int offset)
+{
+	struct gpio_simulator_port *port =
+		container_of(chip, struct gpio_simulator_port, gchip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	port->output &= ~(1 << offset);
+
+	gpio_simulator_update(port->ddata);
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+
+	return 0;
+}
+
+static int gpio_simulator_direction_output(struct gpio_chip *chip,
+					   unsigned int offset, int value)
+{
+	struct gpio_simulator_port *port =
+		container_of(chip, struct gpio_simulator_port, gchip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	if (value)
+		port->output_value |= 1 << offset;
+	else
+		port->output_value &= ~(1 << offset);
+
+	port->output |= 1 << offset;
+
+	gpio_simulator_update(port->ddata);
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+
+	return 0;
+}
+
+static int gpio_simulator_get(struct gpio_chip *chip,
+			      unsigned int offset)
+{
+	struct gpio_simulator_port *port =
+		container_of(chip, struct gpio_simulator_port, gchip);
+	int ret;
+
+	ret = port->level_cache & (1 << offset);
+
+	return ret;
+}
+
+static void gpio_simulator_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
+{
+	struct gpio_simulator_port *port =
+		container_of(chip, struct gpio_simulator_port, gchip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	if (value)
+		port->output_value |= 1 << offset;
+	else
+		port->output_value &= ~(1 << offset);
+
+	gpio_simulator_update(port->ddata);
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+}
+
+static void gpio_simulator_irq_ack(struct irq_data *d)
+{
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct gpio_simulator_port *port =
+		container_of(ic, struct gpio_simulator_port, ichip);
+	int level;
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	level = port->level_cache & d->mask;
+	if (level)
+		port->irq_level_low_status &= ~d->mask;
+	else
+		port->irq_level_high_status &= ~d->mask;
+
+	port->irq_edge_raising_status &= ~d->mask;
+	port->irq_edge_falling_status &= ~d->mask;
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+}
+
+static void gpio_simulator_irq_mask(struct irq_data *d)
+{
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct gpio_simulator_port *port =
+		container_of(ic, struct gpio_simulator_port, ichip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	port->irq_enable &= ~d->mask;
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+}
+
+static void gpio_simulator_irq_unmask(struct irq_data *d)
+{
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct gpio_simulator_port *port =
+		container_of(ic, struct gpio_simulator_port, ichip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	port->irq_enable |= d->mask;
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+}
+
+static int gpio_simulator_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct gpio_simulator_port *port =
+		container_of(ic, struct gpio_simulator_port, ichip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->ddata->lock, flags);
+
+	if (d->mask == 0)
+		d->mask = 1 << d->hwirq;
+
+	if (type & IRQ_TYPE_EDGE_RISING) {
+		port->irq_edge_raising_enable |= d->mask;
+	} else {
+		port->irq_edge_raising_enable &= ~d->mask;
+		port->irq_edge_raising_status &= ~d->mask;
+	}
+
+	if (type & IRQ_TYPE_EDGE_FALLING) {
+		port->irq_edge_falling_enable |= d->mask;
+	} else {
+		port->irq_edge_falling_enable &= ~d->mask;
+		port->irq_edge_falling_status &= ~d->mask;
+	}
+
+	if (type & IRQ_TYPE_LEVEL_LOW) {
+		port->irq_level_low_enable |= d->mask;
+	} else {
+		port->irq_level_low_enable &= ~d->mask;
+		port->irq_level_low_status &= ~d->mask;
+	}
+
+	if (type & IRQ_TYPE_LEVEL_HIGH) {
+		port->irq_level_high_enable |= d->mask;
+	} else {
+		port->irq_level_high_enable &= ~d->mask;
+		port->irq_level_high_status &= ~d->mask;
+	}
+
+	gpio_simulator_update(port->ddata);
+
+	spin_unlock_irqrestore(&port->ddata->lock, flags);
+
+	return 0;
+}
+
+static int gpio_simulator_init_port(struct platform_device *pdev,
+				    struct gpio_simulator_ddata *ddata,
+				    unsigned int portno,
+				    struct device_node *of_node)
+{
+	struct gpio_simulator_port *here = &ddata->port[portno];
+	struct gpio_simulator_port *there = &ddata->port[1 - portno];
+	struct gpio_chip *gc = &here->gchip;
+	struct irq_chip *ic = &here->ichip;
+	int ret;
+
+	here->other = there;
+	here->ddata = ddata;
+
+	gc->parent = &pdev->dev;
+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%u",
+				   dev_name(&pdev->dev), portno);
+	if (!gc->label)
+		return -ENOMEM;
+
+	gc->of_node = of_node;
+	gc->of_gpio_n_cells = 2;
+
+	gc->base = -1;
+	gc->ngpio = 32;
+
+	gc->get_direction = gpio_simulator_get_direction;
+	gc->direction_input = gpio_simulator_direction_input;
+	gc->direction_output = gpio_simulator_direction_output;
+	gc->get = gpio_simulator_get;
+	gc->set = gpio_simulator_set;
+
+	ic->name = gc->label;
+	ic->irq_ack = gpio_simulator_irq_ack;
+	ic->irq_mask = gpio_simulator_irq_mask;
+	ic->irq_unmask = gpio_simulator_irq_unmask;
+	ic->irq_set_type = gpio_simulator_irq_set_type;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, here);
+	if (ret)
+		return ret;
+
+	ret = gpiochip_irqchip_add(gc, ic, 0, handle_level_irq, IRQ_TYPE_NONE);
+
+	return ret;
+}
+
+static int gpio_simulator_irqtrigger(void *data)
+{
+	struct platform_device *pdev = data;
+	struct gpio_simulator_ddata *ddata = platform_get_drvdata(pdev);
+
+	get_device(&pdev->dev);
+
+	for (;;) {
+		u32 pending0, pending1;
+		int offset;
+
+		if (kthread_should_stop()) {
+			put_device(&pdev->dev);
+			return 0;
+		}
+
+		spin_lock_irq(&ddata->lock);
+
+		pending0 = gpio_simulator_get_pending_irq(&ddata->port[0]);
+		pending1 = gpio_simulator_get_pending_irq(&ddata->port[1]);
+
+		spin_unlock(&ddata->lock);
+
+		for (offset = 0; offset < 32; ++offset) {
+			if (pending0 & (1 << offset)) {
+				struct irq_domain *irqdomain;
+				unsigned int irq;
+
+				irqdomain = ddata->port[0].gchip.irq.domain;
+				irq = irq_find_mapping(irqdomain, offset);
+
+				generic_handle_irq(irq);
+			}
+
+			if (pending1 & (1 << offset)) {
+				struct irq_domain *irqdomain;
+				unsigned int irq;
+
+				irq_domain = ddata->port[1].gchip.irq.domain;
+				irq = irq_find_mapping(irqdomain, offset);
+
+				generic_handle_irq(irq);
+			}
+		}
+
+		spin_lock(&ddata->lock);
+
+		pending0 = gpio_simulator_get_pending_irq(&ddata->port[0]);
+		pending1 = gpio_simulator_get_pending_irq(&ddata->port[1]);
+
+		if (!pending0 && !pending1)
+			set_current_state(TASK_IDLE);
+
+		spin_unlock_irq(&ddata->lock);
+
+		schedule();
+
+		set_current_state(TASK_RUNNING);
+	}
+}
+
+static int gpio_simulator_probe(struct platform_device *pdev)
+{
+	struct gpio_simulator_ddata *ddata;
+	int ret;
+	struct device_node *of_nodea, *of_nodeb;
+
+	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ddata);
+
+	spin_lock_init(&ddata->lock);
+
+	of_nodea = of_get_child_by_name(pdev->dev.of_node, "sidea");
+	ret = gpio_simulator_init_port(pdev, ddata, 0, of_nodea);
+	if (ret)
+		return ret;
+
+	of_nodeb = of_get_child_by_name(pdev->dev.of_node, "sideb");
+	ret = gpio_simulator_init_port(pdev, ddata, 1, of_nodeb);
+	if (ret)
+		return ret;
+
+	ddata->irqtrigger_thread = kthread_run(gpio_simulator_irqtrigger, pdev,
+					       "gpiosim");
+	if (IS_ERR(ddata->irqtrigger_thread)) {
+		dev_err(&pdev->dev, "Failed to create thread\n");
+		return PTR_ERR(ddata->irqtrigger_thread);
+	}
+
+	return 0;
+}
+
+static int gpio_simulator_remove(struct platform_device *pdev)
+{
+	struct gpio_simulator_ddata *ddata = platform_get_drvdata(pdev);
+
+	kthread_stop(ddata->irqtrigger_thread);
+
+	/*
+	 * XXX: Do I need to remove the irqchip? If yes, then .probe also needs
+	 * an error path.
+	 */
+
+	return 0;
+}
+
+static const struct of_device_id gpio_simulator_dt_ids[] = {
+	{
+		.compatible = "gpio-simulator",
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, gpio_simulator_dt_ids);
+
+static struct platform_driver gpio_simulator_driver = {
+	.driver = {
+		.name = "gpio-simulator",
+		.of_match_table = gpio_simulator_dt_ids,
+	},
+	.probe = gpio_simulator_probe,
+	.remove = gpio_simulator_remove,
+};
+module_platform_driver(gpio_simulator_driver);
+
+MODULE_AUTHOR("Uwe Kleine-Koenig <uwe@kleine-koenig.org>");
+MODULE_DESCRIPTION("gpio simulator driver");
+MODULE_LICENSE("GPL v2");
-- 
2.19.0
