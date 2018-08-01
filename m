From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RESEND RFC 1/4] drivers: pinctrl: qcom: add wakeup capability to GPIO
Date: Tue, 31 Jul 2018 20:00:18 -0600
Message-ID: <20180801020021.9782-2-ilina@codeaurora.org>
References: <20180801020021.9782-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801020021.9782-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, swboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QCOM SoC's that have Power Domain Controller (PDC) chip in the always-on
domain can wakeup the SoC, when interrupts and GPIOs are routed to the
its interrupt controller. Select GPIOs that are deemed wakeup capable are
routed to specific PDC pins. The PDC wakes up the GIC and replays the
interrupt at the GIC and the interrupt handler for the GPIO is invoked.

Setup the PDC IRQ when the GPIO's IRQ is requested and enable the PDC
IRQ when the GPIO's IRQ is enabled.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 163 +++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  14 +++
 2 files changed, 177 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 0e22f52b2a19..39c3934712f7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -71,6 +71,13 @@ struct msm_pinctrl {

 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs;
+	struct list_head pdc_irqs;
+};
+
+struct wakeup_gpio_irq_map {
+	struct list_head list;
+	unsigned gpio;
+	unsigned pdc_irq;
 };

 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
@@ -558,6 +565,39 @@ static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define msm_gpio_dbg_show NULL
 #endif

+static int msm_gpio_get_pdc_pin(struct msm_pinctrl *pctrl, unsigned hwirq)
+{
+	struct msm_pinctrl_pdc_map *map = pctrl->soc->pdc_map;
+	int i;
+
+	for (i = 0; i < pctrl->soc->npdc_pins; i++) {
+		if (map[i].hwirq == hwirq)
+			return map[i].pdc_pin;
+	}
+
+	return -ENOTCONN;
+}
+
+static struct irq_data *msm_get_pdc_irq_data(struct irq_data *d)
+{
+	struct wakeup_gpio_irq_map *p;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct irq_data *data = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	list_for_each_entry(p, &pctrl->pdc_irqs, list) {
+		if (p->gpio == d->hwirq) {
+			data = irq_get_irq_data(p->pdc_irq);
+			break;
+		}
+	}
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return data;
+}
+
 static const struct gpio_chip msm_gpio_template = {
 	.direction_input  = msm_gpio_direction_input,
 	.direction_output = msm_gpio_direction_output,
@@ -687,6 +727,11 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
+	struct irq_data *pdc_irqd = msm_get_pdc_irq_data(d);
+
+	// TODO: Lock PDC irq chip and set type?
+	if (pdc_irqd)
+		pdc_irqd->chip->irq_set_type(pdc_irqd, type);

 	g = &pctrl->soc->groups[d->hwirq];

@@ -779,9 +824,13 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned long flags;
+	struct irq_data *pdc_irqd = msm_get_pdc_irq_data(d);

 	raw_spin_lock_irqsave(&pctrl->lock, flags);

+	if (pdc_irqd)
+		irq_set_irq_wake(pdc_irqd->irq, on);
+
 	irq_set_irq_wake(pctrl->irq, on);

 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
@@ -863,6 +912,117 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
 }

+static irqreturn_t wake_irq_gpio_handler(int irq, void *data)
+{
+	struct irq_data *irqd = data;
+	struct irq_desc *desc = irq_data_to_desc(irqd);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	int irq_pin = irq_find_mapping(gc->irq.domain, irqd->hwirq);
+
+	chained_irq_enter(chip, desc);
+	generic_handle_irq(irq_pin);
+	chained_irq_exit(chip, desc);
+
+	return IRQ_HANDLED;
+}
+
+static int msm_gpio_pdc_pin_request(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct platform_device *pdev = to_platform_device(pctrl->dev);
+	unsigned pin, npins, irq;
+	struct wakeup_gpio_irq_map *p;
+	unsigned long flags, trigger;
+	const char *pin_name;
+	int i, ret;
+
+	pin = msm_gpio_get_pdc_pin(pctrl, d->hwirq);
+	if (pin < 0)
+		return 0;
+
+	npins = platform_irq_count(pdev);
+	if (npins <= 0)
+		return npins;
+
+	for (i = 0; i < npins; i++) {
+		irq = platform_get_irq(pdev, i);
+		if (irq >= 0 && pin == irq_get_irq_data(irq)->hwirq)
+			break;
+	}
+	if (i == npins)
+		return 0;
+
+	pin_name = kasprintf(GFP_KERNEL, "gpio-%lu", d->hwirq);
+	if (!pin_name)
+		return -ENOMEM;
+
+	trigger = irqd_get_trigger_type(d) | IRQF_ONESHOT | IRQF_NO_SUSPEND;
+	ret = request_irq(irq, wake_irq_gpio_handler, trigger, pin_name, d);
+	if (ret) {
+		pr_warn("GPIO-%lu could not be set up as wakeup", d->hwirq);
+		return ret;
+	}
+
+	p = kzalloc(sizeof(p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->pdc_irq = irq;
+	p->gpio = d->hwirq;
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	list_add(&p->list, &pctrl->pdc_irqs);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
+static int msm_gpio_pdc_pin_release(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct wakeup_gpio_irq_map *p, *n, *t = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	list_for_each_entry_safe(p, n, &pctrl->pdc_irqs, list) {
+		if (p->gpio == d->hwirq) {
+			list_del(&p->list);
+			t = p;
+			break;
+		}
+	}
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+	if (t) {
+		free_irq(t->pdc_irq, NULL);
+		kfree(t);
+	}
+
+	return 0;
+}
+
+static int msm_gpio_irq_reqres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	if (gpiochip_lock_as_irq(gc, irqd_to_hwirq(d))) {
+		dev_err(gc->parent,"unable to lock HW IRQ %lu for IRQ\n",
+			irqd_to_hwirq(d));
+		return -EINVAL;
+	}
+
+	return msm_gpio_pdc_pin_request(d);
+}
+
+static void msm_gpio_irq_relres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	msm_gpio_pdc_pin_release(d);
+	gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
+}
+
 static int msm_gpio_init(struct msm_pinctrl *pctrl)
 {
 	struct gpio_chip *chip;
@@ -887,6 +1047,9 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
 	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
+	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
+	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
+	INIT_LIST_HEAD(&pctrl->pdc_irqs);

 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 9b9feea540ff..5b7f3160affe 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -97,6 +97,16 @@ struct msm_pingroup {
 	unsigned intr_detection_width:5;
 };

+/**
+ * struct msm_pinctrl_pdc_map - Map GPIOs to PDC pins on RPMH based SoCs
+ * @hwirq:	   The GPIO that is mapped.
+ * @pdc_pin:	   The PDC pin to with the GPIO IRQ line is routed.
+ */
+struct msm_pinctrl_pdc_map {
+	u32 hwirq;
+	u32 pdc_pin;
+};
+
 /**
  * struct msm_pinctrl_soc_data - Qualcomm pin controller driver configuration
  * @pins:	    An array describing all pins the pin controller affects.
@@ -107,6 +117,8 @@ struct msm_pingroup {
  * @ngroups:	    The numbmer of entries in @groups.
  * @ngpio:	    The number of pingroups the driver should expose as GPIOs.
  * @pull_no_keeper: The SoC does not support keeper bias.
+ * @pdc_map:	    The map of GPIOs to the always-on PDC interrupt lines.
+ * @npdc_pins:	    The number of GPIOs mapped to the PDC pins in @pdc_map.
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -117,6 +129,8 @@ struct msm_pinctrl_soc_data {
 	unsigned ngroups;
 	unsigned ngpios;
 	bool pull_no_keeper;
+	struct msm_pinctrl_pdc_map *pdc_map;
+	unsigned npdc_pins;
 };

 int msm_pinctrl_probe(struct platform_device *pdev,
--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
