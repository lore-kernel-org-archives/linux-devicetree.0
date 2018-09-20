From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/4] pinctrl: qcom: Introduce readl/writel accessors
Date: Wed, 19 Sep 2018 18:37:09 -0700
Message-ID: <20180920013712.2361-2-bjorn.andersson@linaro.org>
References: <20180920013712.2361-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920013712.2361-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In preparation for the support for dispersed tiles move all readl and
writel calls to helper functions. This will allow us to isolate the
added complexity of another indirection.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 90 ++++++++++++++++++------------
 1 file changed, 54 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 1684b2da09d5..86fbb5fe4d0e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -73,6 +73,24 @@ struct msm_pinctrl {
 	void __iomem *regs;
 };
 
+#define MSM_ACCESSOR(name) \
+static u32 msm_readl_##name(struct msm_pinctrl *pctrl, \
+			    const struct msm_pingroup *g) \
+{ \
+	return readl(pctrl->regs + g->name##_reg); \
+} \
+static void msm_writel_##name(u32 val, struct msm_pinctrl *pctrl, \
+			      const struct msm_pingroup *g) \
+{ \
+	writel(val, pctrl->regs + g->name##_reg); \
+}
+
+MSM_ACCESSOR(ctl)
+MSM_ACCESSOR(io)
+MSM_ACCESSOR(intr_cfg)
+MSM_ACCESSOR(intr_status)
+MSM_ACCESSOR(intr_target)
+
 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -166,10 +184,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->ctl_reg);
+	val = msm_readl_ctl(pctrl, g);
 	val &= ~mask;
 	val |= i << g->mux_bit;
-	writel(val, pctrl->regs + g->ctl_reg);
+	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
@@ -260,7 +278,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		return ret;
 
-	val = readl(pctrl->regs + g->ctl_reg);
+	val = msm_readl_ctl(pctrl, g);
 	arg = (val >> bit) & mask;
 
 	/* Convert register value to pinconf value */
@@ -299,7 +317,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 		if (!arg)
 			return -EINVAL;
 
-		val = readl(pctrl->regs + g->io_reg);
+		val = msm_readl_io(pctrl, g);
 		arg = !!(val & BIT(g->in_bit));
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
@@ -373,12 +391,12 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_OUTPUT:
 			/* set output value */
 			raw_spin_lock_irqsave(&pctrl->lock, flags);
-			val = readl(pctrl->regs + g->io_reg);
+			val = msm_readl_io(pctrl, g);
 			if (arg)
 				val |= BIT(g->out_bit);
 			else
 				val &= ~BIT(g->out_bit);
-			writel(val, pctrl->regs + g->io_reg);
+			msm_writel_io(val, pctrl, g);
 			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 			/* enable output */
@@ -401,10 +419,10 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 		}
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);
-		val = readl(pctrl->regs + g->ctl_reg);
+		val = msm_readl_ctl(pctrl, g);
 		val &= ~(mask << bit);
 		val |= arg << bit;
-		writel(val, pctrl->regs + g->ctl_reg);
+		msm_writel_ctl(val, pctrl, g);
 		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 	}
 
@@ -428,9 +446,9 @@ static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->ctl_reg);
+	val = msm_readl_ctl(pctrl, g);
 	val &= ~BIT(g->oe_bit);
-	writel(val, pctrl->regs + g->ctl_reg);
+	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
@@ -448,16 +466,16 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->io_reg);
+	val = msm_readl_io(pctrl, g);
 	if (value)
 		val |= BIT(g->out_bit);
 	else
 		val &= ~BIT(g->out_bit);
-	writel(val, pctrl->regs + g->io_reg);
+	msm_writel_io(val, pctrl, g);
 
-	val = readl(pctrl->regs + g->ctl_reg);
+	val = msm_readl_ctl(pctrl, g);
 	val |= BIT(g->oe_bit);
-	writel(val, pctrl->regs + g->ctl_reg);
+	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
@@ -472,7 +490,7 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	g = &pctrl->soc->groups[offset];
 
-	val = readl(pctrl->regs + g->ctl_reg);
+	val = msm_readl_ctl(pctrl, g);
 
 	/* 0 = output, 1 = input */
 	return val & BIT(g->oe_bit) ? 0 : 1;
@@ -486,7 +504,7 @@ static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 	g = &pctrl->soc->groups[offset];
 
-	val = readl(pctrl->regs + g->io_reg);
+	val = msm_readl_io(pctrl, g);
 	return !!(val & BIT(g->in_bit));
 }
 
@@ -501,12 +519,12 @@ static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->io_reg);
+	val = msm_readl_io(pctrl, g);
 	if (value)
 		val |= BIT(g->out_bit);
 	else
 		val &= ~BIT(g->out_bit);
-	writel(val, pctrl->regs + g->io_reg);
+	msm_writel_io(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
@@ -546,8 +564,8 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 		return;
 
 	g = &pctrl->soc->groups[offset];
-	ctl_reg = readl(pctrl->regs + g->ctl_reg);
-	io_reg = readl(pctrl->regs + g->io_reg);
+	ctl_reg = msm_readl_ctl(pctrl, g);
+	io_reg = msm_readl_io(pctrl, g);
 
 	is_out = !!(ctl_reg & BIT(g->oe_bit));
 	func = (ctl_reg >> g->mux_bit) & 7;
@@ -622,14 +640,14 @@ static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
 	unsigned pol;
 
 	do {
-		val = readl(pctrl->regs + g->io_reg) & BIT(g->in_bit);
+		val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
 
-		pol = readl(pctrl->regs + g->intr_cfg_reg);
+		pol = msm_readl_intr_cfg(pctrl, g);
 		pol ^= BIT(g->intr_polarity_bit);
-		writel(pol, pctrl->regs + g->intr_cfg_reg);
+		msm_writel_intr_cfg(val, pctrl, g);
 
-		val2 = readl(pctrl->regs + g->io_reg) & BIT(g->in_bit);
-		intstat = readl(pctrl->regs + g->intr_status_reg);
+		val2 = msm_readl_io(pctrl, g) & BIT(g->in_bit);
+		intstat = msm_readl_intr_status(pctrl, g);
 		if (intstat || (val == val2))
 			return;
 	} while (loop_limit-- > 0);
@@ -649,7 +667,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->intr_cfg_reg);
+	val = msm_readl_intr_cfg(pctrl, g);
 	/*
 	 * There are two bits that control interrupt forwarding to the CPU. The
 	 * RAW_STATUS_EN bit causes the level or edge sensed on the line to be
@@ -674,7 +692,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 		val &= ~BIT(g->intr_raw_status_bit);
 
 	val &= ~BIT(g->intr_enable_bit);
-	writel(val, pctrl->regs + g->intr_cfg_reg);
+	msm_writel_intr_cfg(val, pctrl, g);
 
 	clear_bit(d->hwirq, pctrl->enabled_irqs);
 
@@ -693,10 +711,10 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->intr_cfg_reg);
+	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_enable_bit);
-	writel(val, pctrl->regs + g->intr_cfg_reg);
+	msm_writel_intr_cfg(val, pctrl, g);
 
 	set_bit(d->hwirq, pctrl->enabled_irqs);
 
@@ -715,12 +733,12 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->intr_status_reg);
+	val = msm_readl_intr_status(pctrl, g);
 	if (g->intr_ack_high)
 		val |= BIT(g->intr_status_bit);
 	else
 		val &= ~BIT(g->intr_status_bit);
-	writel(val, pctrl->regs + g->intr_status_reg);
+	msm_writel_intr_status(val, pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 		msm_gpio_update_dual_edge_pos(pctrl, g, d);
@@ -749,17 +767,17 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
 
 	/* Route interrupts to application cpu */
-	val = readl(pctrl->regs + g->intr_target_reg);
+	val = msm_readl_intr_target(pctrl, g);
 	val &= ~(7 << g->intr_target_bit);
 	val |= g->intr_target_kpss_val << g->intr_target_bit;
-	writel(val, pctrl->regs + g->intr_target_reg);
+	msm_writel_intr_target(val, pctrl, g);
 
 	/* Update configuration for gpio.
 	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
 	 * internal circuitry of TLMM, toggling the RAW_STATUS
 	 * could cause the INTR_STATUS to be set for EDGE interrupts.
 	 */
-	val = readl(pctrl->regs + g->intr_cfg_reg);
+	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	if (g->intr_detection_width == 2) {
 		val &= ~(3 << g->intr_detection_bit);
@@ -807,7 +825,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	} else {
 		BUG();
 	}
-	writel(val, pctrl->regs + g->intr_cfg_reg);
+	msm_writel_intr_cfg(val, pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 		msm_gpio_update_dual_edge_pos(pctrl, g, d);
@@ -891,7 +909,7 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 	 */
 	for_each_set_bit(i, pctrl->enabled_irqs, pctrl->chip.ngpio) {
 		g = &pctrl->soc->groups[i];
-		val = readl(pctrl->regs + g->intr_status_reg);
+		val = msm_readl_intr_status(pctrl, g);
 		if (val & BIT(g->intr_status_bit)) {
 			irq_pin = irq_find_mapping(gc->irq.domain, i);
 			generic_handle_irq(irq_pin);
-- 
2.18.0
