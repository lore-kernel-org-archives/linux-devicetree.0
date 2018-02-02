From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 06/14] clk: stm32mp1: add PLL clocks
Date: Fri, 2 Feb 2018 15:03:34 +0100
Message-ID: <1517580222-23301-7-git-send-email-gabriel.fernandez@st.com>
References: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517580222-23301-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

STMP32MP1 has 4 PLLs.
PLL supports integer and fractional mode.
Each PLL has 3 output dividers (p, q, r)

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 drivers/clk/clk-stm32mp1.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 1c9a84a..33f0d09 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -506,6 +507,181 @@ static struct clk_hw *clk_register_mp1_gate(struct device *dev,
 	return hw;
 }
 
+/* STM32 PLL */
+
+struct stm32_pll_obj {
+	/* lock pll enable/disable registers */
+	spinlock_t *lock;
+	void __iomem *reg;
+	struct clk_hw hw;
+};
+
+#define to_pll(_hw) container_of(_hw, struct stm32_pll_obj, hw)
+
+#define PLL_ON		BIT(0)
+#define PLL_RDY		BIT(1)
+#define DIVN_MASK	0x1FF
+#define DIVM_MASK	0x3F
+#define DIVM_SHIFT	16
+#define DIVN_SHIFT	0
+#define FRAC_OFFSET	0xC
+#define FRAC_MASK	0x1FFF
+#define FRAC_SHIFT	3
+#define FRACLE		BIT(16)
+
+static int __pll_is_enabled(struct clk_hw *hw)
+{
+	struct stm32_pll_obj *clk_elem = to_pll(hw);
+
+	return readl_relaxed(clk_elem->reg) & PLL_ON;
+}
+
+#define TIMEOUT 5
+
+static int pll_enable(struct clk_hw *hw)
+{
+	struct stm32_pll_obj *clk_elem = to_pll(hw);
+	u32 reg;
+	unsigned long flags = 0;
+	unsigned int timeout = TIMEOUT;
+	int bit_status = 0;
+
+	spin_lock_irqsave(clk_elem->lock, flags);
+
+	if (__pll_is_enabled(hw))
+		goto unlock;
+
+	reg = readl_relaxed(clk_elem->reg);
+	reg |= PLL_ON;
+	writel_relaxed(reg, clk_elem->reg);
+
+	/* We can't use readl_poll_timeout() because we can be blocked if
+	 * someone enables this clock before clocksource changes.
+	 * Only jiffies counter is available. Jiffies are incremented by
+	 * interruptions and enable op does not allow to be interrupted.
+	 */
+	do {
+		bit_status = !(readl_relaxed(clk_elem->reg) & PLL_RDY);
+
+		if (bit_status)
+			udelay(120);
+
+	} while (bit_status && --timeout);
+
+unlock:
+	spin_unlock_irqrestore(clk_elem->lock, flags);
+
+	return bit_status;
+}
+
+static void pll_disable(struct clk_hw *hw)
+{
+	struct stm32_pll_obj *clk_elem = to_pll(hw);
+	u32 reg;
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(clk_elem->lock, flags);
+
+	reg = readl_relaxed(clk_elem->reg);
+	reg &= ~PLL_ON;
+	writel_relaxed(reg, clk_elem->reg);
+
+	spin_unlock_irqrestore(clk_elem->lock, flags);
+}
+
+static u32 pll_frac_val(struct clk_hw *hw)
+{
+	struct stm32_pll_obj *clk_elem = to_pll(hw);
+	u32 reg, frac = 0;
+
+	reg = readl_relaxed(clk_elem->reg + FRAC_OFFSET);
+	if (reg & FRACLE)
+		frac = (reg >> FRAC_SHIFT) & FRAC_MASK;
+
+	return frac;
+}
+
+static unsigned long pll_recalc_rate(struct clk_hw *hw,
+				     unsigned long parent_rate)
+{
+	struct stm32_pll_obj *clk_elem = to_pll(hw);
+	u32 reg;
+	u32 frac, divm, divn;
+	u64 rate, rate_frac = 0;
+
+	reg = readl_relaxed(clk_elem->reg + 4);
+
+	divm = ((reg >> DIVM_SHIFT) & DIVM_MASK) + 1;
+	divn = ((reg >> DIVN_SHIFT) & DIVN_MASK) + 1;
+	rate = (u64)parent_rate * divn;
+
+	do_div(rate, divm);
+
+	frac = pll_frac_val(hw);
+	if (frac) {
+		rate_frac = (u64)parent_rate * (u64)frac;
+		do_div(rate_frac, (divm * 8192));
+	}
+
+	return rate + rate_frac;
+}
+
+static int pll_is_enabled(struct clk_hw *hw)
+{
+	struct stm32_pll_obj *clk_elem = to_pll(hw);
+	unsigned long flags = 0;
+	int ret;
+
+	spin_lock_irqsave(clk_elem->lock, flags);
+	ret = __pll_is_enabled(hw);
+	spin_unlock_irqrestore(clk_elem->lock, flags);
+
+	return ret;
+}
+
+static const struct clk_ops pll_ops = {
+	.enable = pll_enable,
+	.disable = pll_disable,
+	.recalc_rate = pll_recalc_rate,
+	.is_enabled = pll_is_enabled,
+};
+
+static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
+				       const char *parent_name,
+				       void __iomem *reg,
+				       unsigned long flags,
+				       spinlock_t *lock)
+{
+	struct stm32_pll_obj *element;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int err;
+
+	element = kzalloc(sizeof(*element), GFP_KERNEL);
+	if (!element)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &pll_ops;
+	init.flags = flags;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	element->hw.init = &init;
+	element->reg = reg;
+	element->lock = lock;
+
+	hw = &element->hw;
+	err = clk_hw_register(dev, hw);
+
+	if (err) {
+		kfree(element);
+		return ERR_PTR(err);
+	}
+
+	return hw;
+}
+
 static struct clk_hw *
 _clk_register_mp1_gate(struct device *dev,
 		       struct clk_hw_onecell_data *clk_data,
@@ -524,6 +700,21 @@ static struct clk_hw *clk_register_mp1_gate(struct device *dev,
 				     lock);
 }
 
+struct stm32_pll_cfg {
+	u32 offset;
+};
+
+struct clk_hw *_clk_register_pll(struct device *dev,
+				 struct clk_hw_onecell_data *clk_data,
+				 void __iomem *base, spinlock_t *lock,
+				 const struct clock_config *cfg)
+{
+	struct stm32_pll_cfg *stm_pll_cfg = cfg->cfg;
+
+	return clk_register_pll(dev, cfg->name, cfg->parent_name,
+				base + stm_pll_cfg->offset, cfg->flags, lock);
+}
+
 #define GATE(_id, _name, _parent, _flags, _offset, _bit_idx, _gate_flags)\
 {\
 	.id		= _id,\
@@ -602,6 +793,18 @@ static struct clk_hw *clk_register_mp1_gate(struct device *dev,
 	.func		= _clk_register_mp1_gate,\
 }
 
+#define PLL(_id, _name, _parent, _flags, _offset)\
+{\
+	.id		= _id,\
+	.name		= _name,\
+	.parent_name	= _parent,\
+	.flags		= _flags,\
+	.cfg		=  &(struct stm32_pll_cfg) {\
+		.offset = _offset,\
+	},\
+	.func		= _clk_register_pll,\
+}
+
 static const struct clock_config stm32mp1_clock_cfg[] = {
 	/* Oscillator divider */
 	DIV(NO_ID, "clk-hsi-div", "clk-hsi", 0, RCC_HSICFGR, 0, 2,
@@ -625,6 +828,12 @@ static struct clk_hw *clk_register_mp1_gate(struct device *dev,
 
 	MUX(NO_ID, "ref4", ref4_parents, CLK_OPS_PARENT_ENABLE, RCC_RCK4SELR,
 	    0, 2, CLK_MUX_READ_ONLY),
+
+	/* PLLs */
+	PLL(PLL1, "pll1", "ref1", CLK_IGNORE_UNUSED, RCC_PLL1CR),
+	PLL(PLL2, "pll2", "ref1", CLK_IGNORE_UNUSED, RCC_PLL2CR),
+	PLL(PLL3, "pll3", "ref3", CLK_IGNORE_UNUSED, RCC_PLL3CR),
+	PLL(PLL4, "pll4", "ref4", CLK_IGNORE_UNUSED, RCC_PLL4CR),
 };
 
 struct stm32_clock_match_data {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
