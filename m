From: Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dsi: Get PHY ref clock from the
 DT
Date: Mon, 5 Nov 2018 12:33:04 -0500
Message-ID: <20181105173304.GJ154160@art_vandelay>
References: <20181102214534.184593-1-mka@chromium.org>
 <20181102214534.184593-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181102214534.184593-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 02, 2018 at 02:45:34PM -0700, Matthias Kaehlcke wrote:
> Get the PHY ref clock from the device tree instead of hardcoding
> its name and rate.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> index 4c03f0b7343ed..1016eb50df8f5 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> @@ -91,6 +91,8 @@ struct dsi_pll_10nm {
>  	void __iomem *phy_cmn_mmio;
>  	void __iomem *mmio;
>  
> +	struct clk *vco_ref_clk;
> +
>  	u64 vco_ref_clk_rate;
>  	u64 vco_current_rate;
>  
> @@ -630,7 +632,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
>  	char clk_name[32], parent[32], vco_name[32];
>  	char parent2[32], parent3[32], parent4[32];
>  	struct clk_init_data vco_init = {
> -		.parent_names = (const char *[]){ "xo" },
> +		.parent_names = (const char *[]){
> +			__clk_get_name(pll_10nm->vco_ref_clk) },
>  		.num_parents = 1,

You should check the return of __clk_get_name() since you're setting num_parents
to 1. Also, you should revert the patch that hardcodes 19.2MHz as part of this
set.

>  		.name = vco_name,
>  		.flags = CLK_IGNORE_UNUSED,
> @@ -786,6 +789,12 @@ struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
>  	pll_10nm->id = id;
>  	pll_10nm_list[id] = pll_10nm;
>  
> +	pll_10nm->vco_ref_clk = devm_clk_get(&pdev->dev, "ref");
> +	if (IS_ERR(pll_10nm->vco_ref_clk)) {
> +		dev_err(&pdev->dev, "couldn't get 'ref' clock\n");

Please print the error message

> +		return (void *)pll_10nm->vco_ref_clk;

Use ERR_CAST here

> +	}
> +
>  	pll_10nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
>  	if (IS_ERR_OR_NULL(pll_10nm->phy_cmn_mmio)) {
>  		dev_err(&pdev->dev, "failed to map CMN PHY base\n");
> -- 
> 2.19.1.930.g4563a0d9d0-goog
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
Sean Paul, Software Engineer, Google / Chromium OS
