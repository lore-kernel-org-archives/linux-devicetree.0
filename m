From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/7] clk: sunxi: Fix PLL6 calculation on sun6i
Date: Sat,  6 Sep 2014 18:47:23 +0800
Message-ID: <1410000448-9999-3-git-send-email-wens@csie.org>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBROMVOQAKGQE56GOECY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1410000448-9999-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The N factor for PLL6 counts from 1 to 32, as specified in the A23
manual, and shown in Allwinner's original A31 code.

Also the PLL6 factors alone calculate the clock rate for PLL6x2, not
the normal halved output for PLL6. This is what the factors clk
.recalc_rate callback expects.

This patch fixes the N factor in the clock driver, and adds a post
PLL divider of 2 to calculate the rate for PLL6.

A further patch (to the DT) should add a fixed-factor x2 clock as
the PLL6x2 output.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi/clk-sunxi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index b654b7b..be9ac07 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -246,7 +246,7 @@ static void sun4i_get_pll5_factors(u32 *freq, u32 parent_rate,
 /**
  * sun6i_a31_get_pll6_factors() - calculates n, k factors for A31 PLL6
  * PLL6 rate is calculated as follows
- * rate = parent_rate * n * (k + 1) / 2
+ * rate = parent_rate * (n + 1) * (k + 1) / 2
  * parent_rate is always 24Mhz
  */
 
@@ -273,7 +273,7 @@ static void sun6i_a31_get_pll6_factors(u32 *freq, u32 parent_rate,
 	if (*k > 3)
 		*k = 3;
 
-	*n = DIV_ROUND_UP(div, (*k+1));
+	*n = DIV_ROUND_UP(div, (*k+1)) - 1;
 }
 
 /**
@@ -494,6 +494,8 @@ static struct clk_factors_config sun6i_a31_pll6_config = {
 	.nwidth = 5,
 	.kshift = 4,
 	.kwidth = 2,
+	.n_start = 1,
+	.post_div = 2,
 };
 
 static struct clk_factors_config sun4i_apb1_config = {
-- 
2.1.0
