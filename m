From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] USB: ehci-platform: support EHCIs with transaction
 translator
Date: Mon, 18 May 2015 10:27:30 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1505181011080.1579-100000@iolanthe.rowland.org>
References: <1431789460-26831-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431789460-26831-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 16 May 2015, Joachim Eastwood wrote:

> Some EHCI controllers have a Transaction Translator built into
> the root hub. Support this feature in device tree when using
> the ehci-platform driver by adding a feature flag for it.
> 
> This is needed to get USB working on NXP LPC18xx/43xx platforms.
> 
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/usb/usb-ehci.txt | 2 ++
>  drivers/usb/host/ehci-platform.c                   | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> index 0b04fdff9d5a..a12d6012a40f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> @@ -13,6 +13,8 @@ Optional properties:
>   - big-endian-desc : boolean, set this for hcds with big-endian descriptors
>   - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
>   - needs-reset-on-resume : boolean, set this to force EHCI reset after resume
> + - has-transaction-translator : boolean, set this if EHCI have a Transaction
> +				Translator built into the root hub.
>   - clocks : a list of phandle + clock specifier pairs
>   - phys : phandle + phy specifier pair
>   - phy-names : "usb"
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index d8a75a51d6d4..ba07f16b13e0 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -202,6 +202,10 @@ static int ehci_platform_probe(struct platform_device *dev)
>  					  "needs-reset-on-resume"))
>  			pdata->reset_on_resume = 1;
>  
> +		if (of_property_read_bool(dev->dev.of_node,
> +					  "has-transaction-translator"))
> +			pdata->has_tt = 1;
> +
>  		priv->num_phys = of_count_phandle_with_args(dev->dev.of_node,
>  				"phys", "#phy-cells");
>  		priv->num_phys = priv->num_phys > 0 ? priv->num_phys : 1;

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
