From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio/adc: Add docs for Ingenic
 JZ47xx SoCs ADC.
Date: Sat, 9 Feb 2019 15:38:50 +0000
Message-ID: <20190209153850.567c29ca@archlinux>
References: <20190204001514.29891-1-contact@artur-rojek.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204001514.29891-1-contact@artur-rojek.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Artur Rojek <contact@artur-rojek.eu>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Mon,  4 Feb 2019 01:15:12 +0100
Artur Rojek <contact@artur-rojek.eu> wrote:

> Add documentation for the ADC controller on JZ47xx SoCs,
> used by the ingenic-adc driver.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>

Hi,

This one seems simple enough and entirely standard that I'll take
it without a dt review.  As ever one is welcome, but feels like
it would be wasting Rob / Mark or anyone elses time!

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> 
>  Changes:
> 
>  v2: change a typo ',' into ';' in battery example
> 
>  .../bindings/iio/adc/ingenic,adc.txt          | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
> new file mode 100644
> index 000000000000..f01159f20d87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
> @@ -0,0 +1,48 @@
> +* Ingenic JZ47xx ADC controller IIO bindings
> +
> +Required properties:
> +
> +- compatible: Should be one of:
> +  * ingenic,jz4725b-adc
> +  * ingenic,jz4740-adc
> +- reg: ADC controller registers location and length.
> +- clocks: phandle to the SoC's ADC clock.
> +- clock-names: Must be set to "adc".
> +- #io-channel-cells: Must be set to <1> to indicate channels are selected
> +  by index.
> +
> +ADC clients must use the format described in iio-bindings.txt, giving
> +a phandle and IIO specifier pair ("io-channels") to the ADC controller.
> +
> +Example:
> +
> +#include <dt-bindings/iio/adc/ingenic,adc.h>
> +
> +adc: adc@10070000 {
> +	compatible = "ingenic,jz4740-adc";
> +	#io-channel-cells = <1>;
> +
> +	reg = <0x10070000 0x30>;
> +
> +	clocks = <&cgu JZ4740_CLK_ADC>;
> +	clock-names = "adc";
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <18>;
> +};
> +
> +adc-keys {
> +	...
> +	compatible = "adc-keys";
> +	io-channels = <&adc INGENIC_ADC_AUX>;
> +	io-channel-names = "buttons";
> +	...
> +};
> +
> +battery {
> +	...
> +	compatible = "ingenic,jz4740-battery";
> +	io-channels = <&adc INGENIC_ADC_BATTERY>;
> +	io-channel-names = "battery";
> +	...
> +};
