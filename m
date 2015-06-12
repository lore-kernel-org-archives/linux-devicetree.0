From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 08/15] drm/exynos: dsi: rename pll_clk to sclk_clk
Date: Fri, 12 Jun 2015 21:59:03 +0900
Message-ID: <1434113958-15877-9-git-send-email-human.hwang@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1434113958-15877-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch renames pll_clk to sclk_clk. The clock referenced by pll_clk
is actually not the pll input clock for dsi. The pll input clock comes
from the board's oscillator directly. But for the backward
compatibility, the old clock name "pll_clk" is also OK.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes before:
- Refer https://patchwork.kernel.org/patch/6191721
Changes for v6:
- Merged 2 patches
   drm/exynos: dsi: add the backward compatibility for the renamed clock
   drm/exynos: dsi: rename pll_clk to sclk_clk

 .../devicetree/bindings/video/exynos_dsim.txt      |  7 +++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 36 ++++++++++------------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index 802aa7e..44659dd 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -10,13 +10,14 @@ Required properties:
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
     entry in clock-names
-  - clock-names: should include "bus_clk"and "pll_clk" entries
+  - clock-names: should include "bus_clk"and "sclk_mipi" entries
+		 the use of "pll_clk" is deprecated
   - phys: list of phy specifiers, must contain an entry for each required
     entry in phy-names
   - phy-names: should include "dsim" entry
   - vddcore-supply: MIPI DSIM Core voltage supply (e.g. 1.1V)
   - vddio-supply: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
-  - samsung,pll-clock-frequency: specifies frequency of the "pll_clk" clock
+  - samsung,pll-clock-frequency: specifies frequency of the oscillator clock
   - #address-cells, #size-cells: should be set respectively to <1> and <0>
     according to DSI host bindings (see MIPI DSI bindings [1])

@@ -48,7 +49,7 @@ Example:
 		reg = <0x11C80000 0x10000>;
 		interrupts = <0 79 0>;
 		clocks = <&clock 286>, <&clock 143>;
-		clock-names = "bus_clk", "pll_clk";
+		clock-names = "bus_clk", "sclk_mipi";
 		phys = <&mipi_phy 1>;
 		phy-names = "dsim";
 		vddcore-supply = <&vusb_reg>;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index c1999ad..a3bfac2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -235,6 +235,8 @@
 #define DSI_XFER_TIMEOUT_MS		100
 #define DSI_RX_FIFO_EMPTY		0x30800002

+#define OLD_SCLK_MIPI_CLK_NAME "pll_clk"
+
 enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
@@ -279,7 +281,7 @@ struct exynos_dsi {

 	void __iomem *reg_base;
 	struct phy *phy;
-	struct clk *pll_clk;
+	struct clk *sclk_clk;
 	struct clk *bus_clk;
 	struct regulator_bulk_data supplies[2];
 	int irq;
@@ -433,16 +435,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
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
@@ -1313,10 +1306,10 @@ static int exynos_dsi_poweron(struct exynos_dsi *dsi)
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
@@ -1328,8 +1321,8 @@ static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 	return 0;

 err_phy:
-	clk_disable_unprepare(dsi->pll_clk);
-err_pll_clk:
+	clk_disable_unprepare(dsi->sclk_clk);
+err_sclk_clk:
 	clk_disable_unprepare(dsi->bus_clk);
 err_bus_clk:
 	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
@@ -1355,7 +1348,7 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)

 	phy_power_off(dsi->phy);

-	clk_disable_unprepare(dsi->pll_clk);
+	clk_disable_unprepare(dsi->sclk_clk);
 	clk_disable_unprepare(dsi->bus_clk);

 	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
@@ -1722,10 +1715,13 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}

-	dsi->pll_clk = devm_clk_get(dev, "pll_clk");
-	if (IS_ERR(dsi->pll_clk)) {
-		dev_info(dev, "failed to get dsi pll input clock\n");
-		return PTR_ERR(dsi->pll_clk);
+	dsi->sclk_clk = devm_clk_get(dev, "sclk_mipi");
+	if (IS_ERR(dsi->sclk_clk)) {
+		dsi->sclk_clk = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
+		if (IS_ERR(dsi->sclk_clk)) {
+			dev_info(dev, "failed to get dsi sclk clock\n");
+			eturn PTR_ERR(dsi->sclk_clk);
+		}
 	}

 	dsi->bus_clk = devm_clk_get(dev, "bus_clk");
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
