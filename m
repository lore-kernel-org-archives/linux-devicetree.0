From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 08/14] rtc: sun6i: Expose internal oscillator
 through device tree
Date: Mon,  3 Dec 2018 22:58:19 +0800
Message-ID: <20181203145825.20511-9-wens@csie.org>
References: <20181203145825.20511-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGMJSXQAKGQEMY2ARYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181203145825.20511-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The bindings have been updated to expose the RTC's internal oscillator,
for some SoCs that have it directly feeding the PRCM block. The changes
include the index 2 for the clock outputs, as well as the clock output
names.

This patch adds the internal oscillator to the list of clocks exposed
through of_clk_add_hw_provider(), and also have the driver optionally
fetch the name of the clock from the device tree if it's available.

Tested-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 46609ae56ffd..11f56de52179 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -136,6 +136,7 @@ struct sun6i_rtc_clk_data {
 	unsigned int fixed_prescaler : 16;
 	unsigned int has_prescaler : 1;
 	unsigned int has_out_clk : 1;
+	unsigned int export_iosc : 1;
 };
 
 struct sun6i_rtc_dev {
@@ -220,6 +221,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 		.ops		= &sun6i_rtc_osc_ops,
 		.name		= "losc",
 	};
+	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";
 	const char *parents[2];
 
@@ -228,7 +230,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 		return;
 
 	rtc->data = data;
-	clk_data = kzalloc(struct_size(clk_data, hws, 2), GFP_KERNEL);
+	clk_data = kzalloc(struct_size(clk_data, hws, 3), GFP_KERNEL);
 	if (!clk_data) {
 		kfree(rtc);
 		return;
@@ -253,8 +255,13 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	if (!of_get_property(node, "clocks", NULL))
 		goto err;
 
+	/* Only read IOSC name from device tree if it is exported */
+	if (rtc->data->export_iosc)
+		of_property_read_string_index(node, "clock-output-names", 2,
+					      &iosc_name);
+
 	rtc->int_osc = clk_hw_register_fixed_rate_with_accuracy(NULL,
-								"rtc-int-osc",
+								iosc_name,
 								NULL, 0,
 								rtc->data->rc_osc_rate,
 								300000000);
@@ -293,6 +300,10 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	clk_data->num = 2;
 	clk_data->hws[0] = &rtc->hw;
 	clk_data->hws[1] = __clk_get_hw(rtc->ext_losc);
+	if (rtc->data->export_iosc) {
+		clk_data->hws[2] = rtc->int_osc;
+		clk_data->num = 3;
+	}
 	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	return;
 
@@ -330,6 +341,7 @@ static const struct sun6i_rtc_clk_data sun8i_h3_rtc_data = {
 	.fixed_prescaler = 32,
 	.has_prescaler = 1,
 	.has_out_clk = 1,
+	.export_iosc = 1,
 };
 
 static void __init sun8i_h3_rtc_clk_init(struct device_node *node)
-- 
2.20.0.rc1
