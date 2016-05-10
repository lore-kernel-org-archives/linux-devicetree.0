From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Subject: [RFC 1/4] clk: renesas: rcar-gen3-cpg: Add Z clock
Date: Tue, 10 May 2016 11:42:16 +0700
Message-ID: <573166A8.1030101@rvc.renesas.com>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>, "Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
List-Id: devicetree@vger.kernel.org

Base on Dien Pham work.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
  drivers/clk/renesas/rcar-gen3-cpg.c | 143 
++++++++++++++++++++++++++++++++++++
  drivers/clk/renesas/rcar-gen3-cpg.h |   1 +
  2 files changed, 144 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c 
b/drivers/clk/renesas/rcar-gen3-cpg.c
index bb4f2f9..45209ac 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -28,6 +28,146 @@
  #define CPG_PLL2CR		0x002c
  #define CPG_PLL4CR		0x01f4

+/** Modify for Z-clock
+ * 
-----------------------------------------------------------------------------
+ * Z Clock
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is adjustable.  clk->rate = parent->rate * mult / 32
+ * parent - fixed parent.  No clk_set_parent support
+ */
+#define CPG_FRQCRB			0x00000004
+#define CPG_FRQCRB_KICK			BIT(31)
+#define CPG_FRQCRC			0x000000e0
+#define CPG_FRQCRC_ZFC_MASK		(0x1f << 8)
+#define CPG_FRQCRC_ZFC_SHIFT		8
+
+
+struct cpg_z_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+	void __iomem *kick_reg;
+};
+
+#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
+
+static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	unsigned int val;
+	unsigned long rate;
+
+	val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
+	    >> CPG_FRQCRC_ZFC_SHIFT;
+	mult = 32 - val;
+
+	rate = div_u64((u64)parent_rate * mult + 16, 32);
+	/* Round to closest value at 100MHz unit */
+	rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);
+	return rate;
+}
+
+static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	unsigned long prate  = *parent_rate;
+	unsigned int mult;
+
+	if (!prate)
+		prate = 1;
+
+	mult = div_u64((u64)rate * 32 + prate/2, prate);
+	mult = clamp(mult, 1U, 32U);
+
+	return *parent_rate / 32 * mult;
+}
+
+static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	u32 val, kick;
+	unsigned int i;
+
+	mult = div_u64((u64)rate * 32 + parent_rate/2, parent_rate);
+	mult = clamp(mult, 1U, 32U);
+
+	if (clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+		return -EBUSY;
+
+	val = clk_readl(zclk->reg);
+	val &= ~CPG_FRQCRC_ZFC_MASK;
+	val |= (32 - mult) << CPG_FRQCRC_ZFC_SHIFT;
+	clk_writel(val, zclk->reg);
+
+	/*
+	 * Set KICK bit in FRQCRB to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	kick = clk_readl(zclk->kick_reg);
+	kick |= CPG_FRQCRB_KICK;
+	clk_writel(kick, zclk->kick_reg);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~10 iterations are needed, independently of the CPU rate.
+	 * Since this value might be dependent of external xtal rate, pll1
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	for (i = 1000; i; i--) {
+		if (!(clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct clk_ops cpg_z_clk_ops = {
+	.recalc_rate = cpg_z_clk_recalc_rate,
+	.round_rate = cpg_z_clk_round_rate,
+	.set_rate = cpg_z_clk_set_rate,
+};
+
+static struct clk * __init cpg_z_clk_register(const struct cpg_core_clk 
*core,
+					      void __iomem *base,
+					      const char *parent_name)
+{
+	struct clk_init_data init;
+	struct cpg_z_clk *zclk;
+	struct clk *clk;
+
+	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
+	if (!zclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	init.ops = &cpg_z_clk_ops;
+	init.flags = CLK_SET_RATE_GATE;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	zclk->reg = base + CPG_FRQCRC;
+	zclk->kick_reg = base + CPG_FRQCRB;
+	zclk->hw.init = &init;
+
+	clk = clk_register(NULL, &zclk->hw);
+	if (IS_ERR(clk))
+		kfree(zclk);
+
+	return clk;
+}
+
+/** End of modifying for Z-clock */

  /*
   * SDn Clock
@@ -325,6 +465,9 @@ struct clk * __init 
rcar_gen3_cpg_clk_register(struct device *dev,
  		writel(value, base + CPG_RCKCR);
  		break;

+	case CLK_TYPE_GEN3_Z:
+		return cpg_z_clk_register(core, base, __clk_get_name(parent));
+
  	default:
  		return ERR_PTR(-EINVAL);
  	}
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h 
b/drivers/clk/renesas/rcar-gen3-cpg.h
index f699085..03c26e1 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -20,6 +20,7 @@ enum rcar_gen3_clk_types {
  	CLK_TYPE_GEN3_PLL4,
  	CLK_TYPE_GEN3_SD,
  	CLK_TYPE_GEN3_R,
+	CLK_TYPE_GEN3_Z,
  };

  #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
-- 
1.9.1

