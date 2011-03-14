From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] arm/dt: mx51: dynamically add clocks per dt nodes
Date: Mon, 14 Mar 2011 21:18:40 +0800
Message-ID: <1300108722-3254-4-git-send-email-shawn.guo@linaro.org>
References: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300108722-3254-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch is to change the static clock creating and registering to
the dynamic way, which scans dt clock nodes, associate clk with
device_node, and then add them to clkdev accordingly.

It's a pretty straight translation from non-dt clock code to dt one,
and it does not really change any actual clock code.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-mx5/clock-mx51-mx53.c | 1401 ++++++++++++++++++++++++++++++++++-
 1 files changed, 1387 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
index dedb7f9..c3ec7f6 100644
--- a/arch/arm/mach-mx5/clock-mx51-mx53.c
+++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
@@ -49,6 +49,30 @@ static struct clk emi_fast_clk;
 static struct clk ipu_clk;
 static struct clk mipi_hsc1_clk;
 
+#ifdef CONFIG_OF
+/*
+ * The pointers are defined to save the references to the clocks
+ * dynamically created, and then could be used to replace those
+ * static references in non-dt clock code.
+ */
+static struct clk *osc_clk_dt;
+static struct clk *pll1_main_clk_dt;
+static struct clk *pll1_sw_clk_dt;
+static struct clk *pll2_sw_clk_dt;
+static struct clk *pll3_sw_clk_dt;
+static struct clk *lp_apm_clk_dt;
+static struct clk *periph_apm_clk_dt;
+static struct clk *main_bus_clk_dt;
+static struct clk *ipg_clk_dt;
+static struct clk *ipg_per_clk_dt;
+static struct clk *cpu_clk_dt;
+static struct clk *iim_clk_dt;
+static struct clk *usboh3_clk_dt;
+static struct clk *usb_phy1_clk_dt;
+static struct clk *esdhc1_clk_dt;
+static struct clk *esdhc2_clk_dt;
+#endif
+
 #define MAX_DPLL_WAIT_TRIES	1000 /* 1000 * udelay(1) = 1ms */
 
 /* calculate best pre and post dividers to get the required divider */
@@ -163,10 +187,18 @@ static inline void __iomem *_mx53_get_pll_base(struct clk *pll)
 	return NULL;
 }
 
+#ifdef CONFIG_OF
+static void __iomem *dt_mx51_get_pll_base(struct clk *pll);
+#endif
+
 static inline void __iomem *_get_pll_base(struct clk *pll)
 {
 	if (cpu_is_mx51())
+#ifdef CONFIG_OF
+		return dt_mx51_get_pll_base(pll);
+#else
 		return _mx51_get_pll_base(pll);
+#endif
 	else
 		return _mx53_get_pll_base(pll);
 }
@@ -1037,6 +1069,22 @@ static unsigned long clk_##name##_get_rate(struct clk *clk)		\
 			(pred + 1) * (podf + 1));			\
 }
 
+#ifdef CONFIG_OF
+#define CLK_SET_PARENT(name, nr, bitsname)				\
+static int clk_##name##_set_parent(struct clk *clk, struct clk *parent)	\
+{									\
+	u32 reg, mux;							\
+									\
+	mux = _get_mux(parent, pll1_sw_clk_dt, pll2_sw_clk_dt,		\
+			pll3_sw_clk_dt, lp_apm_clk_dt);			\
+	reg = __raw_readl(MXC_CCM_CSCMR##nr) &				\
+		~MXC_CCM_CSCMR##nr##_##bitsname##_CLK_SEL_MASK;		\
+	reg |= mux << MXC_CCM_CSCMR##nr##_##bitsname##_CLK_SEL_OFFSET;	\
+	__raw_writel(reg, MXC_CCM_CSCMR##nr);				\
+									\
+	return 0;							\
+}
+#else
 #define CLK_SET_PARENT(name, nr, bitsname)				\
 static int clk_##name##_set_parent(struct clk *clk, struct clk *parent)	\
 {									\
@@ -1051,6 +1099,7 @@ static int clk_##name##_set_parent(struct clk *clk, struct clk *parent)	\
 									\
 	return 0;							\
 }
+#endif
 
 #define CLK_SET_RATE(name, nr, bitsname)				\
 static int clk_##name##_set_rate(struct clk *clk, unsigned long rate)	\
@@ -1439,37 +1488,1361 @@ int __init mx53_clocks_init(unsigned long ckil, unsigned long osc,
 	return 0;
 }
 
+/*
+ * Dynamically create and register clks per dt nodes
+ */
 #ifdef CONFIG_OF
-static struct clk *mx5_dt_clk_get(struct device_node *np,
-					const char *output_id, void *data)
+static inline void __iomem *dt_mx51_get_pll_base(struct clk *pll)
+{
+	if (pll == pll1_main_clk_dt)
+		return MX51_DPLL1_BASE;
+	else if (pll == pll2_sw_clk_dt)
+		return MX51_DPLL2_BASE;
+	else if (pll == pll3_sw_clk_dt)
+		return MX51_DPLL3_BASE;
+	else
+		BUG();
+
+	return NULL;
+}
+
+static unsigned long dt_clk_pll1_sw_get_rate(struct clk *clk)
+{
+	u32 reg, div;
+	unsigned long parent_rate;
+
+	parent_rate = clk_get_rate(clk->parent);
+
+	reg = __raw_readl(MXC_CCM_CCSR);
+
+	if (clk->parent == pll2_sw_clk_dt) {
+		div = ((reg & MXC_CCM_CCSR_PLL2_PODF_MASK) >>
+		       MXC_CCM_CCSR_PLL2_PODF_OFFSET) + 1;
+	} else if (clk->parent == pll3_sw_clk_dt) {
+		div = ((reg & MXC_CCM_CCSR_PLL3_PODF_MASK) >>
+		       MXC_CCM_CCSR_PLL3_PODF_OFFSET) + 1;
+	} else
+		div = 1;
+	return parent_rate / div;
+}
+
+static int dt_clk_pll1_sw_set_parent(struct clk *clk, struct clk *parent)
+{
+	u32 reg, step;
+
+	reg = __raw_readl(MXC_CCM_CCSR);
+
+	/* When switching from pll_main_clk to a bypass clock, first select a
+	 * multiplexed clock in 'step_sel', then shift the glitchless mux
+	 * 'pll1_sw_clk_sel'.
+	 *
+	 * When switching back, do it in reverse order
+	 */
+	if (parent == pll1_main_clk_dt) {
+		/* Switch to pll1_main_clk */
+		reg &= ~MXC_CCM_CCSR_PLL1_SW_CLK_SEL;
+		__raw_writel(reg, MXC_CCM_CCSR);
+		/* step_clk mux switched to lp_apm, to save power. */
+		reg = __raw_readl(MXC_CCM_CCSR);
+		reg &= ~MXC_CCM_CCSR_STEP_SEL_MASK;
+		reg |= (MXC_CCM_CCSR_STEP_SEL_LP_APM <<
+				MXC_CCM_CCSR_STEP_SEL_OFFSET);
+	} else {
+		if (parent == lp_apm_clk_dt) {
+			step = MXC_CCM_CCSR_STEP_SEL_LP_APM;
+		} else  if (parent == pll2_sw_clk_dt) {
+			step = MXC_CCM_CCSR_STEP_SEL_PLL2_DIVIDED;
+		} else  if (parent == pll3_sw_clk_dt) {
+			step = MXC_CCM_CCSR_STEP_SEL_PLL3_DIVIDED;
+		} else
+			return -EINVAL;
+
+		reg &= ~MXC_CCM_CCSR_STEP_SEL_MASK;
+		reg |= (step << MXC_CCM_CCSR_STEP_SEL_OFFSET);
+
+		__raw_writel(reg, MXC_CCM_CCSR);
+		/* Switch to step_clk */
+		reg = __raw_readl(MXC_CCM_CCSR);
+		reg |= MXC_CCM_CCSR_PLL1_SW_CLK_SEL;
+	}
+	__raw_writel(reg, MXC_CCM_CCSR);
+	return 0;
+}
+
+static int dt_clk_pll2_sw_set_parent(struct clk *clk, struct clk *parent)
 {
-	return data;
+	u32 reg;
+
+	reg = __raw_readl(MXC_CCM_CCSR);
+
+	if (parent == pll2_sw_clk_dt)
+		reg &= ~MXC_CCM_CCSR_PLL2_SW_CLK_SEL;
+	else
+		reg |= MXC_CCM_CCSR_PLL2_SW_CLK_SEL;
+
+	__raw_writel(reg, MXC_CCM_CCSR);
+	return 0;
 }
 
-static __init void mx5_dt_scan_clks(void)
+static int dt_clk_lp_apm_set_parent(struct clk *clk, struct clk *parent)
+{
+	u32 reg;
+
+	if (parent == osc_clk_dt)
+		reg = __raw_readl(MXC_CCM_CCSR) & ~MXC_CCM_CCSR_LP_APM_SEL;
+	else
+		return -EINVAL;
+
+	__raw_writel(reg, MXC_CCM_CCSR);
+
+	return 0;
+}
+
+static int dt_clk_periph_apm_set_parent(struct clk *clk, struct clk *parent)
+{
+	u32 reg, mux;
+	int i = 0;
+
+	mux = _get_mux(parent, pll1_sw_clk_dt, pll3_sw_clk_dt, lp_apm_clk_dt, NULL);
+
+	reg = __raw_readl(MXC_CCM_CBCMR) & ~MXC_CCM_CBCMR_PERIPH_CLK_SEL_MASK;
+	reg |= mux << MXC_CCM_CBCMR_PERIPH_CLK_SEL_OFFSET;
+	__raw_writel(reg, MXC_CCM_CBCMR);
+
+	/* Wait for lock */
+	do {
+		reg = __raw_readl(MXC_CCM_CDHIPR);
+		if (!(reg &  MXC_CCM_CDHIPR_PERIPH_CLK_SEL_BUSY))
+			break;
+
+		udelay(1);
+	} while (++i < MAX_DPLL_WAIT_TRIES);
+
+	if (i == MAX_DPLL_WAIT_TRIES) {
+		pr_err("MX5: Set parent for periph_apm clock failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dt_clk_main_bus_set_parent(struct clk *clk, struct clk *parent)
+{
+	u32 reg;
+
+	reg = __raw_readl(MXC_CCM_CBCDR);
+
+	if (parent == pll2_sw_clk_dt)
+		reg &= ~MXC_CCM_CBCDR_PERIPH_CLK_SEL;
+	else if (parent == periph_apm_clk_dt)
+		reg |= MXC_CCM_CBCDR_PERIPH_CLK_SEL;
+	else
+		return -EINVAL;
+
+	__raw_writel(reg, MXC_CCM_CBCDR);
+
+	return 0;
+}
+
+static int dt_clk_ipg_per_set_parent(struct clk *clk, struct clk *parent)
+{
+	u32 reg;
+
+	reg = __raw_readl(MXC_CCM_CBCMR);
+
+	reg &= ~MXC_CCM_CBCMR_PERCLK_LP_APM_CLK_SEL;
+	reg &= ~MXC_CCM_CBCMR_PERCLK_IPG_CLK_SEL;
+
+	if (parent == ipg_clk_dt)
+		reg |= MXC_CCM_CBCMR_PERCLK_IPG_CLK_SEL;
+	else if (parent == lp_apm_clk_dt)
+		reg |= MXC_CCM_CBCMR_PERCLK_LP_APM_CLK_SEL;
+	else if (parent != main_bus_clk_dt)
+		return -EINVAL;
+
+	__raw_writel(reg, MXC_CCM_CBCMR);
+
+	return 0;
+}
+
+static int dt_clk_usb_phy1_set_parent(struct clk *clk, struct clk *parent)
+{
+	u32 reg;
+
+	reg = __raw_readl(MXC_CCM_CSCMR1) & ~MXC_CCM_CSCMR1_USB_PHY_CLK_SEL;
+
+	if (parent == pll3_sw_clk_dt)
+		reg |= 1 << MXC_CCM_CSCMR1_USB_PHY_CLK_SEL_OFFSET;
+
+	__raw_writel(reg, MXC_CCM_CSCMR1);
+
+	return 0;
+}
+
+#define ALLOC_CLK_LOOKUP()						\
+	struct clk_lookup *cl;						\
+	struct clk *clk;						\
+	const char *dev_id;						\
+	int ret;							\
+									\
+	do {								\
+		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);	\
+		if (!cl)						\
+			return -ENOMEM;					\
+		clk = (struct clk *) (cl + 1);				\
+									\
+		dev_id = of_get_property(node,				\
+				"clock-outputs", NULL);			\
+		if (!dev_id) {						\
+			ret = -EINVAL;					\
+			goto out_kfree;					\
+		}							\
+									\
+		clk->parent = mx5_get_source_clk(node);			\
+		clk->secondary = mx5_get_source_clk(node);		\
+	} while (0)
+
+#define ADD_CLK_LOOKUP()						\
+	do {								\
+		node->data = clk;					\
+									\
+		cl->dev_id = dev_id;					\
+		cl->clk = clk;						\
+		clkdev_add(cl);						\
+									\
+		return 0;						\
+									\
+	out_kfree:							\
+		kfree(cl);						\
+		return ret;						\
+	} while (0)
+
+static unsigned long get_fixed_clk_rate(struct clk *clk)
+{
+	return clk->rate;
+}
+
+static __init int mx5_scan_fixed_clks(void)
 {
 	struct device_node *node;
+	struct clk_lookup *cl;
 	struct clk *clk;
-	const char *id;
-	int rc;
+	const __be32 *rate;
+	const char *dev_id;
+	int ret = 0;
+
+	for_each_compatible_node(node, NULL, "fixed-clock") {
+		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
+		if (!cl) {
+			ret = -ENOMEM;
+			break;
+		}
+		clk = (struct clk *) (cl + 1);
 
-	for_each_compatible_node(node, NULL, "clock") {
-		id = of_get_property(node, "clock-outputs", NULL);
-		if (!id)
+		dev_id = of_get_property(node, "clock-outputs", NULL);
+		if (!dev_id) {
+			kfree(cl);
 			continue;
+		}
 
-		clk = clk_get_sys(id, NULL);
-		if (IS_ERR(clk))
+		rate = of_get_property(node, "clock-frequency", NULL);
+		if (!rate) {
+			kfree(cl);
 			continue;
+		}
+		clk->rate = be32_to_cpu(*rate);
+		clk->get_rate = get_fixed_clk_rate;
+
+		if (!strcmp(node->name, "osc"))
+			osc_clk_dt = clk;
 
-		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
-		if (rc)
-			pr_err("error adding fixed clk %s\n", node->name);
+		node->data = clk;
+
+		cl->dev_id = dev_id;
+		cl->clk = clk;
+		clkdev_add(cl);
 	}
+
+	return ret;
+}
+
+static struct clk *mx5_prop_name_to_clk(struct device_node *node,
+		const char *prop_name)
+{
+	struct device_node *provnode;
+	struct clk *clk;
+	const void *prop;
+	u32 provhandle;
+
+	prop = of_get_property(node, prop_name, NULL);
+	if (!prop)
+		return NULL;
+	provhandle = be32_to_cpup(prop);
+
+	provnode = of_find_node_by_phandle(provhandle);
+	if (!provnode)
+		return NULL;
+
+	clk = provnode->data;
+
+	of_node_put(provnode);
+
+	return clk;
+}
+
+static inline struct clk *mx5_get_source_clk(struct device_node *node)
+{
+	return mx5_prop_name_to_clk(node, "clock-source");
+}
+
+static inline struct clk *mx5_get_depend_clk(struct device_node *node)
+{
+	return mx5_prop_name_to_clk(node, "clock-depend");
+}
+
+static __init int mx5_add_dummy_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	node->data = clk;
+
+	cl->clk = clk;
+	clkdev_add(cl);
+
+	return 0;
+}
+
+static __init int mx5_add_usb_phy1_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
+	clk->set_parent = dt_clk_usb_phy1_set_parent;
+
+	usb_phy1_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_usb_ahb_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_usboh3_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_usboh3_get_rate;
+	clk->set_parent = clk_usboh3_set_parent;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
+
+	usboh3_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_mipi_hsp_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_hsc_enable;
+	clk->disable = _clk_hsc_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG6_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ipu_di_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR6;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG5_OFFSET :
+					MXC_CCM_CCGRx_CG6_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ipu_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = clk_ipu_enable;
+	clk->disable = clk_ipu_disable;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ipu_sec_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_mipi_hsc_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG3_OFFSET :
+					MXC_CCM_CCGRx_CG4_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_mipi_esc_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_esdhc_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_max_enable;
+	clk->disable = _clk_max_disable;
+	clk->enable_reg = MXC_CCM_CCGR3;
+
+	if (id == 0) {
+		clk->enable_shift = MXC_CCM_CCGRx_CG1_OFFSET;
+		clk->get_rate = clk_esdhc1_get_rate;
+		clk->set_rate = clk_esdhc1_set_rate;
+		clk->set_parent = clk_esdhc1_set_parent;
+		esdhc1_clk_dt = clk;
+	} else {
+		clk->enable_shift = MXC_CCM_CCGRx_CG3_OFFSET;
+		clk->get_rate = clk_esdhc2_get_rate;
+		clk->set_rate = clk_esdhc2_set_rate;
+		clk->set_parent = clk_esdhc2_set_parent;
+		esdhc2_clk_dt = clk;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_esdhc_ipg_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_max_enable;
+	clk->disable = _clk_max_disable;
+	clk->enable_reg = MXC_CCM_CCGR3;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG0_OFFSET :
+					MXC_CCM_CCGRx_CG2_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_sdma_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG15_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ecspi_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG10_OFFSET :
+					MXC_CCM_CCGRx_CG12_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ecspi_ipg_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable_inrun;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG9_OFFSET :
+					MXC_CCM_CCGRx_CG11_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ecspi_main_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_ecspi_get_rate;
+	clk->set_parent = clk_ecspi_set_parent;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_cspi_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_cspi_ipg_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ssi_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR3;
+
+	switch (id) {
+	case 0:
+		clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
+		break;
+	case 1:
+		clk->enable_shift = MXC_CCM_CCGRx_CG11_OFFSET;
+		break;
+	case 2:
+		clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ssi_ipg_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR3;
+
+	switch (id) {
+	case 0:
+		clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
+		break;
+	case 1:
+		clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
+		break;
+	case 2:
+		clk->enable_shift = MXC_CCM_CCGRx_CG12_OFFSET;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_nfc_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
+	clk->get_rate = clk_nfc_get_rate;
+	clk->set_rate = clk_nfc_set_rate;
+	clk->round_rate = clk_nfc_round_rate;
+	clk->set_parent = clk_nfc_set_parent;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_i2c_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR1;
+
+	switch (id) {
+	case 0:
+		clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
+		break;
+	case 1:
+		clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
+		break;
+	case 2:
+		clk->enable_shift = MXC_CCM_CCGRx_CG11_OFFSET;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_pwm_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG6_OFFSET :
+					MXC_CCM_CCGRx_CG8_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_fec_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG12_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_uart_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR1;
+
+	switch (id) {
+	case 0:
+		clk->enable_shift = MXC_CCM_CCGRx_CG4_OFFSET;
+		break;
+	case 1:
+		clk->enable_shift = MXC_CCM_CCGRx_CG6_OFFSET;
+		break;
+	case 2:
+		clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_uart_root_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_uart_get_rate;
+	clk->set_parent = clk_uart_set_parent;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_uart_ipg_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR1;
+
+	switch (id) {
+	case 0:
+		clk->enable_shift = MXC_CCM_CCGRx_CG3_OFFSET;
+		break;
+	case 1:
+		clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
+		break;
+	case 2:
+		clk->enable_shift = MXC_CCM_CCGRx_CG7_OFFSET;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_gpt_32k_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_gpt_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_gpt_ipg_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ahbmux1_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_aips_tz_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG12_OFFSET :
+					MXC_CCM_CCGRx_CG13_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ahb_max_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_max_enable;
+	clk->disable = _clk_max_disable;
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_iim_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = MXC_CCM_CCGRx_CG15_OFFSET;
+
+	iim_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_spba_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ipg_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_ipg_get_rate;
+
+	ipg_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ahb_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_ahb_get_rate;
+	clk->set_rate = _clk_ahb_set_rate;
+	clk->round_rate = _clk_ahb_round_rate;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_emi_slow_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
+	clk->get_rate = clk_emi_slow_get_rate;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_main_bus_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->set_parent = dt_clk_main_bus_set_parent;
+
+	main_bus_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_emi_fast_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG7_OFFSET;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ddr_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ddr_hf_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = _clk_ddr_hf_get_rate;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_cpu_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_cpu_get_rate;
+	clk->set_rate = clk_cpu_set_rate;
+
+	cpu_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_ipg_per_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_ipg_per_get_rate;
+	clk->set_parent = dt_clk_ipg_per_set_parent;
+
+	ipg_per_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_periph_apm_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->set_parent = dt_clk_periph_apm_set_parent;
+
+	periph_apm_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_lp_apm_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->set_parent = dt_clk_lp_apm_set_parent;
+
+	lp_apm_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_pll_switch_clk(struct device_node *node)
+{
+	const __be32 *reg;
+	int id;
+
+	ALLOC_CLK_LOOKUP();
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg) {
+		ret = -ENOENT;
+		goto out_kfree;
+	}
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2) {
+		ret = -EINVAL;
+		goto out_kfree;
+	}
+
+	clk->id = id;
+
+	switch (id) {
+	case 0:
+		clk->get_rate = dt_clk_pll1_sw_get_rate;
+		clk->set_parent = dt_clk_pll1_sw_set_parent;
+		pll1_sw_clk_dt = clk;
+		break;
+	case 1:
+		clk->get_rate = clk_pll_get_rate;
+		clk->set_rate = _clk_pll_set_rate;
+		clk->enable = _clk_pll_enable;
+		clk->disable = _clk_pll_disable;
+		clk->set_parent = dt_clk_pll2_sw_set_parent;
+		pll2_sw_clk_dt = clk;
+		break;
+	case 2:
+		clk->get_rate = clk_pll_get_rate;
+		clk->set_rate = _clk_pll_set_rate;
+		clk->enable = _clk_pll_enable;
+		clk->disable = _clk_pll_disable;
+		pll3_sw_clk_dt = clk;
+	}
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_add_pll1_main_clk(struct device_node *node)
+{
+	ALLOC_CLK_LOOKUP();
+
+	clk->get_rate = clk_pll_get_rate;
+	clk->enable = _clk_pll_enable;
+	clk->disable = _clk_pll_disable;
+
+	pll1_main_clk_dt = clk;
+
+	ADD_CLK_LOOKUP();
+}
+
+static __init int mx5_dt_scan_clks(void)
+{
+	struct device_node *node;
+	int ret;
+
+	ret = mx5_scan_fixed_clks();
+	if (ret) {
+		pr_err("%s: fixed-clock failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	for_each_compatible_node(node, NULL, "fsl,mxc-clock") {
+		if (!strcmp(node->name, "pll1_main"))
+			ret = mx5_add_pll1_main_clk(node);
+		else if (!strcmp(node->name, "pll_switch"))
+			ret = mx5_add_pll_switch_clk(node);
+		else if (!strcmp(node->name, "lp_apm"))
+			ret = mx5_add_lp_apm_clk(node);
+		else if (!strcmp(node->name, "periph_apm"))
+			ret = mx5_add_periph_apm_clk(node);
+		else if (!strcmp(node->name, "ipg_per"))
+			ret = mx5_add_ipg_per_clk(node);
+		else if (!strcmp(node->name, "cpu"))
+			ret = mx5_add_cpu_clk(node);
+		else if (!strcmp(node->name, "ddr_hf"))
+			ret = mx5_add_ddr_hf_clk(node);
+		else if (!strcmp(node->name, "ddr"))
+			ret = mx5_add_ddr_clk(node);
+		else if (!strcmp(node->name, "emi_fast"))
+			ret = mx5_add_emi_fast_clk(node);
+		else if (!strcmp(node->name, "main_bus"))
+			ret = mx5_add_main_bus_clk(node);
+		else if (!strcmp(node->name, "emi_slow"))
+			ret = mx5_add_emi_slow_clk(node);
+		else if (!strcmp(node->name, "ahb"))
+			ret = mx5_add_ahb_clk(node);
+		else if (!strcmp(node->name, "ipg"))
+			ret = mx5_add_ipg_clk(node);
+		else if (!strcmp(node->name, "spba"))
+			ret = mx5_add_spba_clk(node);
+		else if (!strcmp(node->name, "iim"))
+			ret = mx5_add_iim_clk(node);
+		else if (!strcmp(node->name, "ahb_max"))
+			ret = mx5_add_ahb_max_clk(node);
+		else if (!strcmp(node->name, "aips_tz"))
+			ret = mx5_add_aips_tz_clk(node);
+		else if (!strcmp(node->name, "ahbmux1"))
+			ret = mx5_add_ahbmux1_clk(node);
+		else if (!strcmp(node->name, "gpt_ipg"))
+			ret = mx5_add_gpt_ipg_clk(node);
+		else if (!strcmp(node->name, "gpt"))
+			ret = mx5_add_gpt_clk(node);
+		else if (!strcmp(node->name, "gpt_32k"))
+			ret = mx5_add_gpt_32k_clk(node);
+		else if (!strcmp(node->name, "uart_ipg"))
+			ret = mx5_add_uart_ipg_clk(node);
+		else if (!strcmp(node->name, "uart_root"))
+			ret = mx5_add_uart_root_clk(node);
+		else if (!strcmp(node->name, "uart"))
+			ret = mx5_add_uart_clk(node);
+		else if (!strcmp(node->name, "fec"))
+			ret = mx5_add_fec_clk(node);
+		else if (!strcmp(node->name, "pwm"))
+			ret = mx5_add_pwm_clk(node);
+		else if (!strcmp(node->name, "i2c"))
+			ret = mx5_add_i2c_clk(node);
+		else if (!strcmp(node->name, "nfc"))
+			ret = mx5_add_nfc_clk(node);
+		else if (!strcmp(node->name, "ssi_ipg"))
+			ret = mx5_add_ssi_ipg_clk(node);
+		else if (!strcmp(node->name, "ssi"))
+			ret = mx5_add_ssi_clk(node);
+		else if (!strcmp(node->name, "cspi_ipg"))
+			ret = mx5_add_cspi_ipg_clk(node);
+		else if (!strcmp(node->name, "cspi"))
+			ret = mx5_add_cspi_clk(node);
+		else if (!strcmp(node->name, "ecspi_main"))
+			ret = mx5_add_ecspi_main_clk(node);
+		else if (!strcmp(node->name, "ecspi_ipg"))
+			ret = mx5_add_ecspi_ipg_clk(node);
+		else if (!strcmp(node->name, "ecspi"))
+			ret = mx5_add_ecspi_clk(node);
+		else if (!strcmp(node->name, "sdma"))
+			ret = mx5_add_sdma_clk(node);
+		else if (!strcmp(node->name, "esdhc_ipg"))
+			ret = mx5_add_esdhc_ipg_clk(node);
+		else if (!strcmp(node->name, "esdhc"))
+			ret = mx5_add_esdhc_clk(node);
+		else if (!strcmp(node->name, "mipi_esc"))
+			ret = mx5_add_mipi_esc_clk(node);
+		else if (!strcmp(node->name, "mipi_hsc"))
+			ret = mx5_add_mipi_hsc_clk(node);
+		else if (!strcmp(node->name, "ipu_sec"))
+			ret = mx5_add_ipu_sec_clk(node);
+		else if (!strcmp(node->name, "ipu"))
+			ret = mx5_add_ipu_clk(node);
+		else if (!strcmp(node->name, "ipu_di"))
+			ret = mx5_add_ipu_di_clk(node);
+		else if (!strcmp(node->name, "mipi_hsp"))
+			ret = mx5_add_mipi_hsp_clk(node);
+		else if (!strcmp(node->name, "usboh3"))
+			ret = mx5_add_usboh3_clk(node);
+		else if (!strcmp(node->name, "usb_ahb"))
+			ret = mx5_add_usb_ahb_clk(node);
+		else if (!strcmp(node->name, "usb_phy1"))
+			ret = mx5_add_usb_phy1_clk(node);
+		else if (!strcmp(node->name, "dummy"))
+			ret = mx5_add_dummy_clk(node);
+		else
+			pr_warn("%s: unknown clock node %s\n",
+				__func__, node->name);
+
+		if (ret) {
+			pr_err("%s: clock %s failed %d\n",
+				__func__, node->name, ret);
+			break;
+		}
+	}
+
+	return ret;
 }
 
 void __init mx5_clk_dt_init(void)
 {
+	u32 reg;
+
 	mx5_dt_scan_clks();
+
+	/* clk_tree_init(); */
+	clk_set_parent(ipg_per_clk_dt, lp_apm_clk_dt);
+
+	/*
+	 * Initialise the IPG PER CLK dividers to 3. IPG_PER_CLK should be at
+	 * 8MHz, its derived from lp_apm.
+	 *
+	 * FIXME: Verify if true for all boards
+	 */
+	reg = __raw_readl(MXC_CCM_CBCDR);
+	reg &= ~MXC_CCM_CBCDR_PERCLK_PRED1_MASK;
+	reg &= ~MXC_CCM_CBCDR_PERCLK_PRED2_MASK;
+	reg &= ~MXC_CCM_CBCDR_PERCLK_PODF_MASK;
+	reg |= (2 << MXC_CCM_CBCDR_PERCLK_PRED1_OFFSET);
+	__raw_writel(reg, MXC_CCM_CBCDR);
+
+	clk_enable(cpu_clk_dt);
+	clk_enable(main_bus_clk_dt);
+
+	clk_enable(iim_clk_dt);
+	mx51_revision();
+	clk_disable(iim_clk_dt);
+
+	/* move usb_phy_clk to 24MHz */
+	clk_set_parent(usb_phy1_clk_dt, osc_clk_dt);
+
+	/* set the usboh3_clk parent to pll2_sw_clk */
+	clk_set_parent(usboh3_clk_dt, pll2_sw_clk_dt);
+
+	/* Set SDHC parents to be PLL2 */
+	clk_set_parent(esdhc1_clk_dt, pll2_sw_clk_dt);
+	clk_set_parent(esdhc2_clk_dt, pll2_sw_clk_dt);
+
+	/* set SDHC root clock as 166.25MHZ*/
+	clk_set_rate(esdhc1_clk_dt, 166250000);
+	clk_set_rate(esdhc2_clk_dt, 166250000);
 }
 #endif
-- 
1.7.1
