From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 08/12] soc: mediatek: avoid using fixed spm power status
 defines
Date: Sun, 19 Mar 2017 23:26:29 +0800
Message-ID: <1489937193-2953-9-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use variables to replace fixed defines since the offset
of the status of spm power might be different for some chips

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c |   33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index beb7916..eadbf0d 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -107,21 +107,28 @@ struct scp_domain {
 	struct regulator *supply;
 };
 
+struct scp_ctrl_reg {
+	int pwr_sta_offs;
+	int pwr_sta2nd_offs;
+};
+
 struct scp {
 	struct scp_domain *domains;
 	struct genpd_onecell_data pd_data;
 	struct device *dev;
 	void __iomem *base;
 	struct regmap *infracfg;
+	struct scp_ctrl_reg ctrl_reg;
 };
 
 static int scpsys_domain_is_on(struct scp_domain *scpd)
 {
 	struct scp *scp = scpd->scp;
 
-	u32 status = readl(scp->base + SPM_PWR_STATUS) & scpd->data->sta_mask;
-	u32 status2 = readl(scp->base + SPM_PWR_STATUS_2ND) &
-				scpd->data->sta_mask;
+	u32 status = readl(scp->base + scp->ctrl_reg.pwr_sta_offs) &
+						scpd->data->sta_mask;
+	u32 status2 = readl(scp->base + scp->ctrl_reg.pwr_sta2nd_offs) &
+						scpd->data->sta_mask;
 
 	/*
 	 * A domain is on when both status bits are set. If only one is set
@@ -346,7 +353,8 @@ static void init_clks(struct platform_device *pdev, struct clk **clk)
 }
 
 static struct scp *init_scp(struct platform_device *pdev,
-			const struct scp_domain_data *scp_domain_data, int num)
+			const struct scp_domain_data *scp_domain_data, int num,
+			struct scp_ctrl_reg *scp_ctrl_reg)
 {
 	struct genpd_onecell_data *pd_data;
 	struct resource *res;
@@ -358,6 +366,9 @@ static struct scp *init_scp(struct platform_device *pdev,
 	if (!scp)
 		return ERR_PTR(-ENOMEM);
 
+	scp->ctrl_reg.pwr_sta_offs = scp_ctrl_reg->pwr_sta_offs;
+	scp->ctrl_reg.pwr_sta2nd_offs = scp_ctrl_reg->pwr_sta2nd_offs;
+
 	scp->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -556,8 +567,13 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 static int __init scpsys_probe_mt2701(struct platform_device *pdev)
 {
 	struct scp *scp;
+	struct scp_ctrl_reg scp_reg;
 
-	scp = init_scp(pdev, scp_domain_data_mt2701, NUM_DOMAINS_MT2701);
+	scp_reg.pwr_sta_offs = SPM_PWR_STATUS;
+	scp_reg.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND;
+
+	scp = init_scp(pdev, scp_domain_data_mt2701, NUM_DOMAINS_MT2701,
+		       &scp_reg);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
@@ -667,8 +683,13 @@ static int __init scpsys_probe_mt8173(struct platform_device *pdev)
 	struct scp *scp;
 	struct genpd_onecell_data *pd_data;
 	int ret;
+	struct scp_ctrl_reg scp_reg;
+
+	scp_reg.pwr_sta_offs = SPM_PWR_STATUS;
+	scp_reg.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND;
 
-	scp = init_scp(pdev, scp_domain_data_mt8173, NUM_DOMAINS_MT8173);
+	scp = init_scp(pdev, scp_domain_data_mt8173, NUM_DOMAINS_MT8173,
+		       &scp_reg);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
-- 
1.7.9.5
