From: Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/4] soc: mediatek: To move power control logic to ARM TF
Date: Fri, 18 Dec 2015 10:42:29 +0800
Message-ID: <1450406551-1741-3-git-send-email-fan.chen@mediatek.com>
References: <1450406551-1741-1-git-send-email-fan.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1450406551-1741-1-git-send-email-fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Koro Chen <koro.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yt.lee" <yt.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "yt.lee" <yt.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add an option to test if ARM TF supports non-cpus power
control and do it in firmware. Otherwise, fallback to
legecy way handling it in kernel driver.

Regarding time consumption of sip call for the power control.
In 52051 times of sip calls with power_LoadTest,
the maximum cost is 433us and the average cost is 118us.

Signed-off-by: yt.lee <yt.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c    |  122 ++++++++++++++++++++++------------
 include/linux/soc/mediatek/mtk-sip.h |    4 ++
 2 files changed, 82 insertions(+), 44 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 4d4203c..cc8d0c8 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -21,6 +21,7 @@
 #include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/infracfg.h>
+#include <linux/soc/mediatek/mtk-sip.h>
 #include <dt-bindings/power/mt8173-power.h>
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -187,6 +188,7 @@ struct scp {
 	struct device *dev;
 	void __iomem *base;
 	struct regmap *infracfg;
+	bool sip_support;
 };
 
 static int scpsys_domain_is_on(struct scp_domain *scpd)
@@ -209,9 +211,8 @@ static int scpsys_domain_is_on(struct scp_domain *scpd)
 	return -EINVAL;
 }
 
-static int scpsys_power_on(struct generic_pm_domain *genpd)
+static int scpsys_power_on_mtcmos(struct scp_domain *scpd)
 {
-	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
 	struct scp *scp = scpd->scp;
 	unsigned long timeout;
 	bool expired;
@@ -219,17 +220,6 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	u32 sram_pdn_ack = scpd->sram_pdn_ack_bits;
 	u32 val;
 	int ret;
-	int i;
-
-	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++) {
-		ret = clk_prepare_enable(scpd->clk[i]);
-		if (ret) {
-			for (--i; i >= 0; i--)
-				clk_disable_unprepare(scpd->clk[i]);
-
-			goto err_clk;
-		}
-	}
 
 	val = readl(ctl_addr);
 	val |= PWR_ON_BIT;
@@ -245,10 +235,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 		if (ret > 0)
 			break;
 
-		if (expired) {
-			ret = -ETIMEDOUT;
-			goto err_pwr_ack;
-		}
+		if (expired)
+			return -ETIMEDOUT;
 
 		cpu_relax();
 
@@ -273,10 +261,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	expired = false;
 	while (sram_pdn_ack && (readl(ctl_addr) & sram_pdn_ack)) {
 
-		if (expired) {
-			ret = -ETIMEDOUT;
-			goto err_pwr_ack;
-		}
+		if (expired)
+			return  -ETIMEDOUT;
 
 		cpu_relax();
 
@@ -288,25 +274,14 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
 				scpd->bus_prot_mask);
 		if (ret)
-			goto err_pwr_ack;
+			return ret;
 	}
 
 	return 0;
-
-err_pwr_ack:
-	for (i = MAX_CLKS - 1; i >= 0; i--) {
-		if (scpd->clk[i])
-			clk_disable_unprepare(scpd->clk[i]);
-	}
-err_clk:
-	dev_err(scp->dev, "Failed to power on domain %s\n", genpd->name);
-
-	return ret;
 }
 
-static int scpsys_power_off(struct generic_pm_domain *genpd)
+static int scpsys_power_off_mtcmos(struct scp_domain *scpd)
 {
-	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
 	struct scp *scp = scpd->scp;
 	unsigned long timeout;
 	bool expired;
@@ -314,13 +289,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	u32 pdn_ack = scpd->sram_pdn_ack_bits;
 	u32 val;
 	int ret;
-	int i;
 
 	if (scpd->bus_prot_mask) {
 		ret = mtk_infracfg_set_bus_protection(scp->infracfg,
 				scpd->bus_prot_mask);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	val = readl(ctl_addr);
@@ -331,10 +305,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	timeout = jiffies + HZ;
 	expired = false;
 	while (pdn_ack && (readl(ctl_addr) & pdn_ack) != pdn_ack) {
-		if (expired) {
-			ret = -ETIMEDOUT;
-			goto out;
-		}
+
+		if (expired)
+			return -ETIMEDOUT;
 
 		cpu_relax();
 
@@ -365,10 +338,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 		if (ret == 0)
 			break;
 
-		if (expired) {
-			ret = -ETIMEDOUT;
-			goto out;
-		}
+		if (expired)
+			return -ETIMEDOUT;
 
 		cpu_relax();
 
@@ -376,6 +347,62 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 			expired = true;
 	}
 
+	return 0;
+}
+
+static int scpsys_power_on(struct generic_pm_domain *genpd)
+{
+	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
+	struct scp *scp = scpd->scp;
+	int ret;
+	int i;
+
+	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++) {
+		ret = clk_prepare_enable(scpd->clk[i]);
+		if (ret) {
+			for (--i; i >= 0; i--)
+				clk_disable_unprepare(scpd->clk[i]);
+
+			goto err_clk;
+		}
+	}
+
+	if (!scp->sip_support)
+		ret = scpsys_power_on_mtcmos(scpd);
+	else
+		ret = mtk_sip_simple_call(MTK_SIP_PWR_ON_MTCMOS,
+				  scpd->ctl_addr - scp->base, 0, 0);
+	if (ret)
+		goto err_pwr_ack;
+
+	return 0;
+
+err_pwr_ack:
+	for (i = MAX_CLKS - 1; i >= 0; i--) {
+		if (scpd->clk[i])
+			clk_disable_unprepare(scpd->clk[i]);
+	}
+err_clk:
+	dev_err(scp->dev, "Failed to power on domain %s\n", genpd->name);
+
+	return ret;
+}
+
+static int scpsys_power_off(struct generic_pm_domain *genpd)
+{
+	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
+	struct scp *scp = scpd->scp;
+	int ret;
+	int i;
+
+	if (!scp->sip_support)
+		ret = scpsys_power_off_mtcmos(scpd);
+	else
+		ret = mtk_sip_simple_call(MTK_SIP_PWR_OFF_MTCMOS,
+				  scpd->ctl_addr - scp->base, 0, 0);
+	if (ret)
+		goto out;
+
 	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++)
 		clk_disable_unprepare(scpd->clk[i]);
 
@@ -503,6 +530,13 @@ static int __init scpsys_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "Failed to add OF provider: %d\n", ret);
 
+	ret = mtk_sip_simple_call(MTK_SIP_PWR_MTCMOS_SUPPORT, 0, 0, 0);
+	if (ret) {
+		scp->sip_support = false;
+		dev_info(&pdev->dev, "SIP call is not supported: %d\n", ret);
+	} else
+		scp->sip_support = true;
+
 	return 0;
 }
 
diff --git a/include/linux/soc/mediatek/mtk-sip.h b/include/linux/soc/mediatek/mtk-sip.h
index dce1818..c803490 100644
--- a/include/linux/soc/mediatek/mtk-sip.h
+++ b/include/linux/soc/mediatek/mtk-sip.h
@@ -1,6 +1,10 @@
 #ifndef __SOC_MEDIATEK_MTKSIP_H
 #define __SOC_MEDIATEK_MTKSIP_H
 
+#define MTK_SIP_PWR_ON_MTCMOS			0x82000402
+#define MTK_SIP_PWR_OFF_MTCMOS			0x82000403
+#define MTK_SIP_PWR_MTCMOS_SUPPORT		0x82000404
+
 #ifdef CONFIG_MTK_SIP
 int mtk_sip_simple_call(unsigned long func_id,
 			unsigned long a1,
-- 
1.7.9.5
