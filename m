From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 3/9] clk: mediatek: Add __initdata and __init for data and
 functions
Date: Tue, 4 Aug 2015 16:16:52 +0800
Message-ID: <1438676218-11310-4-git-send-email-jamesjj.liao@mediatek.com>
References: <1438676218-11310-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1438676218-11310-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add __init for clock registration functions, and add __initdata for
mtk_gate_regs initial structures.

Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/clk/mediatek/clk-gate.c   |  2 +-
 drivers/clk/mediatek/clk-mt8173.c |  6 +++---
 drivers/clk/mediatek/clk-mtk.c    | 13 +++++++------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 5702036..576bdb7 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -97,7 +97,7 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv = {
 	.disable	= mtk_cg_disable_inv,
 };
 
-struct clk *mtk_clk_register_gate(
+struct clk * __init mtk_clk_register_gate(
 		const char *name,
 		const char *parent_name,
 		struct regmap *regmap,
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 13aa432..361fe32 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -586,7 +586,7 @@ static const struct mtk_composite top_muxes[] __initconst = {
 	MUX(CLK_TOP_I2S3_B_SEL, "i2s3_b_ck_sel", i2s3_b_ck_parents, 0x120, 8, 1),
 };
 
-static const struct mtk_gate_regs infra_cg_regs = {
+static const struct mtk_gate_regs infra_cg_regs __initconst = {
 	.set_ofs = 0x0040,
 	.clr_ofs = 0x0044,
 	.sta_ofs = 0x0048,
@@ -615,13 +615,13 @@ static const struct mtk_gate infra_clks[] __initconst = {
 	GATE_ICG(CLK_INFRA_PMICWRAP, "infra_pmicwrap", "axi_sel", 23),
 };
 
-static const struct mtk_gate_regs peri0_cg_regs = {
+static const struct mtk_gate_regs peri0_cg_regs __initconst = {
 	.set_ofs = 0x0008,
 	.clr_ofs = 0x0010,
 	.sta_ofs = 0x0018,
 };
 
-static const struct mtk_gate_regs peri1_cg_regs = {
+static const struct mtk_gate_regs peri1_cg_regs __initconst = {
 	.set_ofs = 0x000c,
 	.clr_ofs = 0x0014,
 	.sta_ofs = 0x001c,
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 18444ae..268b6ff 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -24,7 +24,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
-struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
+struct clk_onecell_data * __init mtk_alloc_clk_data(unsigned int clk_num)
 {
 	int i;
 	struct clk_onecell_data *clk_data;
@@ -49,8 +49,8 @@ err_out:
 	return NULL;
 }
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
-		struct clk_onecell_data *clk_data)
+void __init mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
+		int num, struct clk_onecell_data *clk_data)
 {
 	int i;
 	struct clk *clk;
@@ -72,7 +72,8 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
 	}
 }
 
-int mtk_clk_register_gates(struct device_node *node, const struct mtk_gate *clks,
+int __init mtk_clk_register_gates(struct device_node *node,
+		const struct mtk_gate *clks,
 		int num, struct clk_onecell_data *clk_data)
 {
 	int i;
@@ -111,7 +112,7 @@ int mtk_clk_register_gates(struct device_node *node, const struct mtk_gate *clks
 	return 0;
 }
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
+struct clk * __init mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
 	struct clk *clk;
@@ -196,7 +197,7 @@ err_out:
 	return ERR_PTR(ret);
 }
 
-void mtk_clk_register_composites(const struct mtk_composite *mcs,
+void __init mtk_clk_register_composites(const struct mtk_composite *mcs,
 		int num, void __iomem *base, spinlock_t *lock,
 		struct clk_onecell_data *clk_data)
 {
-- 
1.8.1.1.dirty
