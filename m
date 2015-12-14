From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] phy-sun4i-usb: Add support for the host usb-phys
 found on the H3 SoC
Date: Sun, 13 Dec 2015 19:08:29 -0600
Message-ID: <20151214010829.GA1721@rob-hp-laptop>
References: <1449847938-20836-1-git-send-email-hdegoede@redhat.com>
 <1449847938-20836-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449847938-20836-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "Reinder E.N. de Haan" <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 04:32:18PM +0100, Hans de Goede wrote:
> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> 
> Note this commit only adds support for phys 1-3, phy 0, the otg phy, is
> not yet (fully) supported after this commit.
> 
> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Changes in v2:
> -Change break; after dev_err() to return, as intended, fixing a compiler
>  warning (the dev_err case should never be reached)
> Changes in v3:
> -Use of_match_node to get model specific config data
> Changes in v4:
> -Adjust to v4 of "Use of_match_node to get model specific config data" patch
> ---
>  .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  1 +
>  drivers/phy/phy-sun4i-usb.c                        | 41 +++++++++++++++++-----
>  2 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 0cebf74..95736d7 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -9,6 +9,7 @@ Required properties:
>    * allwinner,sun7i-a20-usb-phy
>    * allwinner,sun8i-a23-usb-phy
>    * allwinner,sun8i-a33-usb-phy
> +  * allwinner,sun8i-h3-usb-phy
>  - reg : a list of offset + length pairs
>  - reg-names :
>    * "phy_ctrl"
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index 35b1fa3..bae54f7 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -47,6 +47,9 @@
>  #define REG_PHYBIST			0x08
>  #define REG_PHYTUNE			0x0c
>  #define REG_PHYCTL_A33			0x10
> +#define REG_PHY_UNK_H3			0x20
> +
> +#define REG_PMU_UNK_H3			0x10
>  
>  #define PHYCTL_DATA			BIT(7)
>  
> @@ -80,7 +83,7 @@
>  #define PHY_DISCON_TH_SEL		0x2a
>  #define PHY_SQUELCH_DETECT		0x3c
>  
> -#define MAX_PHYS			3
> +#define MAX_PHYS			4
>  
>  /*
>   * Note do not raise the debounce time, we must report Vusb high within 100ms
> @@ -92,6 +95,7 @@
>  enum sun4i_usb_phy_type {
>  	sun4i_a10_phy,
>  	sun8i_a33_phy,
> +	sun8i_h3_phy,
>  };
>  
>  struct sun4i_usb_phy_cfg {
> @@ -239,6 +243,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
>  	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
>  	int ret;
> +	u32 val;
>  
>  	ret = clk_prepare_enable(phy->clk);
>  	if (ret)
> @@ -250,16 +255,26 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  		return ret;
>  	}
>  
> -	/* Enable USB 45 Ohm resistor calibration */
> -	if (phy->index == 0)
> -		sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
> +	if (data->cfg->type == sun8i_h3_phy) {
> +		if (phy->index == 0) {
> +			val = readl(data->base + REG_PHY_UNK_H3);
> +			writel(val & ~1, data->base + REG_PHY_UNK_H3);
> +		}
> +
> +		val = readl(phy->pmu + REG_PMU_UNK_H3);
> +		writel(val & ~2, phy->pmu + REG_PMU_UNK_H3);
> +	} else {
> +		/* Enable USB 45 Ohm resistor calibration */
> +		if (phy->index == 0)
> +			sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
>  
> -	/* Adjust PHY's magnitude and rate */
> -	sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
> +		/* Adjust PHY's magnitude and rate */
> +		sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
>  
> -	/* Disconnect threshold adjustment */
> -	sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,
> -			    data->cfg->disc_thresh, 2);
> +		/* Disconnect threshold adjustment */
> +		sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,
> +				    data->cfg->disc_thresh, 2);
> +	}
>  
>  	sun4i_usb_phy_passby(phy, 1);
>  
> @@ -726,6 +741,13 @@ static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
>  	.dedicated_clocks = true,
>  };
>  
> +static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
> +	.num_phys = 4,
> +	.type = sun8i_h3_phy,
> +	.disc_thresh = 3,
> +	.dedicated_clocks = true,
> +};
> +
>  static const struct of_device_id sun4i_usb_phy_of_match[] = {
>  	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
>  	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
> @@ -733,6 +755,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
>  	{ .compatible = "allwinner,sun7i-a20-usb-phy", .data = &sun7i_a20_cfg },
>  	{ .compatible = "allwinner,sun8i-a23-usb-phy", .data = &sun8i_a23_cfg },
>  	{ .compatible = "allwinner,sun8i-a33-usb-phy", .data = &sun8i_a33_cfg },
> +	{ .compatible = "allwinner,sun8i-h3-usb-phy", .data = &sun8i_h3_cfg },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
