From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6sl: add ocram driver support
Date: Tue, 7 Jan 2014 21:53:34 +0800
Message-ID: <20140107135332.GK12346@S2101-09.ap.freescale.net>
References: <1389041857-18512-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389041857-18512-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 06, 2014 at 03:57:37PM -0500, Anson Huang wrote:
> Add ocram driver support on i.MX6SL.

s/driver/device, both commit log and patch subject.

> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6sl.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
> index b526118..575e222 100644
> --- a/arch/arm/boot/dts/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/imx6sl.dtsi
> @@ -532,6 +532,12 @@
>  				interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  
> +			ocram: sram@00900000 {
> +				compatible = "mmio-sram";
> +				reg = <0x00900000 0x20000>;
> +				clocks = <&clks IMX6SL_CLK_OCRAM>;
> +			};
> +

When a node is named in form of name@num, we should sort the node in num
order.  That said, the node should be added before l2-cache@00a02000
rather than here.

I fixed them all up, and applied the patch.

Shawn

>  			src: src@020d8000 {
>  				compatible = "fsl,imx6sl-src", "fsl,imx51-src";
>  				reg = <0x020d8000 0x4000>;
> -- 
> 1.7.9.5
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
