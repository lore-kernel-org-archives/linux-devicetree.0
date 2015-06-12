From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 11/15] drm/exynos: dsi: make use of array for clock access
Date: Fri, 12 Jun 2015 21:59:06 +0900
Message-ID: <1434113958-15877-12-git-send-email-human.hwang@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1434113958-15877-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch make the driver to use an array for clock access. The number
of clocks are different from the existing MIPI DSI driver and Exynos5433
MIPI DSI driver. So this patch is needed before adding support for
Exynos5433 MIPI DSI driver.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes before:
- Refer https://patchwork.kernel.org/patch/6191801
Changes for v6:
- None

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 68 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0b468d7..557b9d2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -211,6 +211,8 @@
 					REG_ADDR((dsi), (reg_idx)))
 #define DSI_READ(dsi, reg_idx)		readl(REG_ADDR((dsi), (reg_idx)))

+static char *clk_names[2] = { "bus_clk", "sclk_mipi" };
+
 enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
@@ -260,8 +262,7 @@ struct exynos_dsi {

 	void __iomem *reg_base;
 	struct phy *phy;
-	struct clk *sclk_clk;
-	struct clk *bus_clk;
+	struct clk **clks;
 	struct regulator_bulk_data supplies[2];
 	int irq;
 	int te_gpio;
@@ -1390,7 +1391,8 @@ static const struct mipi_dsi_host_ops exynos_dsi_ops = {

 static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 {
-	int ret;
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	int ret, i;

 	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0) {
@@ -1398,31 +1400,23 @@ static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 		return ret;
 	}

-	ret = clk_prepare_enable(dsi->bus_clk);
-	if (ret < 0) {
-		dev_err(dsi->dev, "cannot enable bus clock %d\n", ret);
-		goto err_bus_clk;
-	}
-
-	ret = clk_prepare_enable(dsi->sclk_clk);
-	if (ret < 0) {
-		dev_err(dsi->dev, "cannot enable pll clock %d\n", ret);
-		goto err_sclk_clk;
+	for (i = 0; i < driver_data->num_clks; i++) {
+		ret = clk_prepare_enable(dsi->clks[i]);
+		if (ret < 0)
+			goto err_clk;
 	}

 	ret = phy_power_on(dsi->phy);
 	if (ret < 0) {
 		dev_err(dsi->dev, "cannot enable phy %d\n", ret);
-		goto err_phy;
+		goto err_clk;
 	}

 	return 0;

-err_phy:
-	clk_disable_unprepare(dsi->sclk_clk);
-err_sclk_clk:
-	clk_disable_unprepare(dsi->bus_clk);
-err_bus_clk:
+err_clk:
+	while (--i > -1)
+		clk_disable_unprepare(dsi->clks[i]);
 	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);

 	return ret;
@@ -1430,7 +1424,8 @@ err_bus_clk:

 static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 {
-	int ret;
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	int ret, i;

 	usleep_range(10000, 20000);

@@ -1446,8 +1441,8 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)

 	phy_power_off(dsi->phy);

-	clk_disable_unprepare(dsi->sclk_clk);
-	clk_disable_unprepare(dsi->bus_clk);
+	for (i = driver_data->num_clks - 1; i > -1; i--)
+		clk_disable_unprepare(dsi->clks[i]);

 	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0)
@@ -1778,7 +1773,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct exynos_dsi *dsi;
-	int ret;
+	int ret, i;

 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1813,19 +1808,22 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}

-	dsi->sclk_clk = devm_clk_get(dev, "sclk_mipi");
-	if (IS_ERR(dsi->sclk_clk)) {
-		dsi->sclk_clk = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
-		if (IS_ERR(dsi->sclk_clk)) {
-			dev_info(dev, "failed to get dsi sclk clock\n");
-			eturn PTR_ERR(dsi->sclk_clk);
-		}
-	}
+	dsi->clks = devm_kzalloc(dev,
+			sizeof(*dsi->clks) * dsi->driver_data->num_clks,
+			GFP_KERNEL);
+	for (i = 0; i < dsi->driver_data->num_clks; i++) {
+		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
+		if (IS_ERR(dsi->clks[i])) {
+			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
+				strcpy(clk_names[i], OLD_SCLK_MIPI_CLK_NAME);
+				i--;
+				continue;
+			}

-	dsi->bus_clk = devm_clk_get(dev, "bus_clk");
-	if (IS_ERR(dsi->bus_clk)) {
-		dev_info(dev, "failed to get dsi bus clock\n");
-		return PTR_ERR(dsi->bus_clk);
+			dev_info(dev, "failed to get the clock: %s\n",
+					clk_names[i]);
+			return PTR_ERR(dsi->clks[i]);
+		}
 	}

 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
