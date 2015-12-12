From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/4] Documentation: add the binding file for Freescale
 imx7d ADC driver
Date: Sat, 12 Dec 2015 16:26:04 +0000
Message-ID: <566C4A9C.3060903@kernel.org>
References: <1449570383-25716-1-git-send-email-haibo.chen@freescale.com>
 <1449570383-25716-3-git-send-email-haibo.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449570383-25716-3-git-send-email-haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/15 10:26, Haibo Chen wrote:
> The patch adds the binding file for Freescale imx7d ADC driver.
> 
> Signed-off-by: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied 
> ---
>  .../devicetree/bindings/iio/adc/imx7d-adc.txt      | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> new file mode 100644
> index 0000000..5c184b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> @@ -0,0 +1,22 @@
> +Freescale imx7d ADC bindings
> +
> +The devicetree bindings are for the ADC driver written for
> +imx7d SoC.
> +
> +Required properties:
> +- compatible: Should be "fsl,imx7d-adc"
> +- reg: Offset and length of the register set for the ADC device
> +- interrupts: The interrupt number for the ADC device
> +- clocks: The root clock of the ADC controller
> +- clock-names: Must contain "adc", matching entry in the clocks property
> +- vref-supply: The regulator supply ADC reference voltage
> +
> +Example:
> +adc1: adc@30610000 {
> +	compatible = "fsl,imx7d-adc";
> +	reg = <0x30610000 0x10000>;
> +	interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clks IMX7D_ADC_ROOT_CLK>;
> +	clock-names = "adc";
> +	vref-supply = <&reg_vcc_3v3_mcu>;
> +};
> 
