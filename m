From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: at91: sama5d3: add DMA property for SSC devices
Date: Fri, 18 Apr 2014 22:47:51 +0200
Message-ID: <53518F77.6020609@atmel.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-2-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395049541-28128-2-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/03/2014 10:45, Bo Shen :
> Add DMA property for SSC devices on SAMA5D3 SoC.
> 
> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> ---
> 
>  arch/arm/boot/dts/sama5d3.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
> index 3d5faf8..3e753e1 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -113,6 +113,9 @@
>  				compatible = "atmel,at91sam9g45-ssc";
>  				reg = <0xf0008000 0x4000>;
>  				interrupts = <38 IRQ_TYPE_LEVEL_HIGH 4>;
> +				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(13)>,
> +				       <&dma0 2 AT91_DMA_CFG_PER_ID(14)>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
>  				clocks = <&ssc0_clk>;
> @@ -231,6 +234,9 @@
>  				compatible = "atmel,at91sam9g45-ssc";
>  				reg = <0xf800c000 0x4000>;
>  				interrupts = <39 IRQ_TYPE_LEVEL_HIGH 4>;
> +				dmas = <&dma1 2 AT91_DMA_CFG_PER_ID(3)>,
> +				       <&dma1 2 AT91_DMA_CFG_PER_ID(4)>;
> +				dma-names = "tx", "rx";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_ssc1_tx &pinctrl_ssc1_rx>;
>  				clocks = <&ssc1_clk>;
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
