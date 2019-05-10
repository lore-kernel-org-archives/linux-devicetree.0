From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH v2 2/3] drm/stm: dsi: add support of an optional regulator
Date: Fri, 10 May 2019 16:20:20 +0200
Message-ID: <1557498023-10766-3-git-send-email-yannick.fertre@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support of an optional regulator for the phy part of the DSI
controller.

Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 45 ++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 1bef73e..22bd095 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/regulator/consumer.h>
 #include <drm/drmP.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/bridge/dw_mipi_dsi.h>
@@ -76,6 +77,7 @@ struct dw_mipi_dsi_stm {
 	u32 hw_version;
 	int lane_min_kbps;
 	int lane_max_kbps;
+	struct regulator *vdd_supply;
 };
 
 static inline void dsi_write(struct dw_mipi_dsi_stm *dsi, u32 reg, u32 val)
@@ -318,17 +320,31 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->base);
 	}
 
+	dsi->vdd_supply = devm_regulator_get_optional(dev, "phy-dsi");
+	if (IS_ERR(dsi->vdd_supply)) {
+		ret = PTR_ERR(dsi->vdd_supply);
+		if (ret != -EPROBE_DEFER)
+			DRM_ERROR("failed to request regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(dsi->vdd_supply);
+	if (ret) {
+		DRM_ERROR("failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
 	dsi->pllref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(dsi->pllref_clk)) {
 		ret = PTR_ERR(dsi->pllref_clk);
-		dev_err(dev, "Unable to get pll reference clock: %d\n", ret);
-		return ret;
+		DRM_ERROR("Unable to get pll reference clock: %d\n", ret);
+		goto err_clk_get;
 	}
 
 	ret = clk_prepare_enable(dsi->pllref_clk);
 	if (ret) {
-		dev_err(dev, "%s: Failed to enable pllref_clk\n", __func__);
-		return ret;
+		DRM_ERROR("%s: Failed to enable pllref_clk\n", __func__);
+		goto err_clk_get;
 	}
 
 	dw_mipi_dsi_stm_plat_data.base = dsi->base;
@@ -339,11 +355,19 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
 	if (IS_ERR(dsi->dsi)) {
 		DRM_ERROR("Failed to initialize mipi dsi host\n");
-		clk_disable_unprepare(dsi->pllref_clk);
-		return PTR_ERR(dsi->dsi);
+		ret = PTR_ERR(dsi->dsi);
+		goto err_dsi_probe;
 	}
 
 	return 0;
+
+err_dsi_probe:
+	clk_disable_unprepare(dsi->pllref_clk);
+err_clk_get:
+	regulator_disable(dsi->vdd_supply);
+
+	return ret;
+
 }
 
 static int dw_mipi_dsi_stm_remove(struct platform_device *pdev)
@@ -351,6 +375,7 @@ static int dw_mipi_dsi_stm_remove(struct platform_device *pdev)
 	struct dw_mipi_dsi_stm *dsi = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(dsi->pllref_clk);
+	regulator_disable(dsi->vdd_supply);
 	dw_mipi_dsi_remove(dsi->dsi);
 
 	return 0;
@@ -363,6 +388,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 	DRM_DEBUG_DRIVER("\n");
 
 	clk_disable_unprepare(dsi->pllref_clk);
+	regulator_disable(dsi->vdd_supply);
 
 	return 0;
 }
@@ -370,9 +396,16 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
 {
 	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
+	int ret;
 
 	DRM_DEBUG_DRIVER("\n");
 
+	ret = regulator_enable(dsi->vdd_supply);
+	if (ret) {
+		DRM_ERROR("failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
 	clk_prepare_enable(dsi->pllref_clk);
 
 	return 0;
-- 
2.7.4
