From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH 1/3] clk: sunxi: Add sun6i/8i display support
Date: Wed, 30 Mar 2016 18:43:29 +0200
Message-ID: <2b347763e38cfeeb7a2d6af6357eaea6c4ec07ac.1459358017.git.moinejf@free.fr>
References: <cover.1459358017.git.moinejf@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1459358017.git.moinejf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the clock type which is used by the sun6i/8i families for video display.

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-sunxi.c                     | 38 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 834436f..8c0fda8 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -81,6 +81,7 @@ Required properties:
 	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
+	"allwinner,sun6i-a31-display-clk" - for the display clocks
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 91de0a0..0581e1b 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -1127,3 +1127,41 @@ static void __init sun6i_pll6_clk_setup(struct device_node *node)
 }
 CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-a31-pll6-clk",
 	       sun6i_pll6_clk_setup);
+
+/*
+ * sun6i display
+ *
+ * rate = parent_rate / (m + 1);
+ */
+static void sun6i_display_factors(struct factors_request *req)
+{
+	u8 m;
+
+	if (req->rate > req->parent_rate)
+		req->rate = req->parent_rate;
+
+	m = DIV_ROUND_UP(req->parent_rate, req->rate);
+
+	req->rate = req->parent_rate / m;
+	req->m = m - 1;
+}
+
+static const struct clk_factors_config sun6i_display_config = {
+	.mshift = 0,
+	.mwidth = 4,
+};
+
+static const struct factors_data sun6i_display_data __initconst = {
+	.enable = 31,
+	.mux = 24,
+	.muxmask = BIT(2) | BIT(1) | BIT(0),
+	.table = &sun6i_display_config,
+	.getter = sun6i_display_factors,
+};
+
+static void __init sun6i_display_setup(struct device_node *node)
+{
+	sunxi_factors_clk_setup(node, &sun6i_display_data);
+}
+CLK_OF_DECLARE(sun6i_display, "allwinner,sun6i-a31-display-clk",
+	       sun6i_display_setup);
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
