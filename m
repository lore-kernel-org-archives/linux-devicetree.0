From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 4/6] clk: mvebu Add the time base generator clocks for
 Armada 3700
Date: Mon, 15 Aug 2016 14:10:14 -0700
Message-ID: <20160815211014.GC361@codeaurora.org>
References: <1468935742-11218-1-git-send-email-gregory.clement@free-electrons.com>
 <1468935742-11218-5-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468935742-11218-5-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Wilson Ding <dingwei-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hua Jing <jinghua-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Terry Zhou <bjzhou-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/19, Gregory CLEMENT wrote:
> These clocks are children of the xtal clock and each one can be selected
> as a source for the peripheral clocks.
> 
> According to the datasheet it should be possible to modify their rate,
> but currently it is not supported.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---

Applied to clk-next + the following squashed in

diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index 2063ba7d5cb1..aa80db11f543 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -46,14 +46,14 @@ struct tbg_def {
 	u32 vcodiv_offset;
 };
 
-const struct tbg_def tbg[NUM_TBG] = {
+static const struct tbg_def tbg[NUM_TBG] = {
 	{"TBG-A-P", TBG_A_REFDIV, TBG_A_FBDIV, TBG_CTRL8, TBG_A_VCODIV_DIFF},
 	{"TBG-B-P", TBG_B_REFDIV, TBG_B_FBDIV, TBG_CTRL8, TBG_B_VCODIV_DIFF},
 	{"TBG-A-S", TBG_A_REFDIV, TBG_A_FBDIV, TBG_CTRL1, TBG_A_VCODIV_SE},
 	{"TBG-B-S", TBG_B_REFDIV, TBG_B_FBDIV, TBG_CTRL1, TBG_B_VCODIV_SE},
 };
 
-unsigned int tbg_get_mult(void __iomem *reg, const struct tbg_def *ptbg)
+static unsigned int tbg_get_mult(void __iomem *reg, const struct tbg_def *ptbg)
 {
 	u32 val;
 
@@ -62,7 +62,7 @@ unsigned int tbg_get_mult(void __iomem *reg, const struct tbg_def *ptbg)
 	return ((val >> ptbg->fbdiv_offset) & TBG_DIV_MASK) << 2;
 }
 
-unsigned int tbg_get_div(void __iomem *reg, const struct tbg_def *ptbg)
+static unsigned int tbg_get_div(void __iomem *reg, const struct tbg_def *ptbg)
 {
 	u32 val;
 	unsigned int div;
@@ -99,7 +99,7 @@ static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
 	hw_tbg_data->num = NUM_TBG;
 	platform_set_drvdata(pdev, hw_tbg_data);
 
-	parent = devm_clk_get(dev, 0);
+	parent = devm_clk_get(dev, NULL);
 	if (IS_ERR(parent)) {
 		dev_err(dev, "Could get the clock parent\n");
 		return -EINVAL;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
