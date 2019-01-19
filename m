From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-binding: iio: add NPCM ADC documentation
Date: Sat, 19 Jan 2019 18:09:18 +0000
Message-ID: <20190119180918.2bfd9be1@archlinux>
References: <20190116164855.200357-1-tmaimon77@gmail.com>
        <20190116164855.200357-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116164855.200357-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au, linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jan 2019 18:48:54 +0200
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Added device tree binding documentation for Nuvoton BMC
> NPCM Analog-to-Digital Converter(ADC).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan

> ---
>  .../bindings/iio/adc/nuvoton,npcm-adc.txt          | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> new file mode 100644
> index 000000000000..1b8132cd9060
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> @@ -0,0 +1,35 @@
> +Nuvoton NPCM Analog to Digital Converter (ADC)
> +
> +The NPCM ADC is a 10-bit converter for eight channel inputs.
> +
> +Required properties:
> +- compatible: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
> +- reg: specifies physical base address and size of the registers.
> +- interrupts: Contain the ADC interrupt with flags for falling edge.
> +
> +Optional properties:
> +- clocks: phandle of ADC reference clock, in case the clock is not
> +		  added the ADC will use the default ADC sample rate.
> +- vref-supply: The regulator supply ADC reference voltage, in case the
> +			   vref-supply is not added the ADC will use internal voltage
> +			   reference.
> +
> +Required Node in the NPCM7xx BMC:
> +An additional register is present in the NPCM7xx SOC which is
> +assumed to be in the same device tree, with and marked as
> +compatible with "nuvoton,npcm750-rst".
> +
> +Example:
> +
> +adc: adc@f000c000 {
> +	compatible = "nuvoton,npcm750-adc";
> +	reg = <0xf000c000 0x8>;
> +	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clk NPCM7XX_CLK_ADC>;
> +};
> +
> +rst: rst@f0801000 {
> +	compatible = "nuvoton,npcm750-rst", "syscon",
> +	"simple-mfd";
> +	reg = <0xf0801000 0x6C>;
> +};
