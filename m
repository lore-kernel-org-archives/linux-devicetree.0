From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: add adi,ad7780.yaml binding
Date: Sun, 19 May 2019 12:32:08 +0100
Message-ID: <20190519123208.26c864ce@archlinux>
References: <9992a318aec777b9b7788bb40d976aa89e5963fe.1558219042.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <9992a318aec777b9b7788bb40d976aa89e5963fe.1558219042.git.renatogeh@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: mark.rutland@arm.com, devel@driverdev.osuosl.org, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, robh+dt@kernel.org, stefan.popa@analog.com, knaack.h@gmx.de, alexandru.Ardelean@analog.com
List-Id: devicetree@vger.kernel.org

On Sat, 18 May 2019 19:41:12 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> This patch adds a YAML binding for the Analog Devices AD7780/1 and
> AD7170/1 analog-to-digital converters.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
One comment inline.  I'll also be needing an ack from Analog on this,
preferably Michael's.

Thanks,

Jonathan
> ---
>  .../bindings/iio/adc/adi,ad7780.txt           | 48 -----------
>  .../bindings/iio/adc/adi,ad7780.yaml          | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> deleted file mode 100644
> index 440e52555349..000000000000
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -* Analog Devices AD7170/AD7171/AD7780/AD7781
> -
> -Data sheets:
> -
> -- AD7170:
> -	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7170.pdf
> -- AD7171:
> -	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7171.pdf
> -- AD7780:
> -	* https://www.analog.com/media/en/technical-documentation/data-sheets/ad7780.pdf
> -- AD7781:
> -	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7781.pdf
> -
> -Required properties:
> -
> -- compatible: should be one of
> -	* "adi,ad7170"
> -	* "adi,ad7171"
> -	* "adi,ad7780"
> -	* "adi,ad7781"
> -- reg: spi chip select number for the device
> -- vref-supply: the regulator supply for the ADC reference voltage
> -
> -Optional properties:
> -
> -- powerdown-gpios:  must be the device tree identifier of the PDRST pin. If
> -		    specified, it will be asserted during driver probe. As the
> -		    line is active high, it should be marked GPIO_ACTIVE_HIGH.
> -- adi,gain-gpios:   must be the device tree identifier of the GAIN pin. Only for
> -		    the ad778x chips. If specified, it will be asserted during
> -		    driver probe. As the line is active low, it should be marked
> -		    GPIO_ACTIVE_LOW.
> -- adi,filter-gpios: must be the device tree identifier of the FILTER pin. Only
> -		    for the ad778x chips. If specified, it will be asserted
> -		    during driver probe. As the line is active low, it should be
> -		    marked GPIO_ACTIVE_LOW.
> -
> -Example:
> -
> -adc@0 {
> -	compatible =  "adi,ad7780";
> -	reg =	      <0>;
> -	vref-supply = <&vdd_supply>
> -
> -	powerdown-gpios  = <&gpio 12 GPIO_ACTIVE_HIGH>;
> -	adi,gain-gpios   = <&gpio  5 GPIO_ACTIVE_LOW>;
> -	adi,filter-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
> -};
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> new file mode 100644
> index 000000000000..931bc4f8ec04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7780.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7170/AD7171/AD7780/AD7781 analog to digital converters
> +
> +maintainers:
> +  - Michael Hennerich <michael.hennerich@analog.com>
> +
> +description: |
> +  The ad7780 is a sigma-delta analog to digital converter. This driver provides
> +  reading voltage values and status bits from both the ad778x and ad717x series.
> +  Its interface also allows writing on the FILTER and GAIN GPIO pins on the
> +  ad778x.
> +
> +  Specifications on the converters can be found at:
> +    AD7170:
> +      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7170.pdf
> +    AD7171:
> +      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7171.pdf
> +    AD7780:
> +      https://www.analog.com/media/en/technical-documentation/data-sheets/ad7780.pdf
> +    AD7781:
> +      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7781.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7170
> +      - adi,ad7171
> +      - adi,ad7780
> +      - adi,ad7781
> +
> +  reg:
> +    description:
> +      Chip select number for the device
> +    maxItems: 1
> +
> +  vref-supply:
> +    description:
> +      The regulator supply for the ADC reference voltage
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description:
> +      Must be the device tree identifier of the PDRST pin. If
> +      specified, it will be asserted during driver probe. As the
> +      line is active high, it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  adi,gain-gpios:
> +    description:
> +      Must be the device tree identifier of the GAIN pin. Only for
> +      the ad778x chips. If specified, it will be asserted during
> +      driver probe. As the line is active low, it should be marked
> +      GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +  adi,filter-gpios:
> +    description:
> +      Must be the device tree identifier of the FILTER pin. Only
> +      for the ad778x chips. If specified, it will be asserted
> +      during driver probe. As the line is active low, it should be
> +      marked GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vref-supply
Is that actually true?  I'd imagine it'll use a stub regulator if
it isn't supplied.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    adc@0 {
> +      compatible =  "adi,ad7780";
> +      reg = <0>;
> +      vref-supply = <&vdd_supply>;
> +
> +      powerdown-gpios  = <&gpio0 12 GPIO_ACTIVE_HIGH>;
> +      adi,gain-gpios   = <&gpio1  5 GPIO_ACTIVE_LOW>;
> +      adi,filter-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>;
> +    };
