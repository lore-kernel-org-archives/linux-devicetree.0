From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: i.MX25: add AIPS control registers
Date: Wed, 1 Feb 2017 08:09:37 +0100
Message-ID: <20170201070937.pcblnpebxb65llto@pengutronix.de>
References: <1485890402-22974-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485890402-22974-1-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 08:20:01PM +0100, Martin Kaiser wrote:
> The i.MX25 contains two AHB to IP bridges (AIPS), each of which has a set of
> control registers. Add the memory regions for the control registers to
> the Device Tree.
> 
> All the registers from the i.MX53 AIPSTZ are present on the i.MX25 as
> well. Indicate that we are compatible to fsl,imx53-aipstz. However,
> don't use aipstz for our name, this seems to be specific to i.MX53.
> 
> Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx25.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
> index e0ba550..4c4768f 100644
> --- a/arch/arm/boot/dts/imx25.dtsi
> +++ b/arch/arm/boot/dts/imx25.dtsi
> @@ -93,6 +93,11 @@
>  			reg = <0x43f00000 0x100000>;
>  			ranges;
>  
> +			aips1: bridge@43f00000 {
> +				compatible = "fsl,imx25-aips", "fsl,imx53-aipstz";
> +				reg = <0x43f00000 0x60>;
> +			};

The additional compatible properties should indicate if there is an
older ip block this one is compatible to. Since i.MX53 is newer than
i.MX25 this goes into the wrong direction. If anything you could add the
"fsl,imx25-aips" compatible to the i.MX53 dtsi file, but I don't think
that's worth it.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
