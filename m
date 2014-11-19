From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: at91/dt: add ISI node
Date: Wed, 19 Nov 2014 16:51:07 +0100
Message-ID: <546CBC6B.2040408@atmel.com>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com> <1412093987-30241-7-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412093987-30241-7-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30/09/2014 18:19, Boris Brezillon :
> Add ISI (Image Sensor Interface) DT node.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

I take this one for at91-3.19-dt2

Thanks, best regards.

> ---
>  arch/arm/boot/dts/at91sam9g45.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
> index 790c890..5d8746a 100644
> --- a/arch/arm/boot/dts/at91sam9g45.dtsi
> +++ b/arch/arm/boot/dts/at91sam9g45.dtsi
> @@ -804,6 +804,27 @@
>  					};
>  				};
>  
> +				isi {
> +					pinctrl_isi: isi-0 {
> +						atmel,pins = <AT91_PIOB 8 AT91_PERIPH_B AT91_PINCTRL_NONE /* D8 */
> +							      AT91_PIOB 9 AT91_PERIPH_B AT91_PINCTRL_NONE /* D9 */
> +							      AT91_PIOB 10 AT91_PERIPH_B AT91_PINCTRL_NONE /* D10 */
> +							      AT91_PIOB 11 AT91_PERIPH_B AT91_PINCTRL_NONE /* D11 */
> +							      AT91_PIOB 20 AT91_PERIPH_A AT91_PINCTRL_NONE /* D0 */
> +							      AT91_PIOB 21 AT91_PERIPH_A AT91_PINCTRL_NONE /* D1 */
> +							      AT91_PIOB 22 AT91_PERIPH_A AT91_PINCTRL_NONE /* D2 */
> +							      AT91_PIOB 23 AT91_PERIPH_A AT91_PINCTRL_NONE /* D3 */
> +							      AT91_PIOB 24 AT91_PERIPH_A AT91_PINCTRL_NONE /* D4 */
> +							      AT91_PIOB 25 AT91_PERIPH_A AT91_PINCTRL_NONE /* D5 */
> +							      AT91_PIOB 26 AT91_PERIPH_A AT91_PINCTRL_NONE /* D6 */
> +							      AT91_PIOB 27 AT91_PERIPH_A AT91_PINCTRL_NONE /* D7 */
> +							      AT91_PIOB 28 AT91_PERIPH_A AT91_PINCTRL_NONE /* PCK */
> +							      AT91_PIOB 29 AT91_PERIPH_A AT91_PINCTRL_NONE /* VSYNC */
> +							      AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE /* HSYNC */
> +							      AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_NONE /* MCK */>;
> +					};
> +				};
> +
>  				pioA: gpio@fffff200 {
>  					compatible = "atmel,at91rm9200-gpio";
>  					reg = <0xfffff200 0x200>;
> @@ -1029,6 +1050,17 @@
>  				};
>  			};
>  
> +			isi@fffb4000 {
> +				compatible = "atmel,at91sam9g45-isi";
> +				reg = <0xfffb4000 0x4000>;
> +				interrupts = <26 IRQ_TYPE_LEVEL_HIGH 5>;
> +				clocks = <&isi_clk>;
> +				clock-names = "isi_clk";
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_isi>;
> +				status = "disabled";
> +			};
> +
>  			pwm0: pwm@fffb8000 {
>  				compatible = "atmel,at91sam9rl-pwm";
>  				reg = <0xfffb8000 0x300>;
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
