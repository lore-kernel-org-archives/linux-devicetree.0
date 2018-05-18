From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 12/26] drm/sun4i: Add support for
 multiple DW HDMI PHY clock parents
Date: Fri, 18 May 2018 12:01:16 +0200
Message-ID: <20180518100116.4bf2qcffg7ekxa7u@flea>
References: <20180518094536.17201-1-jagan@amarulasolutions.com>
 <20180518094536.17201-13-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zoqlobbnga5srfsy"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6GI7LLQKGQE3WDKFYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180518094536.17201-13-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zoqlobbnga5srfsy
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, May 18, 2018 at 03:15:22PM +0530, Jagan Teki wrote:
> From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> 
> Some SoCs with DW HDMI have multiple possible clock parents, like A64
> and R40.
> 
> Expand HDMI PHY clock driver to support second clock parent.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v2:
> - new patch
> 
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h      |  9 ++-
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c     | 33 ++++++++---
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c | 89 ++++++++++++++++++++++--------
>  3 files changed, 96 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> index 79154f0f674a..303189d6602c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -98,7 +98,8 @@
>  #define SUN8I_HDMI_PHY_PLL_CFG1_LDO2_EN		BIT(29)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_LDO1_EN		BIT(28)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_HV_IS_33	BIT(27)
> -#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL	BIT(26)
> +#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK	BIT(26)
> +#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_SHIFT	26
>  #define SUN8I_HDMI_PHY_PLL_CFG1_PLLEN		BIT(25)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_LDO_VSET(x)	((x) << 22)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_UNKNOWN(x)	((x) << 20)
> @@ -146,7 +147,7 @@
>  struct sun8i_hdmi_phy;
>  
>  struct sun8i_hdmi_phy_variant {
> -	bool has_phy_clk;
> +	int  phy_clk_num;
>  	void (*phy_init)(struct sun8i_hdmi_phy *phy);
>  	void (*phy_disable)(struct dw_hdmi *hdmi,
>  			    struct sun8i_hdmi_phy *phy);
> @@ -160,6 +161,7 @@ struct sun8i_hdmi_phy {
>  	struct clk			*clk_mod;
>  	struct clk			*clk_phy;
>  	struct clk			*clk_pll0;
> +	struct clk			*clk_pll1;
>  	unsigned int			rcal;
>  	struct regmap			*regs;
>  	struct reset_control		*rst_phy;
> @@ -188,6 +190,7 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi);
>  void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
>  const struct dw_hdmi_phy_ops *sun8i_hdmi_phy_get_ops(void);
>  
> -int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev);
> +int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
> +			 int clk_num);
>  
>  #endif /* _SUN8I_DW_HDMI_H_ */
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index 5a52fc489a9d..0eadf087fc46 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -183,7 +183,13 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hdmi *hdmi,
>  	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG,
>  			   SUN8I_HDMI_PHY_ANA_CFG1_TXEN_MASK, 0);
>  
> -	regmap_write(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, pll_cfg1_init);
> +	/*
> +	 * NOTE: We have to be careful not to overwrite PHY parent
> +	 * clock selection bit and clock divider.
> +	 */
> +	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG,
> +			   (u32)~SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK,
> +			   pll_cfg1_init);
>  	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_PLL_CFG2_REG,
>  			   (u32)~SUN8I_HDMI_PHY_PLL_CFG2_PREDIV_MSK,
>  			   pll_cfg2_init);
> @@ -232,7 +238,7 @@ static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
>  	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
>  			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK, val);
>  
> -	if (phy->variant->has_phy_clk)
> +	if (phy->variant->phy_clk_num)
>  		clk_set_rate(phy->clk_phy, mode->crtc_clock * 1000);
>  
>  	return phy->variant->phy_config(hdmi, phy, mode->crtc_clock * 1000);
> @@ -393,7 +399,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
>  };
>  
>  static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy = {
> -	.has_phy_clk = true,
> +	.phy_clk_num = 1,
>  	.phy_init = &sun8i_hdmi_phy_init_h3,
>  	.phy_disable = &sun8i_hdmi_phy_disable_h3,
>  	.phy_config = &sun8i_hdmi_phy_config_h3,
> @@ -464,7 +470,7 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>  		goto err_put_clk_bus;
>  	}
>  
> -	if (phy->variant->has_phy_clk) {
> +	if (phy->variant->phy_clk_num) {
>  		phy->clk_pll0 = of_clk_get_by_name(node, "pll-0");
>  		if (IS_ERR(phy->clk_pll0)) {
>  			dev_err(dev, "Could not get pll-0 clock\n");
> @@ -472,7 +478,16 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>  			goto err_put_clk_mod;
>  		}
>  
> -		ret = sun8i_phy_clk_create(phy, dev);
> +		if (phy->variant->phy_clk_num) {
> +			phy->clk_pll1 = of_clk_get_by_name(node, "pll-1");
> +			if (IS_ERR(phy->clk_pll1)) {
> +				dev_err(dev, "Could not get pll-1 clock\n");
> +				ret = PTR_ERR(phy->clk_pll1);
> +				goto err_put_clk_mod;
> +			}
> +		}
> +

You have a bug here. If phy_clk_num == 1, you'll still try to lookup
pll-1.

And this is a bit sloppy, since if phy_clk_num == 3, you won't try to
lookup pll-2 either.

> +		ret = sun8i_phy_clk_create(phy, dev, phy->variant->phy_clk_num);
>  		if (ret) {
>  			dev_err(dev, "Couldn't create the PHY clock\n");
>  			goto err_put_clk_pll0;
> @@ -515,8 +530,8 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>  err_put_rst_phy:
>  	reset_control_put(phy->rst_phy);
>  err_put_clk_pll0:
> -	if (phy->variant->has_phy_clk)
> -		clk_put(phy->clk_pll0);
> +	clk_put(phy->clk_pll0);
> +	clk_put(phy->clk_pll1);
>  err_put_clk_mod:
>  	clk_put(phy->clk_mod);
>  err_put_clk_bus:
> @@ -536,8 +551,8 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
>  
>  	reset_control_put(phy->rst_phy);
>  
> -	if (phy->variant->has_phy_clk)
> -		clk_put(phy->clk_pll0);
> +	clk_put(phy->clk_pll0);
> +	clk_put(phy->clk_pll1);
>  	clk_put(phy->clk_mod);
>  	clk_put(phy->clk_bus);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> index faea449812f8..85b12fc96dbc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> @@ -22,29 +22,36 @@ static int sun8i_phy_clk_determine_rate(struct clk_hw *hw,
>  {
>  	unsigned long rate = req->rate;
>  	unsigned long best_rate = 0;
> -	struct clk_hw *parent;
> +	struct clk_hw *best_parent = NULL;
> +	struct clk_hw *parent = NULL;
>  	int best_div = 1;
> -	int i;
> +	int i, p;
>  
> -	parent = clk_hw_get_parent(hw);
> -
> -	for (i = 1; i <= 16; i++) {
> -		unsigned long ideal = rate * i;
> -		unsigned long rounded;
> -
> -		rounded = clk_hw_round_rate(parent, ideal);
> -
> -		if (rounded == ideal) {
> -			best_rate = rounded;
> -			best_div = i;
> -			break;
> -		}
> +	for (p = 0; p < clk_hw_get_num_parents(hw); p++) {
> +		parent = clk_hw_get_parent_by_index(hw, p);
> +		if (!parent)
> +			continue;
>  
> -		if (!best_rate ||
> -		    abs(rate - rounded / i) <
> -		    abs(rate - best_rate / best_div)) {
> -			best_rate = rounded;
> -			best_div = i;
> +		for (i = 1; i <= 16; i++) {
> +			unsigned long ideal = rate * i;
> +			unsigned long rounded;
> +
> +			rounded = clk_hw_round_rate(parent, ideal);
> +
> +			if (rounded == ideal) {
> +				best_rate = rounded;
> +				best_div = i;
> +				best_parent = parent;
> +				break;
> +			}
> +
> +			if (!best_rate ||
> +			    abs(rate - rounded / i) <
> +			    abs(rate - best_rate / best_div)) {
> +				best_rate = rounded;
> +				best_div = i;
> +				best_parent = parent;
> +			}
>  		}
>  	}
>  
> @@ -95,22 +102,58 @@ static int sun8i_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return 0;
>  }
>  
> +static u8 sun8i_phy_clk_get_parent(struct clk_hw *hw)
> +{
> +	struct sun8i_phy_clk *priv = hw_to_phy_clk(hw);
> +	u32 reg;
> +
> +	regmap_read(priv->phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, &reg);
> +	reg = (reg & SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK) >>
> +	      SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_SHIFT;
> +
> +	return reg;
> +}
> +
> +static int sun8i_phy_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct sun8i_phy_clk *priv = hw_to_phy_clk(hw);
> +
> +	if (index > 1)
> +		return -EINVAL;
> +
> +	regmap_update_bits(priv->phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG,
> +			   SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK,
> +			   index << SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_SHIFT);
> +
> +	return 0;
> +}
> +

The DT bindings changes and the clk changes should be part of separate
patches.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--zoqlobbnga5srfsy--
