From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/2] soc: imx: gpcv2: handle reset clocks
Date: Mon, 17 Dec 2018 16:31:52 +0100
Message-ID: <20181217153152.21135-2-l.stach@pengutronix.de>
References: <20181217153152.21135-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181217153152.21135-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some power domains handled by the GPCv2 driver need to enable the clocks
for devies inside the domain, so that the reset propagation and proper
power-up sequencing happens. Handle them in the same way as on GPCv1.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../bindings/power/fsl,imx-gpcv2.txt          |  3 +
 drivers/soc/imx/gpcv2.c                       | 60 ++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
index 7c947a996df1..7c7e972aaa42 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
@@ -32,6 +32,9 @@ Required properties:
 Optional properties:
 
 - power-supply: Power supply used to power the domain
+- clocks: a number of phandles to clocks that need to be enabled during
+  domain power-up sequencing to ensure reset propagation into devices
+  located inside this power domain
 
 Example:
 
diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
index a8dd0cddb3d2..176f473127b6 100644
--- a/drivers/soc/imx/gpcv2.c
+++ b/drivers/soc/imx/gpcv2.c
@@ -8,6 +8,7 @@
  * Copyright 2015-2017 Pengutronix, Lucas Stach <kernel@pengutronix.de>
  */
 
+#include <linux/clk.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -98,10 +99,14 @@
 
 #define GPC_PGC_CTRL_PCR		BIT(0)
 
+#define GPC_CLK_MAX		6
+
 struct imx_pgc_domain {
 	struct generic_pm_domain genpd;
 	struct regmap *regmap;
 	struct regulator *regulator;
+	struct clk *clk[GPC_CLK_MAX];
+	int num_clks;
 
 	unsigned int pgc;
 
@@ -132,7 +137,7 @@ static int imx_gpc_pu_pgc_sw_pxx_req(struct generic_pm_domain *genpd,
 	const bool enable_power_control = !on;
 	const bool has_regulator = !IS_ERR(domain->regulator);
 	unsigned long deadline;
-	int ret = 0;
+	int i, ret = 0;
 
 	regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
 			   domain->bits.map, domain->bits.map);
@@ -145,6 +150,10 @@ static int imx_gpc_pu_pgc_sw_pxx_req(struct generic_pm_domain *genpd,
 		}
 	}
 
+	/* Enable reset clocks for all devices in the domain */
+	for (i = 0; i < domain->num_clks; i++)
+		clk_prepare_enable(domain->clk[i]);
+
 	if (enable_power_control)
 		regmap_update_bits(domain->regmap, GPC_PGC_CTRL(domain->pgc),
 				   GPC_PGC_CTRL_PCR, GPC_PGC_CTRL_PCR);
@@ -190,6 +199,10 @@ static int imx_gpc_pu_pgc_sw_pxx_req(struct generic_pm_domain *genpd,
 		regmap_update_bits(domain->regmap, GPC_PGC_CTRL(domain->pgc),
 				   GPC_PGC_CTRL_PCR, 0);
 
+	/* Disable reset clocks for all devices in the domain */
+	for (i = 0; i < domain->num_clks; i++)
+		clk_disable_unprepare(domain->clk[i]);
+
 	if (has_regulator && !on) {
 		int err;
 
@@ -440,6 +453,41 @@ static const struct imx_pgc_domain_data imx8m_pgc_domain_data = {
 	.reg_access_table = &imx8m_access_table,
 };
 
+static int imx_pgc_get_clocks(struct imx_pgc_domain *domain)
+{
+	int i, ret;
+
+	for (i = 0; ; i++) {
+		struct clk *clk = of_clk_get(domain->dev->of_node, i);
+		if (IS_ERR(clk))
+			break;
+		if (i >= GPC_CLK_MAX) {
+			dev_err(domain->dev, "more than %d clocks\n",
+				GPC_CLK_MAX);
+			ret = -EINVAL;
+			goto clk_err;
+		}
+		domain->clk[i] = clk;
+	}
+	domain->num_clks = i;
+
+	return 0;
+
+clk_err:
+	while (i--)
+		clk_put(domain->clk[i]);
+
+	return ret;
+}
+
+static void imx_pgc_put_clocks(struct imx_pgc_domain *domain)
+{
+	int i;
+
+	for (i = domain->num_clks - 1; i >= 0; i--)
+		clk_put(domain->clk[i]);
+}
+
 static int imx_pgc_domain_probe(struct platform_device *pdev)
 {
 	struct imx_pgc_domain *domain = pdev->dev.platform_data;
@@ -459,9 +507,17 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 				      domain->voltage, domain->voltage);
 	}
 
+	ret = imx_pgc_get_clocks(domain);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(domain->dev, "Failed to get domain's clocks\n");
+		return ret;
+	}
+
 	ret = pm_genpd_init(&domain->genpd, NULL, true);
 	if (ret) {
 		dev_err(domain->dev, "Failed to init power domain\n");
+		imx_pgc_put_clocks(domain);
 		return ret;
 	}
 
@@ -470,6 +526,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(domain->dev, "Failed to add genpd provider\n");
 		pm_genpd_remove(&domain->genpd);
+		imx_pgc_put_clocks(domain);
 	}
 
 	return ret;
@@ -481,6 +538,7 @@ static int imx_pgc_domain_remove(struct platform_device *pdev)
 
 	of_genpd_del_provider(domain->dev->of_node);
 	pm_genpd_remove(&domain->genpd);
+	imx_pgc_put_clocks(domain);
 
 	return 0;
 }
-- 
2.19.1
