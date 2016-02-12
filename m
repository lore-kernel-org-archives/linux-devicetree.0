From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 2/4] clk: sunxi: re-add old sun6i_a31_pll6 clock
Date: Fri, 12 Feb 2016 17:59:58 +0000
Message-ID: <1455300000-18723-3-git-send-email-andre.przywara@arm.com>
References: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBPF37C2QKGQESLQC4OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455300000-18723-1-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The older version of the A31 PLL6 clock driver was used by many DTs
which we want to stay compatible with.
As an intermediate step bring back the code for the old driver, but
don't instantiate it yet.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 drivers/clk/sunxi/clk-sunxi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index b4ab84b..12131ba 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -248,6 +248,21 @@ static void sun6i_a31_get_pll_factors(struct factors_request *req)
 	req->n = DIV_ROUND_UP(div, (req->k + 1)) - 1;
 }
 
+static void sun6i_a31_get_pll6_factors(struct factors_request *req)
+{
+	u8 div;
+
+	/* Normalize value to a parent_rate multiple (24M) */
+	div = req->rate / req->parent_rate;
+	req->rate = req->parent_rate * div;
+
+	req->k = div / 32;
+	if (req->k > 3)
+		req->k = 3;
+
+	req->n = DIV_ROUND_UP(div, (req->k + 1)) - 1;
+}
+
 static void sun6i_a31_pll6_recalc(struct factors_request *req)
 {
 	req->rate = req->parent_rate;
@@ -549,6 +564,13 @@ static const struct factors_data sun6i_a31_pll_data __initconst = {
 	.recalc = sun6i_a31_pll6_recalc,
 };
 
+static const struct factors_data sun6i_a31_pll6_data __initconst = {
+	.enable = 31,
+	.table = &sun6i_a31_pll6_config,
+	.getter = sun6i_a31_get_pll6_factors,
+	.name	= "pll6x2",
+};
+
 static const struct factors_data sun5i_a13_ahb_data __initconst = {
 	.mux = 6,
 	.muxmask = BIT(1) | BIT(0),
@@ -954,6 +976,15 @@ static const struct divs_data pll6_divs_data __initconst = {
 	}
 };
 
+static const struct divs_data sun6i_a31_pll6_divs_data __initconst = {
+	.factors = &sun6i_a31_pll6_data,
+	.ndivs = 2,
+	.div = {
+		{ .fixed = 2 }, /* normal output */
+		{ .self = 1 }, /* base factor clock, 2x */
+	}
+};
+
 /**
  * sunxi_divs_clk_setup() - Setup function for leaf divisors on clocks
  *
-- 
2.6.4
