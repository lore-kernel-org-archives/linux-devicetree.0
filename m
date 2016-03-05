From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 02/13] clk: sunxi: add ahb1 clock for A83T
Date: Sat,  5 Mar 2016 23:42:55 +0800
Message-ID: <1457192586-25596-3-git-send-email-vishnupatekar0510@gmail.com>
References: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBJX55O3AKGQEJJ4DL5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1457192586-25596-1-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

AHB1 on A83T is similar to ahb1 on A31, except parents are different.
clock index 0b1x is PLL6.

Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-sunxi.c                     | 76 +++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index c09f59b..2ee7841 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -29,6 +29,7 @@ Required properties:
 	"allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
 	"allwinner,sun9i-a80-cpus-clk" - for the CPUS on A80
 	"allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
+	"allwinner,sun8i-a83t-ahb1-clk" - for the AHB1 clock on A83T
 	"allwinner,sun8i-h3-ahb2-clk" - for the AHB2 clock on H3
 	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
 	"allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 99f60ef..0ae1f09 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -344,6 +344,67 @@ static void sun6i_ahb1_recalc(struct factors_request *req)
 	req->rate >>= req->p;
 }
 
+#define SUN8I_A83T_AHB1_PARENT_PLL6	2
+/**
+ * sun8i_a83t_get_ahb_factors() - calculates m, p factors for AHB
+ * AHB rate is calculated as follows
+ * rate = parent_rate >> p
+ *
+ * if parent is pll6, then
+ * parent_rate = pll6 rate / (m + 1)
+ */
+
+static void sun8i_a83t_get_ahb1_factors(struct factors_request *req)
+{
+	u8 div, calcp, calcm = 1;
+
+	/*
+	 * clock can only divide, so we will never be able to achieve
+	 * frequencies higher than the parent frequency
+	 */
+	if (req->parent_rate && req->rate > req->parent_rate)
+		req->rate = req->parent_rate;
+
+	div = DIV_ROUND_UP(req->parent_rate, req->rate);
+
+	/* calculate pre-divider if parent is pll6 */
+	if (req->parent_index >= SUN8I_A83T_AHB1_PARENT_PLL6) {
+		if (div < 4)
+			calcp = 0;
+		else if (div / 2 < 4)
+			calcp = 1;
+		else if (div / 4 < 4)
+			calcp = 2;
+		else
+			calcp = 3;
+
+		calcm = DIV_ROUND_UP(div, 1 << calcp);
+	} else {
+		calcp = __roundup_pow_of_two(div);
+		calcp = calcp > 3 ? 3 : calcp;
+}
+
+	req->rate = (req->parent_rate / calcm) >> calcp;
+	req->p = calcp;
+	req->m = calcm - 1;
+}
+
+/**
+* sun8i_a83t_ahb1_recalc() - calculates AHB clock rate from m, p factors and
+*			 parent index
+*/
+static void sun8i_a83t_ahb1_recalc(struct factors_request *req)
+{
+	req->rate = req->parent_rate;
+
+/* apply pre-divider first if parent is pll6 */
+	if (req->parent_index >= SUN6I_AHB1_PARENT_PLL6)
+		req->rate /= req->m + 1;
+
+	/* clk divider */
+	req->rate >>= req->p;
+}
+
 /**
  * sun4i_get_apb1_factors() - calculates m, p factors for APB1
  * APB1 rate is calculated as follows
@@ -555,6 +616,14 @@ static const struct factors_data sun6i_ahb1_data __initconst = {
 	.recalc = sun6i_ahb1_recalc,
 };
 
+static const struct factors_data sun8i_a83t_ahb1_data __initconst = {
+	.mux = 12,
+	.muxmask = BIT(1) | BIT(0),
+	.table = &sun6i_ahb1_config,
+	.getter = sun8i_a83t_get_ahb1_factors,
+	.recalc = sun8i_a83t_ahb1_recalc,
+};
+
 static const struct factors_data sun4i_apb1_data __initconst = {
 	.mux = 24,
 	.muxmask = BIT(1) | BIT(0),
@@ -627,6 +696,13 @@ static void __init sun6i_ahb1_clk_setup(struct device_node *node)
 CLK_OF_DECLARE(sun6i_a31_ahb1, "allwinner,sun6i-a31-ahb1-clk",
 	       sun6i_ahb1_clk_setup);
 
+static void __init sun8i_a83t_ahb1_clk_setup(struct device_node *node)
+{
+	sunxi_factors_clk_setup(node, &sun8i_a83t_ahb1_data);
+}
+CLK_OF_DECLARE(sun8i_a83t_ahb1, "allwinner,sun8i-a83t-ahb1-clk",
+	       sun8i_a83t_ahb1_clk_setup);
+
 static void __init sun4i_apb1_clk_setup(struct device_node *node)
 {
 	sunxi_factors_clk_setup(node, &sun4i_apb1_data);
-- 
1.9.1
