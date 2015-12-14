From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ehci-platform: Add support for
 controllers with multiple reset lines
Date: Sun, 13 Dec 2015 19:09:38 -0600
Message-ID: <20151214010938.GA2984@rob-hp-laptop>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
 <1449848520-27379-2-git-send-email-hdegoede@redhat.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBWFNXCZQKGQEKDDZR2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449848520-27379-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 04:41:59PM +0100, Hans de Goede wrote:
> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> 
> At least the EHCI/OHCI found on the Allwinnner H3 SoC needs multiple
> reset lines, the controller will not initialize while the reset for
> its companion is still asserted, which means we need to de-assert
> 2 resets for the controller to work.
> 
> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Changes in v2:
> -Use the new reset_control_[de]assert_shared reset-controller functions
> ---
>  Documentation/devicetree/bindings/usb/usb-ehci.txt |  2 +-
>  drivers/usb/host/ehci-platform.c                   | 47 +++++++++++++---------
>  2 files changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> index a12d601..0701812 100644
> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> @@ -18,7 +18,7 @@ Optional properties:
>   - clocks : a list of phandle + clock specifier pairs
>   - phys : phandle + phy specifier pair
>   - phy-names : "usb"
> - - resets : phandle + reset specifier pair
> + - resets : a list of phandle + reset specifier pairs
>  
>  Example (Sequoia 440EPx):
>      ehci@e0000300 {
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index bd7082f2..6fbf32a 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -39,11 +39,12 @@
>  
>  #define DRIVER_DESC "EHCI generic platform driver"
>  #define EHCI_MAX_CLKS 3
> +#define EHCI_MAX_RESETS 2
>  #define hcd_to_ehci_priv(h) ((struct ehci_platform_priv *)hcd_to_ehci(h)->priv)
>  
>  struct ehci_platform_priv {
>  	struct clk *clks[EHCI_MAX_CLKS];
> -	struct reset_control *rst;
> +	struct reset_control *resets[EHCI_MAX_RESETS];
>  	struct phy **phys;
>  	int num_phys;
>  	bool reset_on_resume;
> @@ -149,7 +150,7 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
>  	struct ehci_platform_priv *priv;
>  	struct ehci_hcd *ehci;
> -	int err, irq, phy_num, clk = 0;
> +	int err, irq, phy_num, clk = 0, rst = 0;
>  
>  	if (usb_disabled())
>  		return -ENODEV;
> @@ -232,18 +233,24 @@ static int ehci_platform_probe(struct platform_device *dev)
>  				break;
>  			}
>  		}
> -	}
>  
> -	priv->rst = devm_reset_control_get_optional(&dev->dev, NULL);
> -	if (IS_ERR(priv->rst)) {
> -		err = PTR_ERR(priv->rst);
> -		if (err == -EPROBE_DEFER)
> -			goto err_put_clks;
> -		priv->rst = NULL;
> -	} else {
> -		err = reset_control_deassert(priv->rst);
> -		if (err)
> -			goto err_put_clks;
> +		for (rst = 0; rst < EHCI_MAX_RESETS; rst++) {
> +			priv->resets[rst] =
> +				of_reset_control_get_by_index(dev->dev.of_node,
> +							      rst);
> +			if (IS_ERR(priv->resets[rst])) {
> +				err = PTR_ERR(priv->resets[rst]);
> +				if (err == -EPROBE_DEFER)
> +					goto err_reset;
> +				priv->resets[rst] = NULL;
> +				break;
> +			}
> +			err = reset_control_deassert_shared(priv->resets[rst]);
> +			if (err) {
> +				reset_control_put(priv->resets[rst]);
> +				goto err_reset;
> +			}
> +		}
>  	}
>  
>  	if (pdata->big_endian_desc)
> @@ -300,8 +307,10 @@ err_power:
>  	if (pdata->power_off)
>  		pdata->power_off(dev);
>  err_reset:
> -	if (priv->rst)
> -		reset_control_assert(priv->rst);
> +	while (--rst >= 0) {
> +		reset_control_assert_shared(priv->resets[rst]);
> +		reset_control_put(priv->resets[rst]);
> +	}
>  err_put_clks:
>  	while (--clk >= 0)
>  		clk_put(priv->clks[clk]);
> @@ -319,15 +328,17 @@ static int ehci_platform_remove(struct platform_device *dev)
>  	struct usb_hcd *hcd = platform_get_drvdata(dev);
>  	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
>  	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
> -	int clk;
> +	int clk, rst;
>  
>  	usb_remove_hcd(hcd);
>  
>  	if (pdata->power_off)
>  		pdata->power_off(dev);
>  
> -	if (priv->rst)
> -		reset_control_assert(priv->rst);
> +	for (rst = 0; rst < EHCI_MAX_RESETS && priv->resets[rst]; rst++) {
> +		reset_control_assert_shared(priv->resets[rst]);
> +		reset_control_put(priv->resets[rst]);
> +	}
>  
>  	for (clk = 0; clk < EHCI_MAX_CLKS && priv->clks[clk]; clk++)
>  		clk_put(priv->clks[clk]);
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
