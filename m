From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: imx7d.dtsi: add ADC support
Date: Sat, 12 Dec 2015 16:27:40 +0000
Message-ID: <566C4AFC.9060500@kernel.org>
References: <1449570383-25716-1-git-send-email-haibo.chen@freescale.com>
 <1449570383-25716-4-git-send-email-haibo.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449570383-25716-4-git-send-email-haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/15 10:26, Haibo Chen wrote:
> Add imx7d ADC support.
> 
> Signed-off-by: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
The driver is now working its way in the direction of linux-next via
Greg KHs tree. I'm happy to take these changes as well, but would imagine
they are better routed through the relevant imx trees.

Jonathan
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index ebc053a..aa0624d 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -583,6 +583,24 @@
>  			reg = <0x30400000 0x400000>;
>  			ranges;
>  
> +			adc1: adc@30610000 {
> +				compatible = "fsl,imx7d-adc";
> +				reg = <0x30610000 0x10000>;
> +				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_ADC_ROOT_CLK>;
> +				clock-names = "adc";
> +				status = "disabled";
> +			};
> +
> +			adc2: adc@30620000 {
> +				compatible = "fsl,imx7d-adc";
> +				reg = <0x30620000 0x10000>;
> +				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_ADC_ROOT_CLK>;
> +				clock-names = "adc";
> +				status = "disabled";
> +			};
> +
>  			pwm1: pwm@30660000 {
>  				compatible = "fsl,imx7d-pwm", "fsl,imx27-pwm";
>  				reg = <0x30660000 0x10000>;
> 
