From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 4/8] drm/exynos: dsi: rename pll_clk to sclk_clk
Date: Tue, 07 Apr 2015 20:57:34 +0900
Message-ID: <1428407858-25523-5-git-send-email-human.hwang@samsung.com>
References: <1428407858-25523-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1428407858-25523-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch renames pll_clk to sclk_clk. The clock referenced by pll_clk
is actually not the pll input clock for dsi. The pll input clock comes
from the board's oscillator directly.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes for v3:
- Newly added

Changes for v4:
- None
 .../devicetree/bindings/video/exynos_dsim.txt      |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 31 ++++++++--------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index 802aa7e..39940ca 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -10,13 +10,13 @@ Required properties:
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
     entry in clock-names
-  - clock-names: should include "bus_clk"and "pll_clk" entries
+  - clock-names: should include "bus_clk"and "sclk_mipi" entries
   - phys: list of phy specifiers, must contain an entry for each required
     entry in phy-names
   - phy-names: should include "dsim" entry
   - vddcore-supply: MIPI DSIM Core voltage supply (e.g. 1.1V)
   - vddio-supply: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
-  - samsung,pll-clock-frequency: specifies frequency of the "pll_clk" clock
+  - samsung,pll-clock-frequency: specifies frequency of the oscillator clock
   - #address-cells, #size-cells: should be set respectively to <1> and <0>
     according to DSI host bindings (see MIPI DSI bindings [1])

@@ -48,7 +48,7 @@ Example:
 		reg = <0x11C80000 0x10000>;
 		interrupts = <0 79 0>;
 		clocks = <&clock 286>, <&clock 143>;
-		clock-names = "bus_clk", "pll_clk";
+		clock-names = "bus_clk", "sclk_mipi";
 		phys = <&mipi_phy 1>;
 		phy-names = "dsim";
 		vddcore-supply = <&vusb_reg>;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 05fe93d..4af18b2f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -277,7 +277,7 @@ struct exynos_dsi {

 	void __iomem *reg_base;
 	struct phy *phy;
-	struct clk *pll_clk;
+	struct clk *sclk_clk;
 	struct clk *bus_clk;
 	struct regulator_bulk_data supplies[2];
 	int irq;
@@ -431,16 +431,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 	u16 m;
 	u32 reg;

-	clk_set_rate(dsi->pll_clk, dsi->pll_clk_rate);
-
-	fin = clk_get_rate(dsi->pll_clk);
-	if (!fin) {
-		dev_err(dsi->dev, "failed to get PLL clock frequency\n");
-		return 0;
-	}
-
-	dev_dbg(dsi->dev, "PLL input frequency: %lu\n", fin);
-
+	fin = dsi->pll_clk_rate;
 	fout = exynos_dsi_pll_find_pms(dsi, fin, freq, &p, &m, &s);
 	if (!fout) {
 		dev_err(dsi->dev,
@@ -1308,10 +1299,10 @@ static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 		goto err_bus_clk;
 	}

-	ret = clk_prepare_enable(dsi->pll_clk);
+	ret = clk_prepare_enable(dsi->sclk_clk);
 	if (ret < 0) {
 		dev_err(dsi->dev, "cannot enable pll clock %d\n", ret);
-		goto err_pll_clk;
+		goto err_sclk_clk;
 	}

 	ret = phy_power_on(dsi->phy);
@@ -1323,8 +1314,8 @@ static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 	return 0;

 err_phy:
-	clk_disable_unprepare(dsi->pll_clk);
-err_pll_clk:
+	clk_disable_unprepare(dsi->sclk_clk);
+err_sclk_clk:
 	clk_disable_unprepare(dsi->bus_clk);
 err_bus_clk:
 	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
@@ -1350,7 +1341,7 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)

 	phy_power_off(dsi->phy);

-	clk_disable_unprepare(dsi->pll_clk);
+	clk_disable_unprepare(dsi->sclk_clk);
 	clk_disable_unprepare(dsi->bus_clk);

 	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
@@ -1720,10 +1711,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}

-	dsi->pll_clk = devm_clk_get(dev, "pll_clk");
-	if (IS_ERR(dsi->pll_clk)) {
-		dev_info(dev, "failed to get dsi pll input clock\n");
-		ret = PTR_ERR(dsi->pll_clk);
+	dsi->sclk_clk = devm_clk_get(dev, "sclk_mipi");
+	if (IS_ERR(dsi->sclk_clk)) {
+		dev_info(dev, "failed to get dsi sclk clock\n");
+		ret = PTR_ERR(dsi->sclk_clk);
 		goto err_del_component;
 	}

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
