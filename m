From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 4/6] arm/dt: mx51: dynamically add clocks per dt nodes
Date: Sat, 19 Mar 2011 02:24:30 +0800
Message-ID: <1300472672-13392-5-git-send-email-shawn.guo@linaro.org>
References: <1300472672-13392-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300472672-13392-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch is to change the static clock creating and registering to
the dynamic way, which scans dt clock nodes, associate clk with
device_node, and then add them to clkdev accordingly.

It's a pretty straight translation from non-dt clock code to dt one,
and it does not really change any actual clock implementation.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-mx5/Makefile          |    2 +-
 arch/arm/mach-mx5/clock-dt.c        |   52 --
 arch/arm/mach-mx5/clock-mx51-mx53.c | 1433 ++++++++++++++++++++++++++++++++++-
 3 files changed, 1410 insertions(+), 77 deletions(-)
 delete mode 100644 arch/arm/mach-mx5/clock-dt.c

diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
index bd4542d..540697e 100644
--- a/arch/arm/mach-mx5/Makefile
+++ b/arch/arm/mach-mx5/Makefile
@@ -18,4 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) += board-cpuimx51sd.o
 obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) += eukrea_mbimxsd-baseboard.o
 obj-$(CONFIG_MACH_MX51_EFIKAMX) += board-mx51_efikamx.o
 obj-$(CONFIG_MACH_MX50_RDP) += board-mx50_rdp.o
-obj-$(CONFIG_MACH_MX51_DT) += board-dt.o clock-dt.o
+obj-$(CONFIG_MACH_MX51_DT) += board-dt.o
diff --git a/arch/arm/mach-mx5/clock-dt.c b/arch/arm/mach-mx5/clock-dt.c
deleted file mode 100644
index 9c04475..0000000
--- a/arch/arm/mach-mx5/clock-dt.c
+++ /dev/null
@@ -1,52 +0,0 @@
-
-/*
- * Copyright 2011 Linaro Ltd.
- * Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 or later at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
- */
-
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/clk.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_clk.h>
-
-static struct clk *mx5_dt_clk_get(struct device_node *np,
-					const char *output_id, void *data)
-{
-	return data;
-}
-
-static __init void mx5_dt_scan_clks(void)
-{
-	struct device_node *node;
-	struct clk *clk;
-	const char *id;
-	int rc;
-
-	for_each_compatible_node(node, NULL, "clock") {
-		id = of_get_property(node, "clock-outputs", NULL);
-		if (!id)
-			continue;
-
-		clk = clk_get_sys(id, NULL);
-		if (IS_ERR(clk))
-			continue;
-
-		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
-		if (rc)
-			pr_err("error adding fixed clk %s\n", node->name);
-	}
-}
-
-void __init mx5_clk_dt_init(void)
-{
-	mx5_dt_scan_clks();
-}
diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
index 0a19e75..f5fdded 100644
--- a/arch/arm/mach-mx5/clock-mx51-mx53.c
+++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
@@ -15,6 +15,10 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/clkdev.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_clk.h>
 
 #include <asm/div64.h>
 
@@ -43,6 +47,28 @@ static struct clk emi_fast_clk;
 static struct clk ipu_clk;
 static struct clk mipi_hsc1_clk;
 
+/*
+ * The pointers are defined to unify the references to clocks, as clocks
+ * could also be created by dt code in a dynamic way besides the static
+ * way used in existing non-dt clock code.
+ */
+static struct clk *osc_clk_ptr;
+static struct clk *pll1_main_clk_ptr;
+static struct clk *pll1_sw_clk_ptr;
+static struct clk *pll2_sw_clk_ptr;
+static struct clk *pll3_sw_clk_ptr;
+static struct clk *lp_apm_clk_ptr;
+static struct clk *periph_apm_clk_ptr;
+static struct clk *main_bus_clk_ptr;
+static struct clk *ipg_clk_ptr;
+static struct clk *ipg_per_clk_ptr;
+static struct clk *cpu_clk_ptr;
+static struct clk *iim_clk_ptr;
+static struct clk *usboh3_clk_ptr;
+static struct clk *usb_phy1_clk_ptr;
+static struct clk *esdhc1_clk_ptr;
+static struct clk *esdhc2_clk_ptr;
+
 #define MAX_DPLL_WAIT_TRIES	1000 /* 1000 * udelay(1) = 1ms */
 
 /* calculate best pre and post dividers to get the required divider */
@@ -129,11 +155,11 @@ static inline u32 _get_mux(struct clk *parent, struct clk *m0,
 
 static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
 {
-	if (pll == &pll1_main_clk)
+	if (pll == pll1_main_clk_ptr)
 		return MX51_DPLL1_BASE;
-	else if (pll == &pll2_sw_clk)
+	else if (pll == pll2_sw_clk_ptr)
 		return MX51_DPLL2_BASE;
-	else if (pll == &pll3_sw_clk)
+	else if (pll == pll3_sw_clk_ptr)
 		return MX51_DPLL3_BASE;
 	else
 		BUG();
@@ -310,7 +336,7 @@ static int _clk_pll1_sw_set_parent(struct clk *clk, struct clk *parent)
 	 *
 	 * When switching back, do it in reverse order
 	 */
-	if (parent == &pll1_main_clk) {
+	if (parent == pll1_main_clk_ptr) {
 		/* Switch to pll1_main_clk */
 		reg &= ~MXC_CCM_CCSR_PLL1_SW_CLK_SEL;
 		__raw_writel(reg, MXC_CCM_CCSR);
@@ -320,11 +346,11 @@ static int _clk_pll1_sw_set_parent(struct clk *clk, struct clk *parent)
 		reg |= (MXC_CCM_CCSR_STEP_SEL_LP_APM <<
 				MXC_CCM_CCSR_STEP_SEL_OFFSET);
 	} else {
-		if (parent == &lp_apm_clk) {
+		if (parent == lp_apm_clk_ptr) {
 			step = MXC_CCM_CCSR_STEP_SEL_LP_APM;
-		} else  if (parent == &pll2_sw_clk) {
+		} else  if (parent == pll2_sw_clk_ptr) {
 			step = MXC_CCM_CCSR_STEP_SEL_PLL2_DIVIDED;
-		} else  if (parent == &pll3_sw_clk) {
+		} else  if (parent == pll3_sw_clk_ptr) {
 			step = MXC_CCM_CCSR_STEP_SEL_PLL3_DIVIDED;
 		} else
 			return -EINVAL;
@@ -350,10 +376,10 @@ static unsigned long clk_pll1_sw_get_rate(struct clk *clk)
 
 	reg = __raw_readl(MXC_CCM_CCSR);
 
-	if (clk->parent == &pll2_sw_clk) {
+	if (clk->parent == pll2_sw_clk_ptr) {
 		div = ((reg & MXC_CCM_CCSR_PLL2_PODF_MASK) >>
 		       MXC_CCM_CCSR_PLL2_PODF_OFFSET) + 1;
-	} else if (clk->parent == &pll3_sw_clk) {
+	} else if (clk->parent == pll3_sw_clk_ptr) {
 		div = ((reg & MXC_CCM_CCSR_PLL3_PODF_MASK) >>
 		       MXC_CCM_CCSR_PLL3_PODF_OFFSET) + 1;
 	} else
@@ -367,7 +393,7 @@ static int _clk_pll2_sw_set_parent(struct clk *clk, struct clk *parent)
 
 	reg = __raw_readl(MXC_CCM_CCSR);
 
-	if (parent == &pll2_sw_clk)
+	if (parent == pll2_sw_clk_ptr)
 		reg &= ~MXC_CCM_CCSR_PLL2_SW_CLK_SEL;
 	else
 		reg |= MXC_CCM_CCSR_PLL2_SW_CLK_SEL;
@@ -380,7 +406,7 @@ static int _clk_lp_apm_set_parent(struct clk *clk, struct clk *parent)
 {
 	u32 reg;
 
-	if (parent == &osc_clk)
+	if (parent == osc_clk_ptr)
 		reg = __raw_readl(MXC_CCM_CCSR) & ~MXC_CCM_CCSR_LP_APM_SEL;
 	else
 		return -EINVAL;
@@ -423,7 +449,8 @@ static int _clk_periph_apm_set_parent(struct clk *clk, struct clk *parent)
 	u32 reg, mux;
 	int i = 0;
 
-	mux = _get_mux(parent, &pll1_sw_clk, &pll3_sw_clk, &lp_apm_clk, NULL);
+	mux = _get_mux(parent, pll1_sw_clk_ptr, pll3_sw_clk_ptr,
+			lp_apm_clk_ptr, NULL);
 
 	reg = __raw_readl(MXC_CCM_CBCMR) & ~MXC_CCM_CBCMR_PERIPH_CLK_SEL_MASK;
 	reg |= mux << MXC_CCM_CBCMR_PERIPH_CLK_SEL_OFFSET;
@@ -452,9 +479,9 @@ static int _clk_main_bus_set_parent(struct clk *clk, struct clk *parent)
 
 	reg = __raw_readl(MXC_CCM_CBCDR);
 
-	if (parent == &pll2_sw_clk)
+	if (parent == pll2_sw_clk_ptr)
 		reg &= ~MXC_CCM_CBCDR_PERIPH_CLK_SEL;
-	else if (parent == &periph_apm_clk)
+	else if (parent == periph_apm_clk_ptr)
 		reg |= MXC_CCM_CBCDR_PERIPH_CLK_SEL;
 	else
 		return -EINVAL;
@@ -587,7 +614,7 @@ static unsigned long clk_ipg_per_get_rate(struct clk *clk)
 
 	parent_rate = clk_get_rate(clk->parent);
 
-	if (clk->parent == &main_bus_clk || clk->parent == &lp_apm_clk) {
+	if (clk->parent == main_bus_clk_ptr || clk->parent == lp_apm_clk_ptr) {
 		/* the main_bus_clk is the one before the DVFS engine */
 		reg = __raw_readl(MXC_CCM_CBCDR);
 		prediv1 = ((reg & MXC_CCM_CBCDR_PERCLK_PRED1_MASK) >>
@@ -597,7 +624,7 @@ static unsigned long clk_ipg_per_get_rate(struct clk *clk)
 		podf = ((reg & MXC_CCM_CBCDR_PERCLK_PODF_MASK) >>
 			MXC_CCM_CBCDR_PERCLK_PODF_OFFSET) + 1;
 		return parent_rate / (prediv1 * prediv2 * podf);
-	} else if (clk->parent == &ipg_clk)
+	} else if (clk->parent == ipg_clk_ptr)
 		return parent_rate;
 	else
 		BUG();
@@ -612,11 +639,11 @@ static int _clk_ipg_per_set_parent(struct clk *clk, struct clk *parent)
 	reg &= ~MXC_CCM_CBCMR_PERCLK_LP_APM_CLK_SEL;
 	reg &= ~MXC_CCM_CBCMR_PERCLK_IPG_CLK_SEL;
 
-	if (parent == &ipg_clk)
+	if (parent == ipg_clk_ptr)
 		reg |= MXC_CCM_CBCMR_PERCLK_IPG_CLK_SEL;
-	else if (parent == &lp_apm_clk)
+	else if (parent == lp_apm_clk_ptr)
 		reg |= MXC_CCM_CBCMR_PERCLK_LP_APM_CLK_SEL;
-	else if (parent != &main_bus_clk)
+	else if (parent != main_bus_clk_ptr)
 		return -EINVAL;
 
 	__raw_writel(reg, MXC_CCM_CBCMR);
@@ -830,7 +857,7 @@ static struct clk ipg_clk = {
 	.get_rate = clk_ipg_get_rate,
 };
 
-static struct clk ipg_perclk = {
+static struct clk ipg_per_clk = {
 	.parent = &lp_apm_clk,
 	.get_rate = clk_ipg_per_get_rate,
 	.set_parent = _clk_ipg_per_set_parent,
@@ -1036,8 +1063,9 @@ static int clk_##name##_set_parent(struct clk *clk, struct clk *parent)	\
 {									\
 	u32 reg, mux;							\
 									\
-	mux = _get_mux(parent, &pll1_sw_clk, &pll2_sw_clk,		\
-			&pll3_sw_clk, &lp_apm_clk);			\
+	mux = _get_mux(parent, pll1_sw_clk_ptr, pll2_sw_clk_ptr,	\
+			pll3_sw_clk_ptr, lp_apm_clk_ptr);		\
+									\
 	reg = __raw_readl(MXC_CCM_CSCMR##nr) &				\
 		~MXC_CCM_CSCMR##nr##_##bitsname##_CLK_SEL_MASK;		\
 	reg |= mux << MXC_CCM_CSCMR##nr##_##bitsname##_CLK_SEL_OFFSET;	\
@@ -1115,7 +1143,7 @@ static int clk_usb_phy1_set_parent(struct clk *clk, struct clk *parent)
 
 	reg = __raw_readl(MXC_CCM_CSCMR1) & ~MXC_CCM_CSCMR1_USB_PHY_CLK_SEL;
 
-	if (parent == &pll3_sw_clk)
+	if (parent == pll3_sw_clk_ptr)
 		reg |= 1 << MXC_CCM_CSCMR1_USB_PHY_CLK_SEL_OFFSET;
 
 	__raw_writel(reg, MXC_CCM_CSCMR1);
@@ -1346,7 +1374,7 @@ static void clk_tree_init(void)
 {
 	u32 reg;
 
-	ipg_perclk.set_parent(&ipg_perclk, &lp_apm_clk);
+	clk_set_parent(ipg_per_clk_ptr, lp_apm_clk_ptr);
 
 	/*
 	 * Initialise the IPG PER CLK dividers to 3. IPG_PER_CLK should be at
@@ -1367,6 +1395,27 @@ int __init mx51_clocks_init(unsigned long ckil, unsigned long osc,
 {
 	int i;
 
+	/*
+	 * Save the clock pointers that could be referenced by
+	 * both non-dt and dt clock codes later in this file.
+	 */
+	osc_clk_ptr		= &osc_clk;
+	pll1_main_clk_ptr	= &pll1_main_clk;
+	pll1_sw_clk_ptr		= &pll1_sw_clk;
+	pll2_sw_clk_ptr		= &pll2_sw_clk;
+	pll3_sw_clk_ptr		= &pll3_sw_clk;
+	lp_apm_clk_ptr		= &lp_apm_clk;
+	periph_apm_clk_ptr	= &periph_apm_clk;
+	main_bus_clk_ptr	= &main_bus_clk;
+	ipg_clk_ptr		= &ipg_clk;
+	ipg_per_clk_ptr		= &ipg_per_clk;
+	cpu_clk_ptr		= &cpu_clk;
+	iim_clk_ptr		= &iim_clk;
+	usboh3_clk_ptr		= &usboh3_clk;
+	usb_phy1_clk_ptr	= &usb_phy1_clk;
+	esdhc1_clk_ptr		= &esdhc1_clk;
+	esdhc2_clk_ptr		= &esdhc2_clk;
+
 	external_low_reference = ckil;
 	external_high_reference = ckih1;
 	ckih2_reference = ckih2;
@@ -1432,3 +1481,1339 @@ int __init mx53_clocks_init(unsigned long ckil, unsigned long osc,
 		MX53_INT_GPT);
 	return 0;
 }
+
+/*
+ * Dynamically create and register clks per dt nodes
+ */
+#ifdef CONFIG_OF
+static unsigned long get_fixed_clk_rate(struct clk *clk)
+{
+	return clk->rate;
+}
+
+static __init int mx5_scan_fixed_clks(void)
+{
+	struct device_node *node;
+	struct clk_lookup *cl;
+	struct clk *clk;
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
+
+		dev_id = of_get_property(node, "clock-outputs", NULL);
+		if (!dev_id) {
+			kfree(cl);
+			continue;
+		}
+
+		rate = of_get_property(node, "clock-frequency", NULL);
+		if (!rate) {
+			kfree(cl);
+			continue;
+		}
+		clk->rate = be32_to_cpu(*rate);
+		clk->get_rate = get_fixed_clk_rate;
+
+		if (!strcmp(node->name, "osc"))
+			osc_clk_ptr = clk;
+
+		node->clk = clk;
+
+		cl->dev_id = dev_id;
+		cl->clk = clk;
+		clkdev_add(cl);
+	}
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
+	int sz;
+
+	prop = of_get_property(node, prop_name, &sz);
+	if (!prop || sz < 4)
+		goto out;
+
+	/* Extract the phandle from the start of the property value */
+	provhandle = be32_to_cpup(prop);
+	prop += 4;
+	sz -= 4;
+
+	/*
+	 * Make sure the clock name is properly terminated and within the
+	 * size of the property.
+	 */
+	if (strlen(prop) + 1 > sz)
+		goto out;
+
+	provnode = of_find_node_by_phandle(provhandle);
+	if (!provnode)
+		goto out;
+
+	clk = provnode->clk;
+
+	of_node_put(provnode);
+
+	return clk;
+
+out:
+	pr_err("%s: failed to get %s of %s\n", __func__, prop_name, node->name);
+	return NULL;
+}
+
+static inline struct clk *mx5_get_source_clk(struct device_node *node)
+{
+	return mx5_prop_name_to_clk(node, "src-clock");
+}
+
+static inline struct clk *mx5_get_depend_clk(struct device_node *node)
+{
+	return mx5_prop_name_to_clk(node, "dep-clock");
+}
+
+static __init struct clk_lookup *mx5_pre_clk_lookup(struct device_node * node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
+	if (cl) {
+		clk = (struct clk *) (cl + 1);
+		clk->parent = mx5_get_source_clk(node);
+		clk->secondary = mx5_get_source_clk(node);
+	}
+
+	return cl;
+}
+
+static __init int mx5_post_clk_lookup(struct clk_lookup *cl,
+				      struct device_node *node)
+{
+	struct clk *clk;
+	const char *dev_id;
+
+	dev_id = of_get_property(node, "clock-outputs", NULL);
+	if (!dev_id) {
+		kfree(cl);
+		return -EINVAL;
+	}
+
+	clk = (struct clk *) (cl + 1);
+	node->clk = clk;
+
+	cl->dev_id = dev_id;
+	cl->clk = clk;
+	clkdev_add(cl);
+
+	return 0;
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
+	node->clk = clk;
+
+	cl->clk = clk;
+	clkdev_add(cl);
+
+	return 0;
+}
+
+static __init int mx5_add_usb_phy1_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
+	clk->set_parent = clk_usb_phy1_set_parent;
+
+	usb_phy1_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_usb_ahb_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_usboh3_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_usboh3_get_rate;
+	clk->set_parent = clk_usboh3_set_parent;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
+
+	usboh3_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_mipi_hsp_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_hsc_enable;
+	clk->disable = _clk_hsc_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG6_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ipu_di_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR6;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG5_OFFSET :
+					MXC_CCM_CCGRx_CG6_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ipu_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = clk_ipu_enable;
+	clk->disable = clk_ipu_disable;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ipu_sec_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_mipi_hsc_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG3_OFFSET :
+					MXC_CCM_CCGRx_CG4_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_mipi_esc_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_esdhc_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+		esdhc1_clk_ptr = clk;
+	} else {
+		clk->enable_shift = MXC_CCM_CCGRx_CG3_OFFSET;
+		clk->get_rate = clk_esdhc2_get_rate;
+		clk->set_rate = clk_esdhc2_set_rate;
+		clk->set_parent = clk_esdhc2_set_parent;
+		esdhc2_clk_ptr = clk;
+	}
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_esdhc_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_max_enable;
+	clk->disable = _clk_max_disable;
+	clk->enable_reg = MXC_CCM_CCGR3;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG0_OFFSET :
+					MXC_CCM_CCGRx_CG2_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_sdma_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG15_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ecspi_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG10_OFFSET :
+					MXC_CCM_CCGRx_CG12_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ecspi_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable_inrun;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG9_OFFSET :
+					MXC_CCM_CCGRx_CG11_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ecspi_main_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_ecspi_get_rate;
+	clk->set_parent = clk_ecspi_set_parent;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_cspi_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_cspi_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR4;
+	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ssi_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ssi_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_nfc_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_i2c_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_pwm_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG6_OFFSET :
+					MXC_CCM_CCGRx_CG8_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_fec_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG12_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_uart_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_uart_root_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_uart_get_rate;
+	clk->set_parent = clk_uart_set_parent;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_uart_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
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
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_gpt_32k_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_gpt_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_gpt_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR2;
+	clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ahbmux1_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_aips_tz_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 1)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG12_OFFSET :
+					MXC_CCM_CCGRx_CG13_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ahb_max_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_max_enable;
+	clk->disable = _clk_max_disable;
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_iim_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable_reg = MXC_CCM_CCGR0;
+	clk->enable_shift = MXC_CCM_CCGRx_CG15_OFFSET;
+
+	iim_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_spba_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ipg_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_ipg_get_rate;
+
+	ipg_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ahb_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_ahb_get_rate;
+	clk->set_rate = _clk_ahb_set_rate;
+	clk->round_rate = _clk_ahb_round_rate;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_emi_slow_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
+	clk->get_rate = clk_emi_slow_get_rate;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_main_bus_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->set_parent = _clk_main_bus_set_parent;
+
+	main_bus_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_emi_fast_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->enable = _clk_ccgr_enable;
+	clk->disable = _clk_ccgr_disable_inwait;
+	clk->enable_reg = MXC_CCM_CCGR5;
+	clk->enable_shift = MXC_CCM_CCGRx_CG7_OFFSET;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ddr_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ddr_hf_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = _clk_ddr_hf_get_rate;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_cpu_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_cpu_get_rate;
+	clk->set_rate = clk_cpu_set_rate;
+
+	cpu_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_ipg_per_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_ipg_per_get_rate;
+	clk->set_parent = _clk_ipg_per_set_parent;
+
+	ipg_per_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_periph_apm_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->set_parent = _clk_periph_apm_set_parent;
+
+	periph_apm_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_lp_apm_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->set_parent = _clk_lp_apm_set_parent;
+
+	lp_apm_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_pll_switch_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+	const __be32 *reg;
+	int id;
+
+	reg = of_get_property(node, "reg", NULL);
+	if (!reg)
+		return -ENOENT;
+
+	id = be32_to_cpu(*reg);
+	if (id < 0 || id > 2)
+		return -EINVAL;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->id = id;
+
+	switch (id) {
+	case 0:
+		clk->get_rate = clk_pll1_sw_get_rate;
+		clk->set_parent = _clk_pll1_sw_set_parent;
+		pll1_sw_clk_ptr = clk;
+		break;
+	case 1:
+		clk->get_rate = clk_pll_get_rate;
+		clk->set_rate = _clk_pll_set_rate;
+		clk->enable = _clk_pll_enable;
+		clk->disable = _clk_pll_disable;
+		clk->set_parent = _clk_pll2_sw_set_parent;
+		pll2_sw_clk_ptr = clk;
+		break;
+	case 2:
+		clk->get_rate = clk_pll_get_rate;
+		clk->set_rate = _clk_pll_set_rate;
+		clk->enable = _clk_pll_enable;
+		clk->disable = _clk_pll_disable;
+		pll3_sw_clk_ptr = clk;
+	}
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+static __init int mx5_add_pll1_main_clk(struct device_node *node)
+{
+	struct clk_lookup *cl;
+	struct clk *clk;
+
+	cl = mx5_pre_clk_lookup(node);
+	if (!cl)
+		return -ENOMEM;
+	clk = (struct clk *) (cl + 1);
+
+	clk->get_rate = clk_pll_get_rate;
+	clk->enable = _clk_pll_enable;
+	clk->disable = _clk_pll_disable;
+
+	pll1_main_clk_ptr = clk;
+
+	return mx5_post_clk_lookup(cl, node);
+}
+
+#define MX5_CLK_COMP	"fsl,mxc-clock"
+
+static const struct of_device_id mx5_dt_mxc_clock_ids[] = {
+	{ .name = "pll1_main",	.compatible = MX5_CLK_COMP, .data = mx5_add_pll1_main_clk },
+	{ .name = "pll_switch", .compatible = MX5_CLK_COMP, .data = mx5_add_pll_switch_clk },
+	{ .name = "lp_apm",	.compatible = MX5_CLK_COMP, .data = mx5_add_lp_apm_clk },
+	{ .name = "periph_apm", .compatible = MX5_CLK_COMP, .data = mx5_add_periph_apm_clk },
+	{ .name = "ipg_per",	.compatible = MX5_CLK_COMP, .data = mx5_add_ipg_per_clk },
+	{ .name = "cpu",	.compatible = MX5_CLK_COMP, .data = mx5_add_cpu_clk },
+	{ .name = "ddr_hf",	.compatible = MX5_CLK_COMP, .data = mx5_add_ddr_hf_clk },
+	{ .name = "ddr",	.compatible = MX5_CLK_COMP, .data = mx5_add_ddr_clk },
+	{ .name = "emi_fast",	.compatible = MX5_CLK_COMP, .data = mx5_add_emi_fast_clk },
+	{ .name = "main_bus",	.compatible = MX5_CLK_COMP, .data = mx5_add_main_bus_clk },
+	{ .name = "emi_slow",	.compatible = MX5_CLK_COMP, .data = mx5_add_emi_slow_clk },
+	{ .name = "ahb",	.compatible = MX5_CLK_COMP, .data = mx5_add_ahb_clk },
+	{ .name = "ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_ipg_clk },
+	{ .name = "spba",	.compatible = MX5_CLK_COMP, .data = mx5_add_spba_clk },
+	{ .name = "iim",	.compatible = MX5_CLK_COMP, .data = mx5_add_iim_clk },
+	{ .name = "ahb_max",	.compatible = MX5_CLK_COMP, .data = mx5_add_ahb_max_clk },
+	{ .name = "aips_tz",	.compatible = MX5_CLK_COMP, .data = mx5_add_aips_tz_clk },
+	{ .name = "ahbmux1",	.compatible = MX5_CLK_COMP, .data = mx5_add_ahbmux1_clk },
+	{ .name = "gpt_ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_gpt_ipg_clk },
+	{ .name = "gpt",	.compatible = MX5_CLK_COMP, .data = mx5_add_gpt_clk },
+	{ .name = "gpt_32k",	.compatible = MX5_CLK_COMP, .data = mx5_add_gpt_32k_clk },
+	{ .name = "uart_ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_uart_ipg_clk },
+	{ .name = "uart_root",	.compatible = MX5_CLK_COMP, .data = mx5_add_uart_root_clk },
+	{ .name = "uart",	.compatible = MX5_CLK_COMP, .data = mx5_add_uart_clk },
+	{ .name = "fec",	.compatible = MX5_CLK_COMP, .data = mx5_add_fec_clk },
+	{ .name = "pwm",	.compatible = MX5_CLK_COMP, .data = mx5_add_pwm_clk },
+	{ .name = "i2c",	.compatible = MX5_CLK_COMP, .data = mx5_add_i2c_clk },
+	{ .name = "nfc",	.compatible = MX5_CLK_COMP, .data = mx5_add_nfc_clk },
+	{ .name = "ssi_ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_ssi_ipg_clk },
+	{ .name = "ssi",	.compatible = MX5_CLK_COMP, .data = mx5_add_ssi_clk },
+	{ .name = "cspi_ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_cspi_ipg_clk },
+	{ .name = "cspi",	.compatible = MX5_CLK_COMP, .data = mx5_add_cspi_clk },
+	{ .name = "ecspi_main",	.compatible = MX5_CLK_COMP, .data = mx5_add_ecspi_main_clk },
+	{ .name = "ecspi_ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_ecspi_ipg_clk },
+	{ .name = "ecspi",	.compatible = MX5_CLK_COMP, .data = mx5_add_ecspi_clk },
+	{ .name = "sdma",	.compatible = MX5_CLK_COMP, .data = mx5_add_sdma_clk },
+	{ .name = "esdhc_ipg",	.compatible = MX5_CLK_COMP, .data = mx5_add_esdhc_ipg_clk },
+	{ .name = "esdhc",	.compatible = MX5_CLK_COMP, .data = mx5_add_esdhc_clk },
+	{ .name = "mipi_esc",	.compatible = MX5_CLK_COMP, .data = mx5_add_mipi_esc_clk },
+	{ .name = "mipi_hsc",	.compatible = MX5_CLK_COMP, .data = mx5_add_mipi_hsc_clk },
+	{ .name = "ipu_sec",	.compatible = MX5_CLK_COMP, .data = mx5_add_ipu_sec_clk },
+	{ .name = "ipu",	.compatible = MX5_CLK_COMP, .data = mx5_add_ipu_clk },
+	{ .name = "ipu_di",	.compatible = MX5_CLK_COMP, .data = mx5_add_ipu_di_clk },
+	{ .name = "mipi_hsp",	.compatible = MX5_CLK_COMP, .data = mx5_add_mipi_hsp_clk },
+	{ .name = "usboh3",	.compatible = MX5_CLK_COMP, .data = mx5_add_usboh3_clk },
+	{ .name = "usb_ahb",	.compatible = MX5_CLK_COMP, .data = mx5_add_usb_ahb_clk },
+	{ .name = "usb_phy1",	.compatible = MX5_CLK_COMP, .data = mx5_add_usb_phy1_clk },
+	{ .name = "dummy",	.compatible = MX5_CLK_COMP, .data = mx5_add_dummy_clk },
+	{ /* sentinel */ }
+};
+
+static __init int mx5_dt_scan_clks(void)
+{
+	struct device_node *np;
+	const struct of_device_id *dt_clk_id;
+	int (*mx5_add_clk)(struct device_node *);
+	int ret;
+
+	ret = mx5_scan_fixed_clks();
+	if (ret) {
+		pr_err("%s: fixed-clock failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	for_each_matching_node(np, mx5_dt_mxc_clock_ids) {
+		dt_clk_id = of_match_node(mx5_dt_mxc_clock_ids, np);
+		mx5_add_clk = dt_clk_id->data;
+		ret = mx5_add_clk(np);
+		if (ret) {
+			pr_err("%s: clock %s failed %d\n",
+				__func__, np->name, ret);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+void __init mx5_clk_dt_init(void)
+{
+	mx5_dt_scan_clks();
+
+	clk_tree_init();
+
+	clk_enable(cpu_clk_ptr);
+	clk_enable(main_bus_clk_ptr);
+
+	clk_enable(iim_clk_ptr);
+	mx51_revision();
+	clk_disable(iim_clk_ptr);
+
+	/* move usb_phy_clk to 24MHz */
+	clk_set_parent(usb_phy1_clk_ptr, osc_clk_ptr);
+
+	/* set the usboh3_clk parent to pll2_sw_clk */
+	clk_set_parent(usboh3_clk_ptr, pll2_sw_clk_ptr);
+
+	/* Set SDHC parents to be PLL2 */
+	clk_set_parent(esdhc1_clk_ptr, pll2_sw_clk_ptr);
+	clk_set_parent(esdhc2_clk_ptr, pll2_sw_clk_ptr);
+
+	/* set SDHC root clock as 166.25MHZ*/
+	clk_set_rate(esdhc1_clk_ptr, 166250000);
+	clk_set_rate(esdhc2_clk_ptr, 166250000);
+}
+#endif
-- 
1.7.1
