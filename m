From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND PATCH 4/4] dt-bindings: iio: adc: Convert ad7124
 documentation to YAML
Date: Thu, 20 Jun 2019 08:20:47 -0600
Message-ID: <CAL_Jsq+P3oG1MPcMMrEfp58Ltw92kk66os34wVwNuUC9a=F2vg@mail.gmail.com>
References: <20190620094203.13654-1-mircea.caprioru@analog.com> <20190620094203.13654-4-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620094203.13654-4-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 3:42 AM Mircea Caprioru
<mircea.caprioru@analog.com> wrote:
>
> Convert AD7124 bindings documentation to YAML format.
>
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---
>  .../bindings/iio/adc/adi,ad7124.yaml          | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> new file mode 100644
> index 000000000000..2dba3759b8e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: GPL-2.0

The preference for new bindings is dual (GPL-2.0 OR BSD-2-Clause) if
that is okay with you.

> +# Copyright 2019 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/iio/adc/adi,ad7124.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7124 ADC device driver
> +
> +maintainers:
> +  - Stefan Popa <stefan.popa@analog.com>
> +
> +description: |
> +  Bindings for the Analog Devices AD7124 ADC device. Datasheet can be
> +  found here:
> +    https://www.analog.com/media/en/technical-documentation/data-sheets/AD7124-8.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7124-4
> +      - adi,ad7124-8
> +
> +  reg:
> +    description: SPI chip select number for the device
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: phandle to the master clock (mclk)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  interrupts:
> +    description: IRQ line for the ADC
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  refin1-supply:
> +    description: refin1 supply can be used as reference for conversion.
> +    maxItems: 1
> +
> +  refin2-supply:
> +    description: refin2 supply can be used as reference for conversion.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: avdd supply can be used as reference for conversion.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +patternProperties:
> +  "^channel@[01]$":

Need to allow 2-15?

> +    type: object
> +    description: |
> +      Represents the external channels which are connected to the ADC.
> +      See Documentation/devicetree/bindings/iio/adc/adc.txt.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. It can have up to 8 channels on ad7124-4
> +          and 16 channels on ad7124-8, numbered from 0 to 15.

Sounds like constraints.

items:
  - minimum: 0
    maximum: 15

> +        maxItems: 1

And then you can drop this as it is implied with the number of 'items' entries.

> +
> +      adi,reference-select:
> +        description: |
> +          Select the reference source to use when converting on
> +          the specific channel.
> +          If this field is left empty, internal reference is selected.
> +        maxItems: 1

Type? Range of values?

> +
> +      diff-channels:
> +        description: see Documentation/devicetree/bindings/iio/adc/adc.txt
> +        maxItems: 1

Not correct as this is an array. Assuming this is covered by a common
adc schema, you just need to define constraints on the values:

items:
  minimum: 0
  maximum: 15

> +
> +      bipolar:
> +        description: see Documentation/devicetree/bindings/iio/adc/adc.txt
> +        maxItems: 1

You can assume this is covered by common adc schema. So just 'bipolar:
true' is enough.

> +
> +      adi,buffered-positive:
> +        description: Enable buffered mode for positive input.
> +        maxItems: 1

Not right as this is bool. Needs 'type: boolean'

> +      adi,buffered-negative:
> +        description: Enable buffered mode for negative input.
> +        maxItems: 1

ditto

> +
> +    required:
> +      - reg
> +      - diff-channels
> +
> +examples:
> +  - |
> +    adc@0 {
> +      compatible = "adi,ad7124-4";
> +      reg = <0>;
> +      spi-max-frequency = <5000000>;
> +      interrupts = <25 2>;
> +      interrupt-parent = <&gpio>;
> +      refin1-supply = <&adc_vref>;
> +      clocks = <&ad7124_mclk>;
> +      clock-names = "mclk";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      channel@0 {
> +        reg = <0>;
> +        diff-channels = <0 1>;
> +        adi,reference-select = <0>;
> +        adi,buffered-positive;
> +      };
> +
> +      channel@1 {
> +        reg = <1>;
> +        bipolar;
> +        diff-channels = <2 3>;
> +        adi,reference-select = <0>;
> +        adi,buffered-positive;
> +        adi,buffered-negative;
> +      };
> +
> +      channel@2 {
> +        reg = <2>;
> +        diff-channels = <4 5>;
> +      };
> +
> +      channel@3 {
> +        reg = <3>;
> +        diff-channels = <6 7>;
> +      };
> +    };
> --
> 2.17.1
>
