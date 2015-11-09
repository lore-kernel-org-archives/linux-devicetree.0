From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] Documentation: add the binding file for Freescale
 imx7d ADC driver
Date: Mon, 9 Nov 2015 09:56:40 -0600
Message-ID: <20151109155640.GA21805@rob-hp-laptop>
References: <1447075704-4605-1-git-send-email-haibo.chen@freescale.com>
 <1447075704-4605-3-git-send-email-haibo.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447075704-4605-3-git-send-email-haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 09, 2015 at 09:28:22PM +0800, Haibo Chen wrote:
> The patch adds the binding file for Freescale imx7d ADC driver.
> 
> Signed-off-by: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/iio/adc/imx7d-adc.txt      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> new file mode 100644
> index 0000000..7f4ec1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> @@ -0,0 +1,26 @@
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
> +Optional properties:
> +- num-channels: the number of channels used
> +
> +Example:
> +adc1: adc@30610000 {
> +	compatible = "fsl,imx7d-adc";
> +	reg = <0x30610000 0x10000>;
> +	interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clks IMX7D_ADC_ROOT_CLK>;
> +	clock-names = "adc";
> +	num-channels = <4>;
> +	vref-supply = <&reg_vcc_3v3_mcu>;
> +};
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
