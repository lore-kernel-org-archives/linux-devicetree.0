From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: iio: adc: Migrate AD7606 documentation
 to yaml
Date: Fri, 2 Aug 2019 07:41:54 -0600
Message-ID: <CAL_Jsq+ip4rOkCdob0JhM01Yjz_eb1wtyy4OC1sTjo1w4OtRbA@mail.gmail.com>
References: <20190802100304.15899-1-beniamin.bia@analog.com> <20190802100304.15899-3-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802100304.15899-3-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamin Bia <beniamin.bia@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.ibm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, biabeniamin@outlook.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 2, 2019 at 4:03 AM Beniamin Bia <beniamin.bia@analog.com> wrote=
:
>
> The documentation for ad7606 was migrated to yaml, the new Linux Kernel
> standard.

Did you forget to delete the old file?

It's a DT, not kernel standard really.

>
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
> ---
>  .../bindings/iio/adc/adi,ad7606.yaml          | 134 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  2 files changed, 135 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7606.=
yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> new file mode 100644
> index 000000000000..509dbe9c84d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7606.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7606 Simultaneous Sampling ADC
> +
> +maintainers:
> +  - Beniamin Bia <beniamin.bia@analog.com>
> +  - Stefan Popa <stefan.popa@analog.com>
> +
> +description: |
> +  Analog Devices AD7606 Simultaneous Sampling ADC
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad=
7606_7606-6_7606-4.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD=
7616.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7605-4
> +      - adi,ad7606-8
> +      - adi,ad7606-6
> +      - adi,ad7606-4
> +      - adi,ad7616
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-cpha: true
> +
> +  avcc-supply:
> +    description:
> +      Phandle to the Avcc power supply
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  adi,conversion-start-gpios:
> +    description:
> +      Must be the device tree identifier of the CONVST pin.
> +      This logic input is used to initiate conversions on the analog
> +      input channels. As the line is active high, it should be marked
> +      GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the RESET pin. If specified,
> +      it will be asserted during driver probe. As the line is active hig=
h,
> +      it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  standby-gpios:
> +    description:
> +       Must be the device tree identifier of the STBY pin. This pin is u=
sed
> +       to place the AD7606 into one of two power-down modes, Standby mod=
e or
> +       Shutdown mode. As the line is active low, it should be marked
> +       GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +  adi,first-data-gpios:
> +    description:
> +      Must be the device tree identifier of the FRSTDATA pin.
> +      The FRSTDATA output indicates when the first channel, V1, is
> +      being read back on either the parallel, byte or serial interface.
> +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  adi,range-gpios:
> +    description:
> +      Must be the device tree identifier of the RANGE pin. The polarity =
on
> +      this pin determines the input range of the analog input channels. =
If
> +      this pin is tied to a logic high, the analog input range is =C2=B1=
10V for
> +      all channels. If this pin is tied to a logic low, the analog input=
 range
> +      is =C2=B15V for all channels. As the line is active high, it shoul=
d be marked
> +      GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  adi,oversampling-ratio-gpios:
> +    description:
> +      Must be the device tree identifier of the over-sampling
> +      mode pins. As the line is active high, it should be marked
> +      GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  adi,sw-mode:
> +    description:
> +      Software mode of operation, so far available only for ad7616.
> +      It is enabled when all three oversampling mode pins are connected =
to
> +      high level. The device is configured by the corresponding register=
s. If the
> +      adi,oversampling-ratio-gpios property is defined, then the driver =
will set the
> +      oversampling gpios to high. Otherwise, it is assumed that the pins=
 are hardwired
> +      to VDD.
> +    maxItems: 1
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - avcc-supply
> +  - interrupts
> +  - adi,conversion-start-gpios
> +
> +examples:
> +  - |
> +    spi0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +                compatible =3D "adi,ad7606-8";
> +                reg =3D <0>;
> +                spi-max-frequency =3D <1000000>;
> +                spi-cpol;
> +
> +                avcc-supply =3D <&adc_vref>;
> +
> +                interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;
> +                interrupt-parent =3D <&gpio>;
> +
> +                adi,conversion-start-gpios =3D <&gpio 17 GPIO_ACTIVE_HIG=
H>;
> +                reset-gpios =3D <&gpio 27 GPIO_ACTIVE_HIGH>;
> +                adi,first-data-gpios =3D <&gpio 22 GPIO_ACTIVE_HIGH>;
> +                adi,oversampling-ratio-gpios =3D <&gpio 18 GPIO_ACTIVE_H=
IGH
> +                                                &gpio 23 GPIO_ACTIVE_HIG=
H
> +                                                &gpio 26 GPIO_ACTIVE_HIG=
H>;
> +                standby-gpios =3D <&gpio 24 GPIO_ACTIVE_LOW>;
> +                adi,sw-mode;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 052d7a8591fb..d2e465772071 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -900,7 +900,7 @@ L:  linux-iio@vger.kernel.org
>  W:     http://ez.analog.com/community/linux-device-drivers
>  S:     Supported
>  F:     drivers/iio/adc/ad7606.c
> -F:     Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
> +F:     Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
>
>  ANALOG DEVICES INC AD7768-1 DRIVER
>  M:     Stefan Popa <stefan.popa@analog.com>
> --
> 2.17.1
>
