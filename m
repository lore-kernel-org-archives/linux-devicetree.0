From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v6 2/2] clk: clk-pic32: Add PIC32 clock driver
Date: Mon, 8 Feb 2016 14:28:17 -0700
Message-ID: <1454966902-15228-2-git-send-email-joshua.henderson@microchip.com>
References: <1454966902-15228-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454966902-15228-1-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

This clock driver implements PIC32 specific clock-tree. clock-tree
entities can only be configured through device-tree file (OF).

Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
Changes since v5:
	- sort linux includes and asm includes.
	- use BIT() wherever applicable
	- drop 'microchip,ignore-unused' usage, handling in favor of critical
	  clock
	- drop 'fixed divider' handling for periph clock
	- drop use of 'debug_init()' clk operation callback for register dump
	- drop clk_lock(), clk_unlock() spinlock wrapper
	- drop unimplemented pic32_devcon_syslock() macro
	- use readl()/writel() instead of clk_readl()/clk_writel()
	- drop redundant spinlock, unlock calls in sosc_clk_enable()/disable()
	- use CLK_SET_RATE_GATE, _SET_PARENT_GATE for refo-clocks
	- use kcalloc() instead of kmalloc() wherever applicable
	- use of_io_request_and_map() in soc_clock_init()
	- drop use of pbclk(/roclk)_endisable() inline function
	- use readl_poll_timeout_atomic() for wait_for_bit() type loop
	- drop cpu_relax() after clk gating
	- promote u8, u16 to u32 wherever applicable
	- fix sosc clock status polling
	- drop memory alloc from pic32_of_clk_get_parent_indices() instead
	  callers  will supply buffer to hold output parent indices
	- reword comments about spll_clk_set_rate() pre-conditions
	- drop use of CLK_BASIC wherever applicable
	- reword comments in sclk_set_parent()
Changes since v4: None
Changes since v3: None
Changes since v2:
	- Replace __clk_debug with pr_debug
	- Add of_clk_parent_fill usage in PIC32 clock driver
Changes since v1:
	- Remove unused PIC32 MPLL support.
	- Remove support for initializing default parent/rate for REFOSC
	  clocks.
---
 drivers/clk/Kconfig     |    3 +
 drivers/clk/Makefile    |    1 +
 drivers/clk/clk-pic32.c | 1470 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1474 insertions(+)
 create mode 100644 drivers/clk/clk-pic32.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index eca8e01..41e9c14 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -200,6 +200,9 @@ config COMMON_CLK_CDCE706
 	---help---
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
+config COMMON_CLK_PIC32
+	def_bool COMMON_CLK && MACH_PIC32
+
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/qcom/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b038e36..88a5ce6 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
 obj-$(CONFIG_ARCH_NOMADIK)		+= clk-nomadik.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= clk-nspire.o
 obj-$(CONFIG_COMMON_CLK_PALMAS)		+= clk-palmas.o
+obj-$(CONFIG_COMMON_CLK_PIC32)		+= clk-pic32.o
 obj-$(CONFIG_CLK_QORIQ)			+= clk-qoriq.o
 obj-$(CONFIG_COMMON_CLK_RK808)		+= clk-rk808.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
diff --git a/drivers/clk/clk-pic32.c b/drivers/clk/clk-pic32.c
new file mode 100644
index 0000000..43ae30f
--- /dev/null
+++ b/drivers/clk/clk-pic32.c
@@ -0,0 +1,1470 @@
+/*
+ * Purna Chandra Mandal,<purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
+ * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
+ *
+ * This program is free software; you can distribute it and/or modify it
+ * under the terms of the GNU General Public License (Version 2) as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ */
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+
+#include <asm/traps.h>
+#include <asm/mach-pic32/pic32.h>
+
+/* OSCCON Reg fields */
+#define OSC_CUR_MASK		0x07
+#define OSC_CUR_SHIFT		12
+#define OSC_NEW_MASK		0x07
+#define OSC_NEW_SHIFT		8
+#define OSC_SWEN		BIT(0)
+#define OSC_CLK_FAILED		BIT(2)
+
+/* SPLLCON Reg fields */
+#define PLL_RANGE_MASK		0x07
+#define PLL_RANGE_SHIFT		0
+#define PLL_ICLK_MASK		0x01
+#define PLL_ICLK_SHIFT		7
+#define PLL_IDIV_MASK		0x07
+#define PLL_IDIV_SHIFT		8
+#define PLL_ODIV_MASK		0x07
+#define PLL_ODIV_SHIFT		24
+#define PLL_MULT_MASK		0x7F
+#define PLL_MULT_SHIFT		16
+#define PLL_MULT_MAX		128
+#define PLL_ODIV_MIN		1
+#define PLL_ODIV_MAX		5
+
+/* Peripheral Bus Clock Reg Fields */
+#define PB_DIV_MASK		0x7f
+#define PB_DIV_SHIFT		0
+#define PB_DIV_READY		BIT(11)
+#define PB_DIV_ENABLE		BIT(15)
+#define PB_DIV_MAX		128
+#define PB_DIV_MIN		0
+
+/* Reference Oscillator Control Reg fields */
+#define REFO_SEL_MASK		0x0f
+#define REFO_SEL_SHIFT		0
+#define REFO_ACTIVE		BIT(8)
+#define REFO_DIVSW_EN		BIT(9)
+#define REFO_OE			BIT(12)
+#define REFO_ON			BIT(15)
+#define REFO_DIV_SHIFT		16
+#define REFO_DIV_MASK		0x7fff
+
+/* Reference Oscillator Trim Register Fields */
+#define REFO_TRIM_REG		0x10
+#define REFO_TRIM_MASK		0x1ff
+#define REFO_TRIM_SHIFT		23
+#define REFO_TRIM_MAX		511
+
+/* FRC postscaler */
+#define OSC_FRCDIV_MASK		0x07
+#define OSC_FRCDIV_SHIFT	24
+
+/* Mux Slew Control Register fields */
+#define SLEW_BUSY		BIT(0)
+#define SLEW_DOWNEN		BIT(1)
+#define SLEW_UPEN		BIT(2)
+#define SLEW_DIV		0x07
+#define SLEW_DIV_SHIFT		8
+#define SLEW_SYSDIV		0x0f
+#define SLEW_SYSDIV_SHIFT	20
+
+/* Clock Poll Timeout */
+#define LOCK_TIMEOUT_US		USEC_PER_MSEC
+
+/* System PLL Clk */
+struct pic32_spll {
+	struct clk_hw hw;
+	void __iomem *regs;
+	void __iomem *status_reg;
+	u32 lock_mask;
+	u32 idiv; /* pll-iclk divider, treated fixed */
+};
+
+/* System Clk */
+struct pic32_sclk {
+	struct clk_hw hw;
+	void __iomem *regs;
+	void __iomem *slwreg;
+	u32 *parent_idx;
+};
+
+/* Reference Oscillator */
+struct pic32_refosc {
+	struct clk_hw hw;
+	void __iomem *regs;
+	u32 *parent_idx;
+};
+
+/* Peripheral Bus Clock */
+struct pic32_pbclk {
+	struct clk_hw hw;
+	void __iomem *regs;
+};
+
+/* External SOSC clock  */
+struct pic32_sosc {
+	struct clk_hw hw;
+	void __iomem *enable_reg;
+	void __iomem *status_reg;
+	u32 bitmask;
+	u32 status_bitmask;
+	unsigned long fixed_rate;
+};
+
+/* Soc specific clock reg-base */
+static void __iomem *pic32_clk_regbase;
+static struct clk_hw *pic32_sys_clk;
+
+static DEFINE_SPINLOCK(lock);
+
+/* add instruction pipeline delay while CPU clock is in-transition. */
+#define cpu_nop5()			\
+do {					\
+	__asm__ __volatile__("nop");	\
+	__asm__ __volatile__("nop");	\
+	__asm__ __volatile__("nop");	\
+	__asm__ __volatile__("nop");	\
+	__asm__ __volatile__("nop");	\
+} while (0)
+
+#define clkhw_to_spll(_hw)	container_of(_hw, struct pic32_spll, hw)
+#define clkhw_to_refosc(_hw)	container_of(_hw, struct pic32_refosc, hw)
+#define clkhw_to_pbclk(_hw)	container_of(_hw, struct pic32_pbclk, hw)
+#define clkhw_to_sys_clk(_hw)	container_of(_hw, struct pic32_sclk, hw)
+#define clkhw_to_sosc(_hw)	container_of(_hw, struct pic32_sosc, hw)
+
+/* pic32_of_clk_get_parent_indices - get parent clk hardware indices.
+ * @np: pointer to clock node
+ * @table_p: pointer to array to store parent clk indices
+ * @nr_parents: number of parents
+ *
+ * This is useful specifically for mux clocks where some of possible parent
+ * clocks logically is dropped thereby creating a discontinuous linear
+ * sequence. This API refers OF property "microchip,clock-indices" of the
+ * device node to find hardware id(s) corresponding to each input clock source.
+ */
+int pic32_of_clk_get_parent_indices(struct device_node *np,
+				    u32 *table_p,
+				    int nr_parents)
+{
+	struct property *prop;
+	const __be32 *pv;
+	int i;
+
+	if (!table_p || !nr_parents)
+		return -EINVAL;
+
+	prop = of_find_property(np, "microchip,clock-indices", NULL);
+	if (!prop)
+		return 0;
+
+	for (i = 0, pv = NULL; i < nr_parents; i++) {
+		pv = of_prop_next_u32(prop, pv, &table_p[i]);
+		if (!pv)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(pic32_of_clk_get_parent_indices);
+
+static int pic32_of_clk_register_clkdev(struct device_node *np, struct clk *clk)
+{
+	int ret;
+
+	ret = clk_register_clkdev(clk, NULL, __clk_get_name(clk));
+	if (ret) {
+		pr_err("%s: clkdev register failed, ret %d\n",
+		       __clk_get_name(clk), ret);
+		goto out_err;
+	}
+
+	ret = of_clk_add_provider(np, of_clk_src_simple_get, clk);
+
+out_err:
+	return ret;
+}
+
+static int pbclk_is_enabled(struct clk_hw *hw)
+{
+	struct pic32_pbclk *pb = clkhw_to_pbclk(hw);
+
+	return readl(pb->regs) & PB_DIV_ENABLE;
+}
+
+static int pbclk_enable(struct clk_hw *hw)
+{
+	struct pic32_pbclk *pb = clkhw_to_pbclk(hw);
+
+	writel(PB_DIV_ENABLE, PIC32_SET(pb->regs));
+	return 0;
+}
+
+static void pbclk_disable(struct clk_hw *hw)
+{
+	struct pic32_pbclk *pb = clkhw_to_pbclk(hw);
+
+	writel(PB_DIV_ENABLE, PIC32_CLR(pb->regs));
+}
+
+static unsigned long calc_best_divided_rate(unsigned long rate,
+					    unsigned long parent_rate,
+					    u32 divider_max,
+					    u32 divider_min)
+{
+	unsigned long divided_rate, divided_rate_down, best_rate;
+	unsigned long div, div_up;
+
+	/* eq. clk_rate = parent_rate / divider.
+	 *
+	 * Find best divider to produce closest of target divided rate.
+	 */
+	div = parent_rate / rate;
+	div = clamp_val(div, divider_min, divider_max);
+	div_up = clamp_val(div + 1, divider_min, divider_max);
+
+	divided_rate = parent_rate / div;
+	divided_rate_down = parent_rate / div_up;
+	if (abs(rate - divided_rate_down) < abs(rate - divided_rate))
+		best_rate = divided_rate_down;
+	else
+		best_rate = divided_rate;
+
+	return best_rate;
+}
+
+static inline u32 pbclk_read_pbdiv(struct pic32_pbclk *pb)
+{
+	return ((readl(pb->regs) >> PB_DIV_SHIFT) & PB_DIV_MASK) + 1;
+}
+
+static unsigned long pbclk_recalc_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	struct pic32_pbclk *pb = clkhw_to_pbclk(hw);
+
+	return parent_rate / pbclk_read_pbdiv(pb);
+}
+
+static long pbclk_round_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long *parent_rate)
+{
+	return calc_best_divided_rate(rate, *parent_rate,
+				      PB_DIV_MAX, PB_DIV_MIN);
+}
+
+static int pbclk_set_rate(struct clk_hw *hw, unsigned long rate,
+			  unsigned long parent_rate)
+{
+	struct pic32_pbclk *pb = clkhw_to_pbclk(hw);
+	unsigned long flags;
+	u32 v, div;
+	int err;
+
+	/* check & wait for DIV_READY */
+	err = readl_poll_timeout_atomic(pb->regs, v, v & PB_DIV_READY,
+					1, LOCK_TIMEOUT_US);
+	if (err)
+		return err;
+
+	/* calculate clkdiv and best rate */
+	div = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+	spin_lock_irqsave(&lock, flags);
+
+	/* apply new div */
+	v = readl(pb->regs);
+	v &= ~PB_DIV_MASK;
+	v |= (div - 1);
+
+	pic32_syskey_unlock();
+
+	writel(v, pb->regs);
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	/* wait again, for pbdivready */
+	err = readl_poll_timeout_atomic(pb->regs, v, v & PB_DIV_READY,
+					1, LOCK_TIMEOUT_US);
+	if (err)
+		return err;
+
+	/* confirm that new div is applied correctly */
+	return (pbclk_read_pbdiv(pb) == div) ? 0 : -EBUSY;
+}
+
+/* Reference Oscillator operations */
+static int roclk_is_enabled(struct clk_hw *hw)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+
+	return readl(refo->regs) & REFO_ON;
+}
+
+static int roclk_enable(struct clk_hw *hw)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+
+	writel(REFO_ON | REFO_OE, PIC32_SET(refo->regs));
+	return 0;
+}
+
+static void roclk_disable(struct clk_hw *hw)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+
+	writel(REFO_ON | REFO_OE, PIC32_CLR(refo->regs));
+}
+
+static void roclk_init(struct clk_hw *hw)
+{
+	/* initialize clock in disabled state */
+	roclk_disable(hw);
+}
+
+static u8 roclk_get_parent(struct clk_hw *hw)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+	u32 v, i;
+
+	v = (readl(refo->regs) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
+
+	if (!refo->parent_idx)
+		return (u8)v;
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
+		if (refo->parent_idx[i] == v)
+			return (u8)i;
+
+	return -EINVAL;
+}
+
+static unsigned long roclk_calc_rate(unsigned long parent_rate,
+				     u32 rodiv, u32 rotrim)
+{
+	u64 rate64;
+
+	/* fout = fin / [2 * {div + (trim / 512)}]
+	 *	= fin * 512 / [1024 * div + 2 * trim]
+	 *	= fin * 256 / (512 * div + trim)
+	 *	= (fin << 8) / ((div << 9) + trim)
+	 */
+	if (rotrim) {
+		rodiv = (rodiv << 9) + rotrim;
+		rate64 = parent_rate;
+		rate64 <<= 8;
+		do_div(rate64, rodiv);
+	} else if (rodiv) {
+		rate64 = parent_rate / (rodiv << 1);
+	} else {
+		rate64 = parent_rate;
+	}
+	return (unsigned long)rate64;
+}
+
+static void roclk_calc_div_trim(unsigned long rate,
+				unsigned long parent_rate,
+				u32 *rodiv_p, u32 *rotrim_p)
+{
+	u32 div, rotrim, rodiv;
+	u64 frac;
+
+	/* Find integer approximation of floating-point arithmetic.
+	 *      fout = fin / [2 * {rodiv + (rotrim / 512)}] ... (1)
+	 * i.e. fout = fin / 2 * DIV
+	 *      whereas DIV = rodiv + (rotrim / 512)
+	 *
+	 * Since kernel does not perform floating-point arithmatic so
+	 * (rotrim/512) will be zero. And DIV & rodiv will result same.
+	 *
+	 * ie. fout = (fin * 256) / [(512 * rodiv) + rotrim]  ... from (1)
+	 * ie. rotrim = ((fin * 256) / fout) - (512 * DIV)
+	 */
+	if (parent_rate <= rate) {
+		div = 0;
+		frac = 0;
+		rodiv = 0;
+		rotrim = 0;
+	} else {
+		div = parent_rate / (rate << 1);
+		frac = parent_rate;
+		frac <<= 8;
+		do_div(frac, rate);
+		frac -= (u64)(div << 9);
+
+		rodiv = (div > REFO_DIV_MASK) ? REFO_DIV_MASK : div;
+		rotrim = (frac >= REFO_TRIM_MAX) ? REFO_TRIM_MAX : frac;
+	}
+
+	if (rodiv_p)
+		*rodiv_p = rodiv;
+
+	if (rotrim_p)
+		*rotrim_p = rotrim;
+}
+
+static unsigned long roclk_recalc_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+	u32 v, rodiv, rotrim;
+
+	/* get rodiv */
+	v = readl(refo->regs);
+	rodiv = (v >> REFO_DIV_SHIFT) & REFO_DIV_MASK;
+
+	/* get trim */
+	v = readl(refo->regs + REFO_TRIM_REG);
+	rotrim = (v >> REFO_TRIM_SHIFT) & REFO_TRIM_MASK;
+
+	return roclk_calc_rate(parent_rate, rodiv, rotrim);
+}
+
+static long roclk_round_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long *parent_rate)
+{
+	u32 rotrim, rodiv;
+
+	/* calculate dividers for new rate */
+	roclk_calc_div_trim(rate, *parent_rate, &rodiv, &rotrim);
+
+	/* caclulate new rate (rounding) based on new rodiv & rotrim */
+	return roclk_calc_rate(*parent_rate, rodiv, rotrim);
+}
+
+static int roclk_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
+{
+	struct clk_hw *parent_clk, *best_parent_clk = NULL;
+	unsigned int i, delta, best_delta = -1;
+	unsigned long parent_rate, best_parent_rate = 0;
+	unsigned long best = 0, nearest_rate;
+
+	/* find a parent which can generate nearest clkrate >= rate */
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		/* get parent */
+		parent_clk = clk_hw_get_parent_by_index(hw, i);
+		if (!parent_clk)
+			continue;
+
+		/* skip if parent runs slower than target rate */
+		parent_rate = clk_hw_get_rate(parent_clk);
+		if (req->rate > parent_rate)
+			continue;
+
+		nearest_rate = roclk_round_rate(hw, req->rate, &parent_rate);
+		delta = abs(nearest_rate - req->rate);
+		if ((nearest_rate >= req->rate) && (delta < best_delta)) {
+			best_parent_clk = parent_clk;
+			best_parent_rate = parent_rate;
+			best = nearest_rate;
+			best_delta = delta;
+
+			if (delta == 0)
+				break;
+		}
+	}
+
+	/* if no match found, retain old rate */
+	if (!best_parent_clk) {
+		pr_err("%s:%s, no parent found for rate %lu.\n",
+		       __func__, clk_hw_get_name(hw), req->rate);
+		best_parent_clk = clk_hw_get_parent(hw);
+		best_parent_rate = clk_hw_get_rate(best_parent_clk);
+		best = clk_hw_get_rate(hw);
+	}
+
+	pr_debug("%s,rate %lu, best_parent(%s, %lu), best %lu, delta %d\n",
+		 clk_hw_get_name(hw), req->rate,
+		 clk_hw_get_name(best_parent_clk), best_parent_rate,
+		 best, best_delta);
+
+	if (req->best_parent_rate)
+		req->best_parent_rate = best_parent_rate;
+
+	if (req->best_parent_hw)
+		req->best_parent_hw = best_parent_clk;
+
+	return best;
+}
+
+static int roclk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+	unsigned long flags;
+	u32 v;
+	int err;
+
+	if (refo->parent_idx)
+		index = refo->parent_idx[index];
+
+	/* wait until ACTIVE bit is zero or timeout */
+	err = readl_poll_timeout_atomic(refo->regs, v, !(v & REFO_ACTIVE),
+					1, LOCK_TIMEOUT_US);
+	if (err) {
+		pr_err("%s: poll failed, clk active\n", clk_hw_get_name(hw));
+		return err;
+	}
+
+	spin_lock_irqsave(&lock, flags);
+
+	pic32_syskey_unlock();
+
+	/* calculate & apply new */
+	v = readl(refo->regs);
+	v &= ~(REFO_SEL_MASK << REFO_SEL_SHIFT);
+	v |= index << REFO_SEL_SHIFT;
+
+	writel(v, refo->regs);
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	return 0;
+}
+
+static int roclk_set_rate_and_parent(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long parent_rate,
+				     u8 index)
+{
+	struct pic32_refosc *refo = clkhw_to_refosc(hw);
+	unsigned long flags;
+	u32 trim, rodiv, v;
+	int err;
+
+	/* calculate new rodiv & rotrim for new rate */
+	roclk_calc_div_trim(rate, parent_rate, &rodiv, &trim);
+
+	pr_debug("parent_rate = %lu, rate = %lu, div = %d, trim = %d\n",
+		 parent_rate, rate, rodiv, trim);
+
+	/* wait till source change is active */
+	err = readl_poll_timeout_atomic(refo->regs, v,
+					!(v & (REFO_ACTIVE | REFO_DIVSW_EN)),
+					1, LOCK_TIMEOUT_US);
+	if (err) {
+		pr_err("%s: poll timedout, clock is still active\n", __func__);
+		return err;
+	}
+
+	spin_lock_irqsave(&lock, flags);
+	v = readl(refo->regs);
+
+	pic32_syskey_unlock();
+
+	/* apply parent, if required */
+	if (refo->parent_idx)
+		index = refo->parent_idx[index];
+
+	v &= ~(REFO_SEL_MASK << REFO_SEL_SHIFT);
+	v |= index << REFO_SEL_SHIFT;
+
+	/* apply RODIV */
+	v &= ~(REFO_DIV_MASK << REFO_DIV_SHIFT);
+	v |= rodiv << REFO_DIV_SHIFT;
+	writel(v, refo->regs);
+
+	/* apply ROTRIM */
+	v = readl(refo->regs + REFO_TRIM_REG);
+	v &= ~(REFO_TRIM_MASK << REFO_TRIM_SHIFT);
+	v |= trim << REFO_TRIM_SHIFT;
+	writel(v, refo->regs + REFO_TRIM_REG);
+
+	/* enable & activate divider switching */
+	writel(REFO_ON | REFO_DIVSW_EN, PIC32_SET(refo->regs));
+
+	/* wait till divswen is in-progress */
+	err = readl_poll_timeout_atomic(refo->regs, v, !(v & REFO_DIVSW_EN),
+					1, LOCK_TIMEOUT_US);
+	/* leave the clk gated as it was */
+	writel(REFO_ON, PIC32_CLR(refo->regs));
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	return err;
+}
+
+static int roclk_set_rate(struct clk_hw *hw, unsigned long rate,
+			  unsigned long parent_rate)
+{
+	u8 index = roclk_get_parent(hw);
+
+	return roclk_set_rate_and_parent(hw, rate, parent_rate, index);
+}
+
+static inline u32 spll_odiv_to_divider(u32 odiv)
+{
+	odiv = clamp_val(odiv, PLL_ODIV_MIN, PLL_ODIV_MAX);
+
+	return 1 << odiv;
+}
+
+static unsigned long spll_calc_mult_div(struct pic32_spll *pll,
+					unsigned long rate,
+					unsigned long parent_rate,
+					u32 *mult_p, u32 *odiv_p)
+{
+	u32 mul, div, best_mul = 1, best_div = 1;
+	unsigned long new_rate, best_rate = rate;
+	unsigned int best_delta = -1, delta, match_found = 0;
+	u64 rate64;
+
+	parent_rate /= pll->idiv;
+
+	for (mul = 1; mul <= PLL_MULT_MAX; mul++) {
+		for (div = PLL_ODIV_MIN; div <= PLL_ODIV_MAX; div++) {
+			rate64 = parent_rate;
+			rate64 *= mul;
+			do_div(rate64, 1 << div);
+			new_rate = (u32)rate64;
+			delta = abs(rate - new_rate);
+			if ((new_rate >= rate) && (delta < best_delta)) {
+				best_delta = delta;
+				best_rate = new_rate;
+				best_mul = mul;
+				best_div = div;
+				match_found = 1;
+			}
+		}
+	}
+
+	if (!match_found) {
+		pr_warn("spll: no match found\n");
+		return 0;
+	}
+
+	pr_debug("rate %lu, par_rate %lu/mult %u, div %u, best_rate %lu\n",
+		 rate, parent_rate, best_mul, best_div, best_rate);
+
+	if (mult_p)
+		*mult_p = best_mul - 1;
+
+	if (odiv_p)
+		*odiv_p = best_div;
+
+	return best_rate;
+}
+
+static unsigned long spll_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct pic32_spll *pll = clkhw_to_spll(hw);
+	unsigned long pll_in_rate;
+	u32 mult, odiv, div, v;
+	u64 rate64;
+
+	v = readl(pll->regs);
+	odiv = ((v >> PLL_ODIV_SHIFT) & PLL_ODIV_MASK);
+	mult = ((v >> PLL_MULT_SHIFT) & PLL_MULT_MASK) + 1;
+	div = spll_odiv_to_divider(odiv);
+
+	/* pll_in_rate = parent_rate / idiv
+	 * pll_out_rate = pll_in_rate * mult / div;
+	 */
+	pll_in_rate = parent_rate / pll->idiv;
+	rate64 = pll_in_rate;
+	rate64 *= mult;
+	do_div(rate64, div);
+
+	return (unsigned long)rate64;
+}
+
+static long spll_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *parent_rate)
+{
+	struct pic32_spll *pll = clkhw_to_spll(hw);
+
+	return spll_calc_mult_div(pll, rate, *parent_rate, NULL, NULL);
+}
+
+static int spll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct pic32_spll *pll = clkhw_to_spll(hw);
+	unsigned long ret, flags;
+	u32 mult, odiv, v;
+	int err;
+
+	ret = spll_calc_mult_div(pll, rate, parent_rate, &mult, &odiv);
+	if (!ret)
+		return -EINVAL;
+
+	/*
+	 * We can't change SPLL counters when it is in-active use
+	 * by system clock. So ensure that PLL clock is not active
+	 * parent of SYSCLK before applying new counter/rate.
+	 */
+
+	/* Is spll_clk active parent of sys_clk ? */
+	if (unlikely(clk_hw_get_parent(pic32_sys_clk) == hw)) {
+		pr_err("%s: failed, clk in-use\n", __func__);
+		return -EBUSY;
+	}
+
+	spin_lock_irqsave(&lock, flags);
+
+	/* apply new multiplier & divisor (read-modify-write) */
+	v = readl(pll->regs);
+	v &= ~(PLL_MULT_MASK << PLL_MULT_SHIFT);
+	v &= ~(PLL_ODIV_MASK << PLL_ODIV_SHIFT);
+	v |= (mult << PLL_MULT_SHIFT) | (odiv << PLL_ODIV_SHIFT);
+
+	/* sys unlock before write */
+	pic32_syskey_unlock();
+
+	writel(v, pll->regs);
+	cpu_relax();
+
+	/* insert few nops (5-stage) to ensure CPU does not hang */
+	cpu_nop5();
+	cpu_nop5();
+
+	/* Wait until PLL is locked (maximum 100 usecs). */
+	err = readl_poll_timeout_atomic(pll->status_reg, v,
+					v & pll->lock_mask, 1, 100);
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	return err;
+}
+
+static long sclk_round_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long *parent_rate)
+{
+	return calc_best_divided_rate(rate, *parent_rate, SLEW_SYSDIV, 1);
+}
+
+static unsigned long sclk_get_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct pic32_sclk *sclk = clkhw_to_sys_clk(hw);
+	u32 div;
+
+	div = (readl(sclk->slwreg) >> SLEW_SYSDIV_SHIFT) & SLEW_SYSDIV;
+	div += 1; /* sys-div to divider */
+
+	return parent_rate / div;
+}
+
+static int sclk_set_rate(struct clk_hw *hw,
+			 unsigned long rate, unsigned long parent_rate)
+{
+	struct pic32_sclk *sclk = clkhw_to_sys_clk(hw);
+	unsigned long flags;
+	u32 v, div;
+	int err;
+
+	div = parent_rate / rate;
+
+	spin_lock_irqsave(&lock, flags);
+
+	/* apply new div */
+	v = readl(sclk->slwreg);
+	v &= ~(SLEW_SYSDIV << SLEW_SYSDIV_SHIFT);
+	v |= (div - 1) << SLEW_SYSDIV_SHIFT;
+
+	pic32_syskey_unlock();
+
+	writel(v, sclk->slwreg);
+
+	/* wait until BUSY is cleared */
+	err = readl_poll_timeout_atomic(sclk->slwreg, v,
+					!(v & SLEW_BUSY), 1, LOCK_TIMEOUT_US);
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	return err;
+}
+
+static u8 sclk_get_parent(struct clk_hw *hw)
+{
+	struct pic32_sclk *sclk = clkhw_to_sys_clk(hw);
+	u32 i, v;
+
+	v = (readl(sclk->regs) >> OSC_CUR_SHIFT) & OSC_CUR_MASK;
+
+	if (!sclk->parent_idx)
+		return (u8)v;
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
+		if (sclk->parent_idx[i] == v)
+			return (u8)i;
+	return -EINVAL;
+}
+
+static int sclk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct pic32_sclk *sclk = clkhw_to_sys_clk(hw);
+	unsigned long flags;
+	u32 nosc, cosc, v;
+	int err;
+
+	spin_lock_irqsave(&lock, flags);
+
+	/* find new_osc */
+	nosc = sclk->parent_idx ? sclk->parent_idx[index] : index;
+
+	/* set new parent */
+	v = readl(sclk->regs);
+	v &= ~(OSC_NEW_MASK << OSC_NEW_SHIFT);
+	v |= nosc << OSC_NEW_SHIFT;
+
+	pic32_syskey_unlock();
+
+	writel(v, sclk->regs);
+
+	/* initate switch */
+	writel(OSC_SWEN, PIC32_SET(sclk->regs));
+	cpu_relax();
+
+	/* add nop to flush pipeline (as cpu_clk is in-flux) */
+	cpu_nop5();
+
+	/* wait for SWEN bit to clear */
+	err = readl_poll_timeout_atomic(sclk->slwreg, v,
+					!(v & OSC_SWEN), 1, LOCK_TIMEOUT_US);
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	/*
+	 * SYSCLK clock-switching logic might reject a clock switching request
+	 * if required conditions (like new clksrc not present or unstable)
+	 * are not met.
+	 * So confirm before claiming success.
+	 */
+	cosc = (readl(sclk->regs) >> OSC_CUR_SHIFT) & OSC_CUR_MASK;
+	if (cosc != nosc) {
+		pr_err("%s: err, failed to set_parent() to %d, current %d\n",
+		       clk_hw_get_name(hw), nosc, cosc);
+		err = -EBUSY;
+	}
+
+	return err;
+}
+
+static void sclk_init(struct clk_hw *hw)
+{
+	/* Maintain reference to this clk, required in spll_clk_set_rate() */
+	pic32_sys_clk = hw;
+}
+
+static int sosc_clk_enable(struct clk_hw *hw)
+{
+	struct pic32_sosc *sosc = clkhw_to_sosc(hw);
+	u32 v;
+
+	/* enable SOSC */
+	pic32_syskey_unlock();
+	writel(sosc->bitmask, PIC32_SET(sosc->enable_reg));
+
+	/* Wait till warm-up period expires and ready-status is updated */
+	return readl_poll_timeout_atomic(sosc->status_reg, v,
+					 v & sosc->status_bitmask, 1, 100);
+}
+
+static void sosc_clk_disable(struct clk_hw *hw)
+{
+	struct pic32_sosc *sosc = clkhw_to_sosc(hw);
+
+	pic32_syskey_unlock();
+	writel(sosc->bitmask, PIC32_CLR(sosc->enable_reg));
+}
+
+static int sosc_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pic32_sosc *sosc = clkhw_to_sosc(hw);
+	u32 enable, status;
+
+	/* check enable & ready-status */
+	enable = readl(sosc->enable_reg) & sosc->bitmask;
+	status = readl(sosc->status_reg) & sosc->status_bitmask;
+
+	return enable && status;
+}
+
+static unsigned long sosc_clk_calc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	return clkhw_to_sosc(hw)->fixed_rate;
+}
+
+static const struct clk_ops pbclk_ops = {
+	.enable		= pbclk_enable,
+	.disable	= pbclk_disable,
+	.is_enabled	= pbclk_is_enabled,
+	.recalc_rate	= pbclk_recalc_rate,
+	.round_rate	= pbclk_round_rate,
+	.set_rate	= pbclk_set_rate,
+};
+
+/* sclk is a mux with post-divider */
+static const struct clk_ops sclk_postdiv_ops = {
+	.get_parent	= sclk_get_parent,
+	.set_parent	= sclk_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+	.round_rate	= sclk_round_rate,
+	.set_rate	= sclk_set_rate,
+	.recalc_rate	= sclk_get_rate,
+	.init		= sclk_init,
+};
+
+static const struct clk_ops spll_clk_ops = {
+	.recalc_rate	= spll_clk_recalc_rate,
+	.round_rate	= spll_clk_round_rate,
+	.set_rate	= spll_clk_set_rate,
+};
+
+static const struct clk_ops roclk_ops = {
+	.enable			= roclk_enable,
+	.disable		= roclk_disable,
+	.is_enabled		= roclk_is_enabled,
+	.get_parent		= roclk_get_parent,
+	.set_parent		= roclk_set_parent,
+	.determine_rate		= roclk_determine_rate,
+	.recalc_rate		= roclk_recalc_rate,
+	.round_rate		= roclk_round_rate,
+	.set_rate_and_parent	= roclk_set_rate_and_parent,
+	.set_rate		= roclk_set_rate,
+	.init			= roclk_init,
+};
+
+static const struct clk_ops sosc_ops = {
+	.enable = sosc_clk_enable,
+	.disable = sosc_clk_disable,
+	.is_enabled = sosc_clk_is_enabled,
+	.recalc_rate = sosc_clk_calc_rate,
+};
+
+#define init_clk_data(__initdata, __clk, __parents,	\
+	__nr_parents, __flags, __ops)			\
+	__initdata.name = (__clk);			\
+	__initdata.ops = (__ops);			\
+	__initdata.flags = (__flags);			\
+	__initdata.parent_names = (__parents);		\
+	__initdata.num_parents = (__nr_parents)
+
+static struct clk *periph_clk_register(const char *name,
+				       const char **parent_name,
+				       void __iomem *regs)
+{
+	struct clk *clk;
+	struct pic32_pbclk *pbclk;
+	struct clk_init_data init;
+
+	init_clk_data(init, name, parent_name, 1, 0, &pbclk_ops);
+
+	pbclk = kzalloc(sizeof(*pbclk), GFP_KERNEL);
+	if (!pbclk)
+		return ERR_PTR(-ENOMEM);
+
+	/* init */
+	pbclk->regs = regs;
+	pbclk->hw.init = &init;
+
+	clk = clk_register(NULL, &pbclk->hw);
+	if (IS_ERR(clk))
+		kfree(pbclk);
+
+	return clk;
+}
+
+static struct clk *sys_mux_clk_register(const char *name,
+					const char **parents,
+					const int num_parents,
+					void __iomem *regs,
+					void __iomem *slew_reg,
+					u32 *parent_idx,
+					const struct clk_ops *clkop)
+{
+	struct clk *clk;
+	struct pic32_sclk *sclk;
+	struct clk_init_data init;
+
+	init_clk_data(init, name, parents, num_parents, 0, clkop);
+
+	sclk = kzalloc(sizeof(*sclk), GFP_KERNEL);
+	if (!sclk)
+		return ERR_PTR(-ENOMEM);
+
+	/* init sclk data */
+	sclk->hw.init = &init;
+	sclk->regs = regs;
+	sclk->slwreg = slew_reg;
+	sclk->parent_idx = parent_idx;
+
+	clk = clk_register(NULL, &sclk->hw);
+	if (IS_ERR(clk)) {
+		kfree(sclk);
+		return clk;
+	}
+
+	return clk;
+}
+
+static struct clk *spll_clk_register(const char *name, const char *parents,
+				     void __iomem *regs,
+				     void __iomem *status_reg,
+				     u32 lock_bitmask)
+{
+	u32 v;
+	struct pic32_spll *pll;
+	struct clk_init_data init;
+	struct clk *clk;
+
+	init_clk_data(init, name, &parents, 1, 0, &spll_clk_ops);
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	/* initialize configuration */
+	pll->regs	= regs;
+	pll->status_reg	= status_reg;
+	pll->lock_mask	= lock_bitmask;
+	pll->hw.init	= &init;
+
+	/* read and cache pll_idiv; we will use it as constant.*/
+	v = readl(pll->regs);
+	pll->idiv = ((v >> PLL_IDIV_SHIFT) & PLL_IDIV_MASK) + 1;
+
+	clk = clk_register(NULL, &pll->hw);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
+
+static struct clk *refo_clk_register(const char *name,
+				     const char **parents,
+				     u32 nr_parents,
+				     void __iomem *regs,
+				     u32 *parent_table)
+{
+	struct pic32_refosc *refo;
+	struct clk_init_data init;
+	struct clk *clk;
+	int clk_flags;
+
+	clk_flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
+	init_clk_data(init, name, parents, nr_parents, clk_flags, &roclk_ops);
+
+	refo = kzalloc(sizeof(*refo), GFP_KERNEL);
+	if (!refo)
+		return ERR_PTR(-ENOMEM);
+
+	/* initialize configuration */
+	refo->regs = regs;
+	refo->hw.init = &init;
+	refo->parent_idx = parent_table;
+
+	clk = clk_register(NULL, &refo->hw);
+	if (IS_ERR(clk))
+		kfree(refo);
+
+	return clk;
+}
+
+static void __init of_sosc_clk_setup(struct device_node *np)
+{
+	void __iomem *enable_reg, *status_reg;
+	struct clk_init_data init;
+	const char *name = np->name;
+	u32 rate, stsmask, bitmask;
+	struct pic32_sosc *sosc;
+	struct clk *clk;
+
+	if (of_property_read_u32(np, "clock-frequency", &rate))
+		return;
+
+	/* get optional output name */
+	of_property_read_string(np, "clock-output-names", &name);
+
+	enable_reg = of_iomap(np, 0);
+	if (!enable_reg)
+		return;
+
+	status_reg = of_iomap(np, 1);
+	if (!status_reg) {
+		iounmap(enable_reg);
+		return;
+	}
+
+	of_property_read_u32(np, "microchip,bit-mask", &bitmask);
+
+	of_property_read_u32(np, "microchip,status-bit-mask", &stsmask);
+
+	/* allocate fixed rate clock */
+	sosc = kzalloc(sizeof(*sosc), GFP_KERNEL);
+	if (!sosc) {
+		iounmap(enable_reg);
+		iounmap(status_reg);
+		return;
+	}
+
+	init_clk_data(init, name, NULL, 0, CLK_IS_ROOT, &sosc_ops);
+
+	/* struct clk assignments */
+	sosc->fixed_rate = rate;
+	sosc->hw.init = &init;
+	sosc->enable_reg = enable_reg;
+	sosc->status_reg = status_reg;
+	sosc->bitmask = bitmask;
+	sosc->status_bitmask = stsmask;
+
+	/* register the clock */
+	clk = clk_register(NULL, &sosc->hw);
+	if (IS_ERR(clk))
+		kfree(sosc);
+	else
+		pic32_of_clk_register_clkdev(np, clk);
+}
+
+static void __init of_periph_clk_setup(struct device_node *np)
+{
+	const char *parent_name;
+	const char *name = np->name;
+	struct clk *clk;
+	void __iomem *regs;
+
+	regs = of_iomap(np, 0);
+	if (!regs) {
+		pr_err("%s: could not get reg property\n", name);
+		return;
+	}
+
+	parent_name = of_clk_get_parent_name(np, 0);
+	if (!parent_name) {
+		pr_err("pbclk: %s must have a parent\n", name);
+		goto err_map;
+	}
+
+	/* get optional output name */
+	of_property_read_string(np, "clock-output-names", &name);
+
+	clk = periph_clk_register(name, &parent_name, regs);
+	if (IS_ERR(clk)) {
+		pr_err("%s: could not register clock\n", name);
+		goto err_map;
+	}
+
+	pic32_of_clk_register_clkdev(np, clk);
+
+	return;
+
+err_map:
+	iounmap(regs);
+}
+
+static void __init of_refo_clk_setup(struct device_node *np)
+{
+	struct clk *clk;
+	int ret, count;
+	const char **parents;
+	const char *clk_name = np->name;
+	void __iomem *regs;
+	u32 *parent_idx;
+
+	/* get the input clock source count */
+	count = of_clk_get_parent_count(np);
+	if (count < 0) {
+		pr_err("%s: get clock count error\n", np->name);
+		return;
+	}
+
+	parents = kcalloc(count, sizeof(char *), GFP_KERNEL);
+	if (!parents)
+		return;
+
+	of_clk_parent_fill(np, parents, count);
+
+	parent_idx = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!parent_idx)
+		goto err_parent;
+
+	ret = pic32_of_clk_get_parent_indices(np, parent_idx, count);
+	if (ret)
+		goto err_parent_idx;
+
+	/* get iobase */
+	regs = of_iomap(np, 0);
+	if (!regs) {
+		pr_err("%s: could not get reg property\n", clk_name);
+		goto err_parent_idx;
+	}
+
+	/* get optional output name */
+	of_property_read_string(np, "clock-output-names", &clk_name);
+
+	clk = refo_clk_register(clk_name, parents, count, regs, parent_idx);
+	if (IS_ERR(clk)) {
+		pr_err("%s: could not register clock\n", clk_name);
+		goto err_map;
+	}
+
+	pic32_of_clk_register_clkdev(np, clk);
+
+	goto err_parent;
+
+err_map:
+	iounmap(regs);
+err_parent_idx:
+	kfree(parent_idx);
+err_parent:
+	kfree(parents);
+}
+
+static void __init of_sys_mux_setup(struct device_node *np)
+{
+	struct clk *clk;
+	int ret, count;
+	const char *clk_name = np->name;
+	const char **parents;
+	u32 *parent_idx, slew, v;
+	unsigned long flags;
+	void __iomem *slew_reg;
+
+	/* get the input clock source count */
+	count = of_clk_get_parent_count(np);
+	if (count < 0) {
+		pr_err("%s: get clock count error\n", clk_name);
+		return;
+	}
+
+	parents = kcalloc(count, sizeof(char *), GFP_KERNEL);
+	if (!parents)
+		return;
+
+	of_clk_parent_fill(np, parents, count);
+
+	parent_idx = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!parent_idx)
+		goto err_parent;
+
+	ret = pic32_of_clk_get_parent_indices(np, parent_idx, count);
+	if (ret)
+		goto err_parent_idx;
+
+	/* get optional output name */
+	of_property_read_string_index(np, "clock-output-names", 0, &clk_name);
+
+	/* get slew base */
+	slew_reg = of_iomap(np, 0);
+	if (!slew_reg) {
+		pr_warn("%s: could not map slew register\n", clk_name);
+		goto err_parent_idx;
+	}
+
+	/* register mux clk */
+	clk = sys_mux_clk_register(clk_name, parents, count, pic32_clk_regbase,
+				   slew_reg, parent_idx, &sclk_postdiv_ops);
+	if (IS_ERR(clk)) {
+		pr_err("%s: could not register clock\n", clk_name);
+		goto err_iounmap;
+	}
+
+	/* enable slew, if asked */
+	if (!of_property_read_u32(np, "microchip,slew-step", &slew)) {
+		spin_lock_irqsave(&lock, flags);
+
+		v = readl(slew_reg);
+		/* Apply new slew-div and enable up/down slewing */
+		v &= ~(SLEW_DIV << SLEW_DIV_SHIFT);
+		v |= slew << SLEW_DIV_SHIFT;
+		v |= SLEW_DOWNEN | SLEW_UPEN;
+		writel(v, slew_reg);
+
+		spin_unlock_irqrestore(&lock, flags);
+	}
+
+	/* register clkdev */
+	pic32_of_clk_register_clkdev(np, clk);
+
+	goto err_parent;
+err_iounmap:
+	iounmap(slew_reg);
+err_parent_idx:
+	kfree(parent_idx);
+err_parent:
+	kfree(parents);
+}
+
+static void __init of_sys_pll_setup(struct device_node *np)
+{
+	const char *clk_name = np->name;
+	const char **parent_names;
+	const char *plliclk_name = "spll_mux_clk";
+	void __iomem *regs, *stat_reg;
+	struct clk *clk, *mux_clk;
+	u32 bitmask;
+	int count;
+
+	/* get the input clock source count */
+	count = of_clk_get_parent_count(np);
+	if (count < 0) {
+		pr_err("%s: get clock count error, %d\n", clk_name, count);
+		return;
+	}
+
+	parent_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
+	if (!parent_names)
+		return;
+
+	of_clk_parent_fill(np, parent_names, count);
+
+	/* get optional output name */
+	of_property_read_string(np, "clock-output-names", &clk_name);
+
+	/* get iobase */
+	regs = of_iomap(np, 0);
+	if (!regs) {
+		pr_err("%s: of_iomap failed\n", np->name);
+		goto err_name;
+	}
+
+	/* get status reg & status bitmask */
+	stat_reg = of_iomap(np, 1);
+
+	of_property_read_u32(np, "microchip,status-bit-mask", &bitmask);
+	if (!stat_reg || !bitmask)
+		pr_warn("%s: status_reg(or bit-mask) not found.\n", np->name);
+
+	/* register plliclk mux */
+	mux_clk = clk_register_mux(NULL, plliclk_name, parent_names,
+				   count, 0, regs,
+				   PLL_ICLK_SHIFT, 1, 0, &lock);
+	if (IS_ERR(mux_clk))  {
+		pr_err("splliclk_mux not registered\n");
+		goto err_unmap;
+	}
+
+	/* register sys-pll clock */
+	clk = spll_clk_register(clk_name, plliclk_name,
+				regs, stat_reg, bitmask);
+	if (IS_ERR(clk)) {
+		pr_err("spll_clk not registered\n");
+		goto err_mux;
+	}
+
+	pic32_of_clk_register_clkdev(np, clk);
+	goto err_name;
+
+err_mux:
+	clk_unregister(mux_clk);
+err_unmap:
+	iounmap(regs);
+err_name:
+	kfree(parent_names);
+}
+
+static void __init of_frcdiv_setup(struct device_node *np)
+{
+	struct clk *clk;
+	const char *clk_name = np->name;
+	const char *parent_name;
+
+	parent_name = of_clk_get_parent_name(np, 0);
+	if (!parent_name) {
+		pr_err("frcdiv: %s must have a parent\n", np->name);
+		return;
+	}
+
+	/* get optional output name */
+	of_property_read_string(np, "clock-output-names", &clk_name);
+
+	/* divider clock register */
+	clk = clk_register_divider(NULL, clk_name, parent_name,
+				   0, pic32_clk_regbase,
+				   OSC_FRCDIV_SHIFT, OSC_FRCDIV_MASK,
+				   CLK_DIVIDER_POWER_OF_TWO, &lock);
+
+	if (IS_ERR(clk)) {
+		pr_err("frcdiv_clk not registered\n");
+		return;
+	}
+
+	pic32_of_clk_register_clkdev(np, clk);
+}
+
+static const struct of_device_id pic32_clk_match[] __initconst = {
+	{
+		.compatible = "microchip,pic32mzda-refoclk",
+		.data = of_refo_clk_setup,
+	},
+	{
+		.compatible = "microchip,pic32mzda-pbclk",
+		.data = of_periph_clk_setup,
+	},
+	{
+		.compatible = "microchip,pic32mzda-syspll",
+		.data = of_sys_pll_setup,
+	},
+	{
+		.compatible = "microchip,pic32mzda-sosc",
+		.data = of_sosc_clk_setup,
+	},
+	{
+		.compatible = "microchip,pic32mzda-frcdivclk",
+		.data = of_frcdiv_setup,
+	},
+	{
+		.compatible = "microchip,pic32mzda-sysclk-v2",
+		.data = of_sys_mux_setup,
+	},
+	{}
+};
+
+static int pic32_fscm_nmi(struct notifier_block *nb,
+			  unsigned long action, void *data)
+{
+	u32 v = readl(pic32_clk_regbase);
+
+	if (v & OSC_CLK_FAILED)
+		pr_err("pic32-clk: FSCM detected clk failure.\n");
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block failsafe_clk_notifier = {
+	.notifier_call = pic32_fscm_nmi,
+};
+
+static void __init of_pic32_soc_clock_init(struct device_node *np)
+{
+	void (*clk_setup)(struct device_node *);
+	const struct of_device_id *clk_id;
+	struct device_node *childnp;
+
+	pic32_clk_regbase = of_io_request_and_map(np, 0, of_node_full_name(np));
+	if (IS_ERR(pic32_clk_regbase))
+		panic("pic32-clk: failed to map registers\n");
+
+	for_each_child_of_node(np, childnp) {
+		clk_id = of_match_node(pic32_clk_match, childnp);
+		if (!clk_id)
+			continue;
+		clk_setup = clk_id->data;
+		clk_setup(childnp);
+	}
+
+	/* register failsafe-clock-monitor NMI */
+	register_nmi_notifier(&failsafe_clk_notifier);
+}
+
+CLK_OF_DECLARE(pic32_soc_clk, "microchip,pic32mzda-clk",
+	       of_pic32_soc_clock_init);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
