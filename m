From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/3] Documentation: add the binding file for Freescale
 vf610 ADC driver
Date: Sat, 15 Feb 2014 10:19:33 +0000
Message-ID: <52FF3F35.2040607@kernel.org>
References: <1390714773-23066-1-git-send-email-B38611@freescale.com> <1390714773-23066-4-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390714773-23066-4-git-send-email-B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/01/14 05:39, Fugang Duan wrote:
> The patch adds the binding file for Freescale vf610 ADC driver.
>
> CC: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> CC: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
> CC: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> CC: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Signed-off-by: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
It's been near enough 3 weeks without a comment from the Device Tree maintainers.
(admittedly it wasn't cc'd to the devicetree list).  I'm going to take this through
the IIO tree.

Applied to the togreg branch of
git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
though will go out briefly as the testing branch to let the autobuilders play.

> ---
>   .../devicetree/bindings/iio/adc/vf610-adc.txt      |   22 ++++++++++++++++++++
>   1 files changed, 22 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
> new file mode 100644
> index 0000000..dcebff1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
> @@ -0,0 +1,22 @@
> +Freescale vf610 Analog to Digital Converter bindings
> +
> +The devicetree bindings are for the new ADC driver written for
> +vf610/i.MX6slx and upward SoCs from Freescale.
> +
> +Required properties:
> +- compatible: Should contain "fsl,vf610-adc"
> +- reg: Offset and length of the register set for the device
> +- interrupts: Should contain the interrupt for the device
> +- clocks: The clock is needed by the ADC controller, ADC clock source is ipg clock.
> +- clock-names: Must contain "adc", matching entry in the clocks property.
> +- vref-supply: The regulator supply ADC refrence voltage.
> +
> +Example:
> +adc0: adc@4003b000 {
> +	compatible = "fsl,vf610-adc";
> +	reg = <0x4003b000 0x1000>;
> +	interrupts = <0 53 0x04>;
> +	clocks = <&clks VF610_CLK_ADC0>;
> +	clock-names = "adc";
> +	vref-supply = <&reg_vcc_3v3_mcu>;
> +};
>
