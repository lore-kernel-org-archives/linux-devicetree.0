MIME-Version: 1.0
Date: Thu, 16 May 2019 08:29:08 -0500
References: <20190516121509.1441-1-alexandru.ardelean@analog.com>
In-Reply-To: <20190516121509.1441-1-alexandru.ardelean@analog.com>
Message-ID: <CAL_JsqJLEuCJWnD1G5iXdCNcJ+a_0zhoUH2a=4i6VBm8_B9r6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: accel: adxl345: switch to YAML bindings
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 16, 2019 at 7:15 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> The ADX345 supports both I2C & SPI bindings.
> This change switches from old text bindings, to YAML bindings, and also
> tries to make use of the recent multiple-examples support.
>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  .../bindings/iio/accel/adi,adxl345.yaml       | 74 +++++++++++++++++++
>  .../devicetree/bindings/iio/accel/adxl345.txt | 39 ----------
>  2 files changed, 74 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
>  delete mode 100644 Documentation/devicetree/bindings/iio/accel/adxl345.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> new file mode 100644
> index 000000000000..47cdfb3b8182
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/accelerometers/adi,adxl345.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADXL345/ADXL375 3-Axis Digital Accelerometers
> +
> +maintainers:
> +  - Michael Hennerich <michael.hennerich@analog.com>
> +
> +description: |
> +  Analog Devices ADXL345/ADXL375 3-Axis Digital Accelerometers that supports
> +  both I2C & SPI interfaces.
> +    http://www.analog.com/en/products/mems/accelerometers/adxl345.html
> +    http://www.analog.com/en/products/sensors-mems/accelerometers/adxl375.html
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adxl345
> +      - adi,adxl375
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-cpha: true
> +
> +  spi-cpol: true
> +
> +  interrupt-parent: true

You don't need to document interrupt-parent. It is implied. With that dropped,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* Example for a I2C device node */
> +        accelerometer@2a {
> +            compatible = "adi,adxl345";
> +            reg = <0x53>;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* Example for a SPI device node */
> +        accelerometer@0 {
> +            compatible = "adi,adxl345";
> +            reg = <0>;
> +            spi-max-frequency = <5000000>;
> +            spi-cpol;
> +            spi-cpha;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/iio/accel/adxl345.txt b/Documentation/devicetree/bindings/iio/accel/adxl345.txt
> deleted file mode 100644
> index f9525f6e3d43..000000000000
> --- a/Documentation/devicetree/bindings/iio/accel/adxl345.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Analog Devices ADXL345/ADXL375 3-Axis Digital Accelerometers
> -
> -http://www.analog.com/en/products/mems/accelerometers/adxl345.html
> -http://www.analog.com/en/products/sensors-mems/accelerometers/adxl375.html
> -
> -Required properties:
> - - compatible : should be one of
> -               "adi,adxl345"
> -               "adi,adxl375"
> - - reg : the I2C address or SPI chip select number of the sensor
> -
> -Required properties for SPI bus usage:
> - - spi-max-frequency : set maximum clock frequency, must be 5000000
> - - spi-cpol and spi-cpha : must be defined for adxl345 to enable SPI mode 3
> -
> -Optional properties:
> - - interrupts: interrupt mapping for IRQ as documented in
> -   Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> -
> -Example for a I2C device node:
> -
> -       accelerometer@2a {
> -               compatible = "adi,adxl345";
> -               reg = <0x53>;
> -               interrupt-parent = <&gpio1>;
> -               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> -       };
> -
> -Example for a SPI device node:
> -
> -       accelerometer@0 {
> -               compatible = "adi,adxl345";
> -               reg = <0>;
> -               spi-max-frequency = <5000000>;
> -               spi-cpol;
> -               spi-cpha;
> -               interrupt-parent = <&gpio1>;
> -               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> -       };
> --
> 2.17.1
>
