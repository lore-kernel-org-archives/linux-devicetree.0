From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: at91/dt: add rm9200 spi0 chip select pins
 definitions
Date: Wed, 20 Nov 2013 15:56:09 +0100
Message-ID: <20131120145609.GC14627@ns203013.ovh.net>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
 <1377687742-10618-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377687742-10618-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13:02 Wed 28 Aug     , Boris BREZILLON wrote:
> Add spi0 cs pinctrl pins definitions.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91rm9200.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
> index f770655..69b76c7 100644
> --- a/arch/arm/boot/dts/at91rm9200.dtsi
> +++ b/arch/arm/boot/dts/at91rm9200.dtsi
> @@ -486,6 +486,26 @@
>  							 AT91_PIOA 1 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PA1 periph A SPI0_MOSI pin */
>  							 AT91_PIOA 2 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA2 periph A SPI0_SPCK pin */
>  					};
> +
> +					pinctrl_spi0_cs0: spi0_cs0-0 {
> +						atmel,pins =
> +							<AT91_PIOA 3 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA3 periph A SPI0_NPCS0 pin */
> +					};
> +
> +					pinctrl_spi0_cs1: spi0_cs1-0 {
> +						atmel,pins =
> +							<AT91_PIOA 4 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;	/* PA4 GPIO SPI0_NPCS1 pin */
> +					};
> +
> +					pinctrl_spi0_cs2: spi0_cs2-0 {
> +						atmel,pins =
> +							<AT91_PIOA 5 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;	/* PA5 GPIO SPI0_NPCS2 pin */
> +					};
> +
> +					pinctrl_spi0_cs3: spi0_cs3-0 {
> +						atmel,pins =
> +							<AT91_PIOA 6 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;	/* PA6 GPIO SPI0_NPCS3 pin */
> +					};
nack the pin are not multidrive there is only one master

Best Regards,
J.
>  				};
>  
>  				pioA: gpio@fffff400 {
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
