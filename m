From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 5/9] drm/sun4i: tcon_top: Register clock gates in probe
Date: Fri, 14 Jun 2019 22:13:20 +0530
Message-ID: <20190614164324.9427-6-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

TCON TOP have clock gates for TV0, TV1, dsi and right
now these are register during bind call.

Of which, dsi clock gate would required during DPHY probe
but same can miss to get since tcon top is not bound at
that time.

To solve, this circular dependency move the clock gate
registration from bind to probe so-that DPHY can get the
dsi gate clock on time.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 94 ++++++++++++++------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 465e9b0cdfee..a8978b3fe851 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -124,7 +124,53 @@ static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
 static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 			       void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(tcon_top->rst);
+	if (ret) {
+		dev_err(dev, "Could not deassert ctrl reset control\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(tcon_top->bus);
+	if (ret) {
+		dev_err(dev, "Could not enable bus clock\n");
+		goto err_assert_reset;
+	}
+
+	return 0;
+
+err_assert_reset:
+	reset_control_assert(tcon_top->rst);
+
+	return ret;
+}
+
+static void sun8i_tcon_top_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
+	struct clk_hw_onecell_data *clk_data = tcon_top->clk_data;
+	int i;
+
+	of_clk_del_provider(dev->of_node);
+	for (i = 0; i < CLK_NUM; i++)
+		if (clk_data->hws[i])
+			clk_hw_unregister_gate(clk_data->hws[i]);
+
+	clk_disable_unprepare(tcon_top->bus);
+	reset_control_assert(tcon_top->rst);
+}
+
+static const struct component_ops sun8i_tcon_top_ops = {
+	.bind	= sun8i_tcon_top_bind,
+	.unbind	= sun8i_tcon_top_unbind,
+};
+
+static int sun8i_tcon_top_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	struct clk_hw_onecell_data *clk_data;
 	struct sun8i_tcon_top *tcon_top;
 	const struct sun8i_tcon_top_quirks *quirks;
@@ -132,7 +178,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	void __iomem *regs;
 	int ret, i;
 
-	quirks = of_device_get_match_data(&pdev->dev);
+	quirks = of_device_get_match_data(dev);
 
 	tcon_top = devm_kzalloc(dev, sizeof(*tcon_top), GFP_KERNEL);
 	if (!tcon_top)
@@ -164,18 +210,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	ret = reset_control_deassert(tcon_top->rst);
-	if (ret) {
-		dev_err(dev, "Could not deassert ctrl reset control\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(tcon_top->bus);
-	if (ret) {
-		dev_err(dev, "Could not enable bus clock\n");
-		goto err_assert_reset;
-	}
-
 	/*
 	 * At least on H6, some registers have some bits set by default
 	 * which may cause issues. Clear them here.
@@ -226,45 +260,15 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 
 	dev_set_drvdata(dev, tcon_top);
 
-	return 0;
+	return component_add(dev, &sun8i_tcon_top_ops);
 
 err_unregister_gates:
 	for (i = 0; i < CLK_NUM; i++)
 		if (!IS_ERR_OR_NULL(clk_data->hws[i]))
 			clk_hw_unregister_gate(clk_data->hws[i]);
-	clk_disable_unprepare(tcon_top->bus);
-err_assert_reset:
-	reset_control_assert(tcon_top->rst);
-
 	return ret;
 }
 
-static void sun8i_tcon_top_unbind(struct device *dev, struct device *master,
-				  void *data)
-{
-	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
-	struct clk_hw_onecell_data *clk_data = tcon_top->clk_data;
-	int i;
-
-	of_clk_del_provider(dev->of_node);
-	for (i = 0; i < CLK_NUM; i++)
-		if (clk_data->hws[i])
-			clk_hw_unregister_gate(clk_data->hws[i]);
-
-	clk_disable_unprepare(tcon_top->bus);
-	reset_control_assert(tcon_top->rst);
-}
-
-static const struct component_ops sun8i_tcon_top_ops = {
-	.bind	= sun8i_tcon_top_bind,
-	.unbind	= sun8i_tcon_top_unbind,
-};
-
-static int sun8i_tcon_top_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &sun8i_tcon_top_ops);
-}
-
 static int sun8i_tcon_top_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun8i_tcon_top_ops);
-- 
2.18.0.321.gffc6fa0e3
