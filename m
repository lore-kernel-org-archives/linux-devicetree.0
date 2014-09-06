From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/7] clk: sunxi: Add post clk divider for factor clocks
Date: Sat,  6 Sep 2014 18:47:22 +0800
Message-ID: <1410000448-9999-2-git-send-email-wens@csie.org>
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

Some factor clocks, mostly PLLs, have an extra fixed divider just before
the clock output. Add an option to the factor clk driver config data to
specify this divider.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi/clk-factors.c | 3 +++
 drivers/clk/sunxi/clk-factors.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index 2057c8a..435111d 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -64,6 +64,9 @@ static unsigned long clk_factors_recalc_rate(struct clk_hw *hw,
 	/* Calculate the rate */
 	rate = (parent_rate * (n + config->n_start) * (k + 1) >> p) / (m + 1);
 
+	if (config->post_div)
+		rate /= config->post_div;
+
 	return rate;
 }
 
diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-factors.h
index d2d0efa..ce70c65 100644
--- a/drivers/clk/sunxi/clk-factors.h
+++ b/drivers/clk/sunxi/clk-factors.h
@@ -16,6 +16,7 @@ struct clk_factors_config {
 	u8 pshift;
 	u8 pwidth;
 	u8 n_start;
+	u8 post_div;
 };
 
 struct clk_factors {
-- 
2.1.0
