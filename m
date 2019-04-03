From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] phy: renesas: rcar-gen3-usb2: enable/disable
 independent irqs
Date: Wed, 3 Apr 2019 11:19:39 +0200
Message-ID: <20190403091939.qguys2dftombenpb@verge.net.au>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554120083-29990-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Mon, Apr 01, 2019 at 09:01:23PM +0900, Yoshihiro Shimoda wrote:
> Since the previous code enabled/disabled the irqs both OHCI and EHCI,
> it is possible to cause unexpected interruptions. To avoid this,
> this patch creates multiple phy instances from phandle and
> enables/disables independent irqs by the instances.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I noted a few nits below but overall this looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 181 ++++++++++++++++++++++++++-----
>  1 file changed, 156 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 4bdb2ed..bbe0fe5 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -37,11 +37,8 @@
>  
>  /* INT_ENABLE */
>  #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
> -#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
> -#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
> -#define USB2_INT_ENABLE_INIT		(USB2_INT_ENABLE_UCOM_INTEN | \
> -					 USB2_INT_ENABLE_USBH_INTB_EN | \
> -					 USB2_INT_ENABLE_USBH_INTA_EN)
> +#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)	/* For EHCI */
> +#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)	/* For OHCI */
>  
>  /* USBCTR */
>  #define USB2_USBCTR_DIRPD	BIT(2)
> @@ -78,11 +75,33 @@
>  #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
>  #define USB2_ADPCTRL_DRVVBUS		BIT(4)
>  
> +#define NUM_OF_PHYS			4
> +#define PHY_INDEX_BOTH_HC		0
> +#define PHY_INDEX_OHCI			1
> +#define PHY_INDEX_EHCI			2
> +#define PHY_INDEX_HSUSB			3

nit: I think the above #defines would be better expressed as an enum.

...

> +static struct phy *rcar_gen3_phy_usb2_xlate(struct device *dev,
> +					    struct of_phandle_args *args)
> +{
> +	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> +
> +	if (args->args_count == 0)	/* For old version dts */
> +		return ch->rphys[PHY_INDEX_BOTH_HC].phy;
> +	else if (args->args_count > 1)	/* Prevent invalid args count */
> +		return ERR_PTR(-ENODEV);
> +
> +	if (args->args[0] >= NUM_OF_PHYS)
> +		return ERR_PTR(-ENODEV);
> +
> +	return ch->rphys[args->args[0]].phy;
> +}
> +
> +static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
> +{
> +	enum usb_dr_mode candidate = USB_DR_MODE_UNKNOWN, tmp;

nit: I think that there could be a better name for tmp, f.e. mode
nit: The scope of tmp could be limited to inside the for loop.

> +	int i;
> +
> +	/*
> +	 * If one of device nodes has other dr_mode except UNKNOWN,
> +	 * this function returns UNKNOWN.
> +	 */
> +	for (i = 0; i < NUM_OF_PHYS; i++) {
> +		tmp = of_usb_get_dr_mode_by_phy(np, i);
> +		if (tmp != USB_DR_MODE_UNKNOWN) {
> +			if (candidate == USB_DR_MODE_UNKNOWN)
> +				candidate = tmp;
> +			else if (candidate != tmp)
> +				return USB_DR_MODE_UNKNOWN;
> +		}
> +	}
> +
> +	return candidate;
> +}

...
