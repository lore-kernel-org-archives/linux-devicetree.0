From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 20/27] drm/sun4i: Don't change clock bits
 in DW HDMI PHY driver
Date: Fri, 15 Jun 2018 18:44:33 +0200
Message-ID: <8789732.RJMkczUIGD@jernej-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <20180612200036.21483-21-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBNG2R7MQKGQEES3BCSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180612200036.21483-21-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne torek, 12. junij 2018 ob 22:00:29 CEST je Jernej Skrabec napisal(a):
> DW HDMI PHY driver and PHY clock driver share same registers. Make sure
> that DW HDMI PHY setup code doesn't change any clock related bits and
> set them to 0 during initialization.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h index 79154f0f674a..3ba71aff92fc
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -98,7 +98,7 @@
>  #define SUN8I_HDMI_PHY_PLL_CFG1_LDO2_EN		BIT(29)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_LDO1_EN		BIT(28)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_HV_IS_33	BIT(27)
> -#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL	BIT(26)
> +#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK	BIT(26)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_PLLEN		BIT(25)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_LDO_VSET(x)	((x) << 22)
>  #define SUN8I_HDMI_PHY_PLL_CFG1_UNKNOWN(x)	((x) << 20)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c index 966688f04741..cd07ceb71601
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -183,7 +183,13 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hdmi
> *hdmi, regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG,
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
> @@ -352,6 +358,10 @@ static void sun8i_hdmi_phy_init_h3(struct
> sun8i_hdmi_phy *phy) SUN8I_HDMI_PHY_ANA_CFG3_SCLEN |
>  			   SUN8I_HDMI_PHY_ANA_CFG3_SDAEN);
> 
> +	/* reset PLL clock configuration */
> +	regmap_write(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, 0);
> +	regmap_write(phy->regs, SUN8I_HDMI_PHY_PLL_CFG2_REG, 0);
> +

For some reason, this change breaks HDMI on H3. Clearing only PLL parent 
selection bit works ok, though. I'll fix it in next revision.

Best regards,
Jernej

>  	/* set HW control of CEC pins */
>  	regmap_write(phy->regs, SUN8I_HDMI_PHY_CEC_REG, 0);
