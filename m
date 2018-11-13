From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 16/26] drm/sun4i: sun6i_mipi_dsi: Add support for VCC-DSI voltage regulator
Date: Tue, 13 Nov 2018 16:46:23 +0530
Message-ID: <20181113111633.20189-17-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Some boards have VCC-DSI pin connected to voltage regulator which may
not be turned on by default.

Add support for such boards by adding voltage regulator handling code to
MIPI DSI driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 703722f7c81b..2ea33db61ae1 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1026,6 +1026,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 	}
 
+	dsi->regulator = devm_regulator_get(dev, "vcc-dsi");
+	if (IS_ERR(dsi->regulator)) {
+		dev_err(dev, "Couldn't get VCC-DSI supply\n");
+		return PTR_ERR(dsi->regulator);
+	}
+
 	dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
 					      &sun6i_dsi_regmap_config);
 	if (IS_ERR(dsi->regs)) {
@@ -1107,6 +1113,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 static int __maybe_unused sun6i_dsi_runtime_resume(struct device *dev)
 {
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
+	int err;
+
+	err = regulator_enable(dsi->regulator);
+	if (err) {
+		dev_err(dsi->dev, "failed to enable VCC-DSI supply: %d\n", err);
+		return err;
+	}
 
 	reset_control_deassert(dsi->reset);
 	if (dsi->variant->has_mod_clk)
@@ -1141,6 +1154,7 @@ static int __maybe_unused sun6i_dsi_runtime_suspend(struct device *dev)
 	if (dsi->variant->has_mod_clk)
 		clk_disable_unprepare(dsi->mod_clk);
 	reset_control_assert(dsi->reset);
+	regulator_disable(dsi->regulator);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 597b62227019..0df60f84bab3 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -13,6 +13,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 
+#include <linux/regulator/consumer.h>
+
 struct sun6i_dphy {
 	struct clk		*bus_clk;
 	struct clk		*mod_clk;
@@ -32,6 +34,7 @@ struct sun6i_dsi {
 	struct clk		*bus_clk;
 	struct clk		*mod_clk;
 	struct regmap		*regs;
+	struct regulator	*regulator;
 	struct reset_control	*reset;
 	struct sun6i_dphy	*dphy;
 
-- 
2.18.0.321.gffc6fa0e3
