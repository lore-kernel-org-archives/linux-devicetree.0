From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6dl: disable dma support for spi on
 i.mx6dl
Date: Mon, 15 Sep 2014 11:41:13 +0200
Message-ID: <1410774073.3314.1.camel@pengutronix.de>
References: <1410327012-31185-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410327012-31185-1-git-send-email-b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 10.09.2014, 13:30 +0800 schrieb Robin Gong:
> There is one weird data in rxfifo after one full rx/tx transfer
> done sometimes. It looks a design issue and hard to workaround
> totally, so disable dma functhion here. And will re-enable it
> once the root cause found.
> 
Sorry, I'm late to this as Shawn seems to already have picked up this
patch, but this isn't the right way to fix the problem.

We made it clear at kernel summit last year that we try to not break
existing DTs as booting a new kernel with an old DT is a valid use case.
While you don't strictly violate this rule what you do here is only
fixing systems booting with a new DT while leaving others broken.

If you are working around a hardware problem please disable DMA support
in the driver. This will also allow you to enable it again, if you find
another workaround without touching the DT again.

So this patch gets a NAK from me.

> Signed-off-by: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q.dtsi   | 20 ++++++++++++++++++++
>  arch/arm/boot/dts/imx6qdl.dtsi |  8 --------
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index e9f3646..8d5d33b 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -291,6 +291,26 @@
>  	};
>  };
>  
> +&ecspi1 {
> +	dmas = <&sdma 3 7 1>, <&sdma 4 7 2>;
> +	dma-names = "rx", "tx";
> +};
> +
> +&ecspi2 {
> +	dmas = <&sdma 5 7 1>, <&sdma 6 7 2>;
> +	dma-names = "rx", "tx";
> +};
> +
> +&ecspi3 {
> +	dmas = <&sdma 7 7 1>, <&sdma 8 7 2>;
> +	dma-names = "rx", "tx";
> +};
> +
> +&ecspi4 {
> +	dmas = <&sdma 9 7 1>, <&sdma 10 7 2>;
> +	dma-names = "rx", "tx";
> +};
> +
>  &mipi_dsi {
>  	port@2 {
>  		reg = <2>;
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 70d7207..f696546 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -210,8 +210,6 @@
>  					clocks = <&clks IMX6QDL_CLK_ECSPI1>,
>  						 <&clks IMX6QDL_CLK_ECSPI1>;
>  					clock-names = "ipg", "per";
> -					dmas = <&sdma 3 7 1>, <&sdma 4 7 2>;
> -					dma-names = "rx", "tx";
>  					status = "disabled";
>  				};
>  
> @@ -224,8 +222,6 @@
>  					clocks = <&clks IMX6QDL_CLK_ECSPI2>,
>  						 <&clks IMX6QDL_CLK_ECSPI2>;
>  					clock-names = "ipg", "per";
> -					dmas = <&sdma 5 7 1>, <&sdma 6 7 2>;
> -					dma-names = "rx", "tx";
>  					status = "disabled";
>  				};
>  
> @@ -238,8 +234,6 @@
>  					clocks = <&clks IMX6QDL_CLK_ECSPI3>,
>  						 <&clks IMX6QDL_CLK_ECSPI3>;
>  					clock-names = "ipg", "per";
> -					dmas = <&sdma 7 7 1>, <&sdma 8 7 2>;
> -					dma-names = "rx", "tx";
>  					status = "disabled";
>  				};
>  
> @@ -252,8 +246,6 @@
>  					clocks = <&clks IMX6QDL_CLK_ECSPI4>,
>  						 <&clks IMX6QDL_CLK_ECSPI4>;
>  					clock-names = "ipg", "per";
> -					dmas = <&sdma 9 7 1>, <&sdma 10 7 2>;
> -					dma-names = "rx", "tx";
>  					status = "disabled";
>  				};
>  

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
