From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 01/11] clk: sunxi: Add display and TCON0
 clocks driver
Date: Mon, 9 May 2016 15:39:24 -0700
Message-ID: <20160509223924.GX3492@codeaurora.org>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
Reply-To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDHZXHXDRAMBBHVDYS4QKGQEFCFGY5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160509223238.GW3492-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/09, Stephen Boyd wrote:
> 
> Ok I applied this one to clk-next.
> 

And I squashed this in to silence the following checker warning.

drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
length array is used.

---8<---
diff --git a/drivers/clk/sunxi/clk-sun4i-display.c b/drivers/clk/sunxi/clk-sun4i-display.c
index f02e250e64ed..f8ff6c4a5633 100644
--- a/drivers/clk/sunxi/clk-sun4i-display.c
+++ b/drivers/clk/sunxi/clk-sun4i-display.c
@@ -107,7 +107,7 @@ static int sun4i_a10_display_reset_xlate(struct reset_controller_dev *rcdev,
 static void __init sun4i_a10_display_init(struct device_node *node,
 					  const struct sun4i_a10_display_clk_data *data)
 {
-	const char *parents[data->parents];
+	const char *parents[4];
 	const char *clk_name = node->name;
 	struct reset_data *reset_data;
 	struct clk_divider *div = NULL;
@@ -126,8 +126,8 @@ static void __init sun4i_a10_display_init(struct device_node *node,
 		return;
 	}
 
-	ret = of_clk_parent_fill(node, parents, data->parents);
-	if (ret != data->parents) {
+	ret = of_clk_parent_fill(node, parents, ARRAY_SIZE(parents));
+	if (ret != ARRAY_SIZE(parents)) {
 		pr_err("%s: Could not retrieve the parents\n", clk_name);
 		goto unmap;
 	}
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
