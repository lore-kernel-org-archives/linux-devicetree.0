From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 07/15] rtc: sun6i: Add support for all known variants
Date: Wed, 28 Nov 2018 17:30:05 +0800
Message-ID: <20181128093013.24442-9-wens@csie.org>
References: <20181128093013.24442-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBOWA7HPQKGQEJC6277I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181128093013.24442-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are different variants to the RTC hardware first seen on sun6i
(A31). The differences we care about in this driver are the clock rate
for the internal oscillator, prescalers, and the presence of an external
clock output.

This patch adds support for all the known base compatibles using the
variants data structure previously introduced.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index d1866d90b9ef..0a635e9cc25f 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -312,6 +312,50 @@ static void __init sun6i_a31_rtc_clk_init(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(sun6i_a31_rtc_clk, "allwinner,sun6i-a31-rtc",
 		      sun6i_a31_rtc_clk_init);
 
+static const struct sun6i_rtc_clk_data sun8i_a23_rtc_data = {
+	.rc_osc_rate = 667000, /* datasheet says 600 ~ 700 KHz */
+	.has_prescaler = 1,
+	.has_out_clk = 1,
+};
+
+static void __init sun8i_a23_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun8i_a23_rtc_data);
+}
+CLK_OF_DECLARE_DRIVER(sun8i_a23_rtc_clk, "allwinner,sun8i-a23-rtc",
+		      sun8i_a23_rtc_clk_init);
+
+static const struct sun6i_rtc_clk_data sun8i_h3_rtc_data = {
+	.rc_osc_rate = 16000000,
+	.fixed_prescaler = 32,
+	.has_prescaler = 1,
+	.has_out_clk = 1,
+};
+
+static void __init sun8i_h3_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun8i_h3_rtc_data);
+}
+CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk, "allwinner,sun8i-h3-rtc",
+		      sun8i_h3_rtc_clk_init);
+/* As far as we are concerned, clocks for H5 and H6 are the same as H3 */
+CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk, "allwinner,sun50i-h5-rtc",
+		      sun8i_h3_rtc_clk_init);
+CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
+		      sun8i_h3_rtc_clk_init);
+
+static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data = {
+	.rc_osc_rate = 32000,
+	.has_out_clk = 1,
+};
+
+static void __init sun8i_v3_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun8i_v3_rtc_data);
+}
+CLK_OF_DECLARE_DRIVER(sun8i_v3_rtc_clk, "allwinner,sun8i-v3-rtc",
+		      sun8i_v3_rtc_clk_init);
+
 static irqreturn_t sun6i_rtc_alarmirq(int irq, void *id)
 {
 	struct sun6i_rtc_dev *chip = (struct sun6i_rtc_dev *) id;
@@ -625,6 +669,11 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
  */
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
+	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-h3-rtc" },
+	{ .compatible = "allwinner,sun8i-v3-rtc" },
+	{ .compatible = "allwinner,sun50i-h5-rtc" },
+	{ .compatible = "allwinner,sun50i-h6-rtc" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
-- 
2.19.1
