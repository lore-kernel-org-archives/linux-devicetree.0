From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 05/15] gpio: add irq domain activate/deactivate functions
Date: Sat, 19 Jan 2019 15:42:42 -0500
Message-ID: <20190119204252.18370-6-masneyb@onstation.org>
References: <20190119204252.18370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the two new functions gpiochip_irq_domain_activate and
gpiochip_irq_domain_deactivate that can be used as the activate and
deactivate functions in the struct irq_domain_ops. This is for
situations where only gpiochip_{lock,unlock}_as_irq needs to be called.
SPMI and SSBI GPIO are two users that will initially use these
functions.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
Changes since v5:
- None

Changes since v4:
- Change '&struct gpiochip' in kernel doc to '&struct gpio_chip'

Changes since v3:
- Correct kernel doc syntax: 'struct &foo' -> '&struct foo'
  '&func' -> 'func()'

 drivers/gpio/gpiolib.c      | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  5 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1651d7f0a303..361a09c8138a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1775,6 +1775,43 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
+/**
+ * gpiochip_irq_domain_activate() - Lock a GPIO to be used as an IRQ
+ * @domain: The IRQ domain used by this IRQ chip
+ * @data: Outermost irq_data associated with the IRQ
+ * @reserve: If set, only reserve an interrupt vector instead of assigning one
+ *
+ * This function is a wrapper that calls gpiochip_lock_as_irq() and is to be
+ * used as the activate function for the &struct irq_domain_ops. The host_data
+ * for the IRQ domain must be the &struct gpio_chip.
+ */
+int gpiochip_irq_domain_activate(struct irq_domain *domain,
+				 struct irq_data *data, bool reserve)
+{
+	struct gpio_chip *chip = domain->host_data;
+
+	return gpiochip_lock_as_irq(chip, data->hwirq);
+}
+EXPORT_SYMBOL_GPL(gpiochip_irq_domain_activate);
+
+/**
+ * gpiochip_irq_domain_deactivate() - Unlock a GPIO used as an IRQ
+ * @domain: The IRQ domain used by this IRQ chip
+ * @data: Outermost irq_data associated with the IRQ
+ *
+ * This function is a wrapper that will call gpiochip_unlock_as_irq() and is to
+ * be used as the deactivate function for the &struct irq_domain_ops. The
+ * host_data for the IRQ domain must be the &struct gpio_chip.
+ */
+void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
+				    struct irq_data *data)
+{
+	struct gpio_chip *chip = domain->host_data;
+
+	return gpiochip_unlock_as_irq(chip, data->hwirq);
+}
+EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
+
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 07cddbf45186..01497910f023 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -472,6 +472,11 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq);
 void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
 
+int gpiochip_irq_domain_activate(struct irq_domain *domain,
+				 struct irq_data *data, bool reserve);
+void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
+				    struct irq_data *data);
+
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq,
-- 
2.17.2
