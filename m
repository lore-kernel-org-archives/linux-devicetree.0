From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] clk: meson: axg-audio: use the clk input helper function
Date: Tue,  4 Dec 2018 17:58:19 +0100
Message-ID: <20181204165819.21541-3-jbrunet@baylibre.com>
References: <20181204165819.21541-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165819.21541-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Rework the axg audio clock controller to use the new clk-input helper
function.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 83 ++++++++++-------------------------
 1 file changed, 24 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 5f6c860aa122..72b717e61a68 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -631,22 +631,23 @@ static struct clk_regmap *const axg_audio_clk_regmaps[] = {
 	&axg_tdmout_c_lrclk,
 };
 
-static struct clk *devm_clk_get_enable(struct device *dev, char *id)
+static int devm_clk_get_enable(struct device *dev, char *id)
 {
 	struct clk *clk;
 	int ret;
 
 	clk = devm_clk_get(dev, id);
 	if (IS_ERR(clk)) {
-		if (PTR_ERR(clk) != -EPROBE_DEFER)
+		ret = PTR_ERR(clk);
+		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get %s", id);
-		return clk;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "failed to enable %s", id);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	ret = devm_add_action_or_reset(dev,
@@ -654,74 +655,40 @@ static struct clk *devm_clk_get_enable(struct device *dev, char *id)
 				       clk);
 	if (ret) {
 		dev_err(dev, "failed to add reset action on %s", id);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	return clk;
-}
-
-static const struct clk_ops axg_clk_no_ops = {};
-
-static struct clk_hw *axg_clk_hw_register_bypass(struct device *dev,
-						 const char *name,
-						 const char *parent_name)
-{
-	struct clk_hw *hw;
-	struct clk_init_data init;
-	char *clk_name;
-	int ret;
-
-	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
-	if (!hw)
-		return ERR_PTR(-ENOMEM);
-
-	clk_name = kasprintf(GFP_KERNEL, "axg_%s", name);
-	if (!clk_name)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = clk_name;
-	init.ops = &axg_clk_no_ops;
-	init.flags = 0;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
-	hw->init = &init;
-
-	ret = devm_clk_hw_register(dev, hw);
-	kfree(clk_name);
-
-	return ret ? ERR_PTR(ret) : hw;
+	return 0;
 }
 
 static int axg_register_clk_hw_input(struct device *dev,
 				     const char *name,
 				     unsigned int clkid)
 {
-	struct clk *parent_clk = devm_clk_get(dev, name);
-	struct clk_hw *hw = NULL;
+	char *clk_name;
+	struct clk_hw *hw;
+	int err = 0;
 
-	if (IS_ERR(parent_clk)) {
-		int err = PTR_ERR(parent_clk);
+	clk_name = kasprintf(GFP_KERNEL, "axg_%s", name);
+	if (!clk_name)
+		return -ENOMEM;
 
+	hw = meson_clk_hw_register_input(dev, name, clk_name, 0);
+	if (IS_ERR(hw)) {
 		/* It is ok if an input clock is missing */
-		if (err == -ENOENT) {
+		if (PTR_ERR(hw) == -ENOENT) {
 			dev_dbg(dev, "%s not provided", name);
 		} else {
+			err = PTR_ERR(hw);
 			if (err != -EPROBE_DEFER)
 				dev_err(dev, "failed to get %s clock", name);
-			return err;
 		}
 	} else {
-		hw = axg_clk_hw_register_bypass(dev, name,
-						__clk_get_name(parent_clk));
-	}
-
-	if (IS_ERR(hw)) {
-		dev_err(dev, "failed to register %s clock", name);
-		return PTR_ERR(hw);
+		axg_audio_hw_onecell_data.hws[clkid] = hw;
 	}
 
-	axg_audio_hw_onecell_data.hws[clkid] = hw;
-	return 0;
+	kfree(clk_name);
+	return err;
 }
 
 static int axg_register_clk_hw_inputs(struct device *dev,
@@ -759,7 +726,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	struct regmap *map;
 	struct resource *res;
 	void __iomem *regs;
-	struct clk *clk;
 	struct clk_hw *hw;
 	int ret, i;
 
@@ -775,9 +741,9 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Get the mandatory peripheral clock */
-	clk = devm_clk_get_enable(dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = devm_clk_get_enable(dev, "pclk");
+	if (ret)
+		return ret;
 
 	ret = device_reset(dev);
 	if (ret) {
@@ -786,8 +752,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Register the peripheral input clock */
-	hw = axg_clk_hw_register_bypass(dev, "audio_pclk",
-					__clk_get_name(clk));
+	hw = meson_clk_hw_register_input(dev, "pclk", "audio_pclk", 0);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-- 
2.19.1
