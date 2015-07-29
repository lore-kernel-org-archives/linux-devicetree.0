From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 06/10] clk: mediatek: mt8173: Fix enabling of critical
 clocks
Date: Wed, 29 Jul 2015 14:52:30 +0800
Message-ID: <1438152754-11970-7-git-send-email-jamesjj.liao@mediatek.com>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1438152754-11970-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

On the MT8173 the clocks are provided by different units. To enable
the critical clocks we must be sure that all parent clocks are already
registered, otherwise the parents of the critical clocks end up being
unused and get disabled later.

On MT8173, for example, it is the CLK_TOP clocks that have CLK_APMIXED
PLLs as their parents, so we cannot enable the CLK_TOP critical clocks
until the CLK_APMIXED clocks have all been registered.

To find a place where all parents are registered we try each time
after we've registered some clocks if all known providers are present
now and only then we enable the critical clocks.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 412c36d..c7933b2 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -697,6 +697,22 @@ static const struct mtk_composite peri_clks[] __initconst = {
 	MUX(CLK_PERI_UART3_SEL, "uart3_ck_sel", uart_ck_sel_parents, 0x40c, 3, 1),
 };
 
+static struct clk_onecell_data *mt8173_top_clk_data;
+static struct clk_onecell_data *mt8173_pll_clk_data;
+
+static void __init mtk_clk_enable_critical(void)
+{
+	if (!mt8173_top_clk_data || !mt8173_pll_clk_data)
+		return;
+
+	clk_prepare_enable(mt8173_pll_clk_data->clks[CLK_APMIXED_ARMCA15PLL]);
+	clk_prepare_enable(mt8173_pll_clk_data->clks[CLK_APMIXED_ARMCA7PLL]);
+	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_MEM_SEL]);
+	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_DDRPHYCFG_SEL]);
+	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_CCI400_SEL]);
+	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_RTC_SEL]);
+}
+
 static void __init mtk_topckgen_init(struct device_node *node)
 {
 	struct clk_onecell_data *clk_data;
@@ -709,19 +725,19 @@ static void __init mtk_topckgen_init(struct device_node *node)
 		return;
 	}
 
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	mt8173_top_clk_data = clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
 
 	mtk_clk_register_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
 	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
 			&mt8173_clk_lock, clk_data);
 
-	clk_prepare_enable(clk_data->clks[CLK_TOP_CCI400_SEL]);
-
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+
+	mtk_clk_enable_critical();
 }
 CLK_OF_DECLARE(mtk_topckgen, "mediatek,mt8173-topckgen", mtk_topckgen_init);
 
@@ -815,13 +831,13 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 {
 	struct clk_onecell_data *clk_data;
 
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	mt8173_pll_clk_data = clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 	if (!clk_data)
 		return;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-	clk_prepare_enable(clk_data->clks[CLK_APMIXED_ARMCA15PLL]);
+	mtk_clk_enable_critical();
 }
 CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt8173-apmixedsys",
 		mtk_apmixedsys_init);
-- 
1.8.1.1.dirty
