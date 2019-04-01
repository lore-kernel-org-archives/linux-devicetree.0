From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] avia-hx711.yaml: transform DT binding to YAML
Date: Mon, 1 Apr 2019 01:13:44 -0500
Message-ID: <CAL_JsqLvXu3rmeekZ+rXUMB6Mw8yBSi8B3mdjga5N0GwrM7n+Q@mail.gmail.com>
References: <20190331152717.j3b3aggx674zrcko@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331152717.j3b3aggx674zrcko@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 31, 2019 at 10:27 AM Andreas Klinger <ak@it-klinger.de> wrote:
>
> replace avia-hx711.txt by avia-hx711.yaml as yaml devicetree documentation
> for avia hx711 iio adc sensor
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../devicetree/bindings/iio/adc/avia-hx711.txt     | 24 --------
>  .../devicetree/bindings/iio/adc/avia-hx711.yaml    | 67 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> deleted file mode 100644
> index 7222328a3d0d..000000000000
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -* AVIA HX711 ADC chip for weight cells
> -  Bit-banging driver
> -
> -Required properties:
> - - compatible: Should be "avia,hx711"
> - - sck-gpios:  Definition of the GPIO for the clock
> - - dout-gpios: Definition of the GPIO for data-out
> -               See Documentation/devicetree/bindings/gpio/gpio.txt
> - - avdd-supply:        Definition of the regulator used as analog supply
> -
> -Optional properties:
> - - clock-frequency:    Frequency of PD_SCK in Hz
> -                       Minimum value allowed is 10 kHz because of maximum
> -                       high time of 50 microseconds.
> -
> -Example:
> -weight {
> -       compatible = "avia,hx711";
> -       sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
> -       dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> -       avdd-suppy = <&avdd>;
> -       clock-frequency = <100000>;
> -};
> -
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> new file mode 100644
> index 000000000000..e4fee0f877ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: AVIA HX711 ADC chip for weight cells
> +
> +maintainers:
> +  - Andreas Klinger <ak@it-klinger.de>
> +
> +description: |
> +  Bit-banging driver using two GPIOs:
> +  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
> +    and up to 3 cycles for selection of the input channel and gain for the
> +    next measurement
> +  - dout-gpio is the sensor data the sensor responds to the clock
> +
> +  Specifications about the driver can be found at:
> +  http://www.aviaic.com/ENProducts.aspx
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - const: avia,hx711

You don't need oneOf here unless you expect to have compatible with a
variable number of compatible strings. If there are other similar
chips which could be added, then using enum will be more future proof
(So is 'oneOf' arguably, but it makes for more cryptic error
messages).

> +
> +  sck-gpios:
> +    description:
> +      Definition of the GPIO for the clock (output). In the datasheet it is
> +      named PD_SCK
> +    maxItems: 1
> +
> +  dout-gpios:
> +    description:
> +      Definition of the GPIO for the data-out sent by the sensor in
> +      response to the clock (input).
> +      See Documentation/devicetree/bindings/gpio/gpio.txt for information
> +      on how to specify a consumer gpio.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as analog supply
> +    maxItems: 1
> +
> +  clock-frequency:
> +    minimum: 20000
> +    maximum: 2500000
> +    default: 400000
> +
> +required:
> +  - compatible
> +  - sck-gpios
> +  - dout-gpios
> +  - avdd-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    weight {
> +        compatible = "avia,hx711";
> +        sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
> +        dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> +        avdd-suppy = <&avdd>;
> +        clock-frequency = <100000>;
> +    };
> --
> 2.11.0
