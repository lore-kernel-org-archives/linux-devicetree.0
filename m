From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] bmp085.yaml: transform DT documentation of iio sensor
 into YAML
Date: Mon, 1 Apr 2019 01:17:16 -0500
Message-ID: <CAL_JsqJuu1hgmRm0Vom4Q8aXFXBJoReTzGz6UEv6bQ+QHnQLtQ@mail.gmail.com>
References: <20190331164753.xifw6kkiwdg4xpzo@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331164753.xifw6kkiwdg4xpzo@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Brian Masney <masneyb@onstation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 31, 2019 at 11:48 AM Andreas Klinger <ak@it-klinger.de> wrote:
>
> use bmp085.txt and change it into yaml format
>
> fix links to datasheets in replaced documentation
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../devicetree/bindings/iio/pressure/bmp085.txt    | 27 --------
>  .../devicetree/bindings/iio/pressure/bmp085.yaml   | 71 ++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/pressure/bmp085.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
> deleted file mode 100644
> index 61c72e63c584..000000000000
> --- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -BMP085/BMP18x/BMP28x digital pressure sensors
> -
> -Required properties:
> -- compatible: must be one of:
> -  "bosch,bmp085"
> -  "bosch,bmp180"
> -  "bosch,bmp280"
> -  "bosch,bme280"
> -
> -Optional properties:
> -- interrupts: interrupt mapping for IRQ
> -- reset-gpios: a GPIO line handling reset of the sensor: as the line is
> -  active low, it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)
> -- vddd-supply: digital voltage regulator (see regulator/regulator.txt)
> -- vdda-supply: analog voltage regulator (see regulator/regulator.txt)
> -
> -Example:
> -
> -pressure@77 {
> -       compatible = "bosch,bmp085";
> -       reg = <0x77>;
> -       interrupt-parent = <&gpio0>;
> -       interrupts = <25 IRQ_TYPE_EDGE_RISING>;
> -       reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
> -       vddd-supply = <&foo>;
> -       vdda-supply = <&bar>;
> -};
> diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> new file mode 100644
> index 000000000000..884f889c1ca5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BMP085/BMP180/BMP280/BME280 pressure iio sensors
> +
> +maintainers:
> +  - Andreas Klinger <ak@it-klinger.de>
> +
> +description: |
> +  Pressure, temperature and humidity iio sensors with i2c and spi interfaces
> +
> +  Specifications about the sensor can be found at:
> +    https://www.bosch-sensortec.com/bst/products/all_products/bmp180
> +    https://www.bosch-sensortec.com/bst/products/all_products/bmp280
> +    https://www.bosch-sensortec.com/bst/products/all_products/bme280
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - bosch,bmp085
> +          - bosch,bmp180
> +          - bosch,bmp280
> +          - bosch,bme280

This too can be just:

compatible:
  enum:
    - bosch,bmp085
    - bosch,bmp180
    - bosch,bmp280
    - bosch,bme280

> +  vddd-supply:
> +    description:
> +      digital voltage regulator (see regulator/regulator.txt)
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description:
> +      analog voltage regulator (see regulator/regulator.txt)
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      A GPIO line handling reset of the sensor. As the line is active low,
> +      it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      interrupt mapping for IRQ (BMP085 only)

Needs a 'maxItems: 1'

> +
> +required:
> +  - compatible
> +  - vddd-supply
> +  - vdda-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      pressure@77 {
> +          compatible = "bosch,bmp085";
> +          reg = <0x77>;
> +          interrupt-parent = <&gpio0>;
> +          interrupts = <25 IRQ_TYPE_EDGE_RISING>;
> +          reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
> +          vddd-supply = <&foo>;
> +          vdda-supply = <&bar>;
> +      };
> +    };
> --
> 2.11.0
