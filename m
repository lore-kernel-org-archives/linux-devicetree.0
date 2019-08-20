From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Subject: [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date: Tue, 20 Aug 2019 17:19:33 +0200
Message-ID: <20190820151934.3860-3-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBCM76DVAKGQESUDI3QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190820151934.3860-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

RTC on H6 is mostly the same as on H5 and H3. It has slight differences
mostly in features that are not yet supported by this driver.

Some differences are already stated in the comments in existing code.
One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
EXT_LOSC_EN to enable/disable external low speed crystal oscillator.

It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
external low speed oscillator is working correctly.

This patch adds support for enabling LOSC when necessary:

- during reparenting
- when probing the clock

H6 also has capacbility to automatically reparent RTC clock from
external crystal oscillator, to internal RC oscillator, if external
oscillator fails. This is enabled by default. Disable it during
probe.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index d50ee023b559..b0c3752bed3f 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -32,9 +32,11 @@
 /* Control register */
 #define SUN6I_LOSC_CTRL				0x0000
 #define SUN6I_LOSC_CTRL_KEY			(0x16aa << 16)
+#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
 #define SUN6I_LOSC_CTRL_ALM_DHMS_ACC		BIT(9)
 #define SUN6I_LOSC_CTRL_RTC_HMS_ACC		BIT(8)
 #define SUN6I_LOSC_CTRL_RTC_YMD_ACC		BIT(7)
+#define SUN6I_LOSC_CTRL_EXT_LOSC_EN		BIT(4)
 #define SUN6I_LOSC_CTRL_EXT_OSC			BIT(0)
 #define SUN6I_LOSC_CTRL_ACC_MASK		GENMASK(9, 7)
 
@@ -128,6 +130,8 @@ struct sun6i_rtc_clk_data {
 	unsigned int has_prescaler : 1;
 	unsigned int has_out_clk : 1;
 	unsigned int export_iosc : 1;
+	unsigned int has_losc_en : 1;
+	unsigned int has_auto_swt : 1;
 };
 
 struct sun6i_rtc_dev {
@@ -190,6 +194,10 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 	val &= ~SUN6I_LOSC_CTRL_EXT_OSC;
 	val |= SUN6I_LOSC_CTRL_KEY;
 	val |= index ? SUN6I_LOSC_CTRL_EXT_OSC : 0;
+	if (rtc->data->has_losc_en) {
+		val &= ~SUN6I_LOSC_CTRL_EXT_LOSC_EN;
+		val |= index ? SUN6I_LOSC_CTRL_EXT_LOSC_EN : 0;
+	}
 	writel(val, rtc->base + SUN6I_LOSC_CTRL);
 	spin_unlock_irqrestore(&rtc->lock, flags);
 
@@ -215,6 +223,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";
 	const char *parents[2];
+	u32 reg;
 
 	rtc = kzalloc(sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -235,9 +244,18 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 		goto err;
 	}
 
+	reg = SUN6I_LOSC_CTRL_KEY;
+	if (rtc->data->has_auto_swt) {
+		/* Bypass auto-switch to int osc, on ext losc failure */
+		reg |= SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS;
+		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
+	}
+
 	/* Switch to the external, more precise, oscillator */
-	writel(SUN6I_LOSC_CTRL_KEY | SUN6I_LOSC_CTRL_EXT_OSC,
-	       rtc->base + SUN6I_LOSC_CTRL);
+	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
+	if (rtc->data->has_losc_en)
+		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
+	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
 	/* Yes, I know, this is ugly. */
 	sun6i_rtc = rtc;
@@ -345,6 +363,23 @@ CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk, "allwinner,sun8i-h3-rtc",
 CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk, "allwinner,sun50i-h5-rtc",
 		      sun8i_h3_rtc_clk_init);
 
+static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
+	.rc_osc_rate = 16000000,
+	.fixed_prescaler = 32,
+	.has_prescaler = 1,
+	.has_out_clk = 1,
+	.export_iosc = 1,
+	.has_losc_en = 1,
+	.has_auto_swt = 1,
+};
+
+static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun50i_h6_rtc_data);
+}
+CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
+		      sun50i_h6_rtc_clk_init);
+
 static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data = {
 	.rc_osc_rate = 32000,
 	.has_out_clk = 1,
@@ -675,6 +710,7 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
+	{ .compatible = "allwinner,sun50i-h6-rtc" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
-- 
2.22.1
