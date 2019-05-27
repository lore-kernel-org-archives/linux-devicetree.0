From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: iio: adc: add adi,ad7780.yaml binding
Date: Mon, 27 May 2019 06:29:12 +0000
Message-ID: <BN3PR0301MB0897E42E948C8067DABFF9858E1D0@BN3PR0301MB0897.namprd03.prod.outlook.com>
References: <cover.1558746978.git.renatogeh@gmail.com>
        <2426649b2d8224ae72e7706bcb8c4f2c44c581d2.1558746978.git.renatogeh@gmail.com>
 <20190526173911.57ae3d11@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526173911.57ae3d11@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Renato Lui Geh <renatogeh@gmail.com>
Cc: "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-usp@googlegroups.com" <kernel-usp@googlegroups.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Jonathan Cameron [mailto:jic23@kernel.org]
> Sent: Sonntag, 26. Mai 2019 18:39
> To: Renato Lui Geh <renatogeh@gmail.com>
> Cc: lars@metafoo.de; Hennerich, Michael <Michael.Hennerich@analog.com>; k=
naack.h@gmx.de; pmeerw@pmeerw.net;
> gregkh@linuxfoundation.org; Popa, Stefan Serban <StefanSerban.Popa@analog=
.com>; Ardelean, Alexandru
> <alexandru.Ardelean@analog.com>; robh+dt@kernel.org; mark.rutland@arm.com=
; linux-iio@vger.kernel.org;
> devel@driverdev.osuosl.org; linux-kernel@vger.kernel.org; kernel-usp@goog=
legroups.com; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: add adi,ad7780.yaml bi=
nding
>=20
> On Fri, 24 May 2019 22:26:30 -0300
> Renato Lui Geh <renatogeh@gmail.com> wrote:
>=20
> > This patch adds a YAML binding for the Analog Devices AD7780/1 and
> > AD7170/1 analog-to-digital converters.
> >
> > Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
> Looks good to me, but I'm still finding my feet with these so will
> leave it for a few days for others to have time to comment.
>=20
> Michael, looking for a quick reply from you to say if you are happy
> being explicitly listed as maintainer for this one, or if you'd
> rather land it on someone else.  Same applies for patch 2.

Hi Jonathan,

Listing me as an maintainer is ok.

Acked-by: Michael Hennerich <michael.hennerich@analog.com>


>=20
> Renato, if I seem to have forgotten this in a week or so, feel
> free to give me a poke. I've been known to loose patches entirely!
>=20
> Thanks,
>=20
> Jonathan
> > ---
> > Changes in v2:
> >  - vref-supply to avdd-supply
> >  - remove avdd-supply from required list
> >  - include adc block in an spi block
> >
> >  .../bindings/iio/adc/adi,ad7780.txt           | 48 ----------
> >  .../bindings/iio/adc/adi,ad7780.yaml          | 87 +++++++++++++++++++
> >  2 files changed, 87 insertions(+), 48 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad778=
0.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad778=
0.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt b=
/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> > deleted file mode 100644
> > index 440e52555349..000000000000
> > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> > +++ /dev/null
> > @@ -1,48 +0,0 @@
> > -* Analog Devices AD7170/AD7171/AD7780/AD7781
> > -
> > -Data sheets:
> > -
> > -- AD7170:
> > -     * https://www.analog.com/media/en/technical-documentation/data-sh=
eets/AD7170.pdf
> > -- AD7171:
> > -     * https://www.analog.com/media/en/technical-documentation/data-sh=
eets/AD7171.pdf
> > -- AD7780:
> > -     * https://www.analog.com/media/en/technical-documentation/data-sh=
eets/ad7780.pdf
> > -- AD7781:
> > -     * https://www.analog.com/media/en/technical-documentation/data-sh=
eets/AD7781.pdf
> > -
> > -Required properties:
> > -
> > -- compatible: should be one of
> > -     * "adi,ad7170"
> > -     * "adi,ad7171"
> > -     * "adi,ad7780"
> > -     * "adi,ad7781"
> > -- reg: spi chip select number for the device
> > -- vref-supply: the regulator supply for the ADC reference voltage
> > -
> > -Optional properties:
> > -
> > -- powerdown-gpios:  must be the device tree identifier of the PDRST pi=
n. If
> > -                 specified, it will be asserted during driver probe. A=
s the
> > -                 line is active high, it should be marked GPIO_ACTIVE_=
HIGH.
> > -- adi,gain-gpios:   must be the device tree identifier of the GAIN pin=
. Only for
> > -                 the ad778x chips. If specified, it will be asserted d=
uring
> > -                 driver probe. As the line is active low, it should be=
 marked
> > -                 GPIO_ACTIVE_LOW.
> > -- adi,filter-gpios: must be the device tree identifier of the FILTER p=
in. Only
> > -                 for the ad778x chips. If specified, it will be assert=
ed
> > -                 during driver probe. As the line is active low, it sh=
ould be
> > -                 marked GPIO_ACTIVE_LOW.
> > -
> > -Example:
> > -
> > -adc@0 {
> > -     compatible =3D  "adi,ad7780";
> > -     reg =3D         <0>;
> > -     vref-supply =3D <&vdd_supply>
> > -
> > -     powerdown-gpios  =3D <&gpio 12 GPIO_ACTIVE_HIGH>;
> > -     adi,gain-gpios   =3D <&gpio  5 GPIO_ACTIVE_LOW>;
> > -     adi,filter-gpios =3D <&gpio 15 GPIO_ACTIVE_LOW>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> > new file mode 100644
> > index 000000000000..d1109416963c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/adi,ad7780.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices AD7170/AD7171/AD7780/AD7781 analog to digital co=
nverters
> > +
> > +maintainers:
> > +  - Michael Hennerich <michael.hennerich@analog.com>
> > +
> > +description: |
> > +  The ad7780 is a sigma-delta analog to digital converter. This driver=
 provides
> > +  reading voltage values and status bits from both the ad778x and ad71=
7x series.
> > +  Its interface also allows writing on the FILTER and GAIN GPIO pins o=
n the
> > +  ad778x.
> > +
> > +  Specifications on the converters can be found at:
> > +    AD7170:
> > +      https://www.analog.com/media/en/technical-documentation/data-she=
ets/AD7170.pdf
> > +    AD7171:
> > +      https://www.analog.com/media/en/technical-documentation/data-she=
ets/AD7171.pdf
> > +    AD7780:
> > +      https://www.analog.com/media/en/technical-documentation/data-she=
ets/ad7780.pdf
> > +    AD7781:
> > +      https://www.analog.com/media/en/technical-documentation/data-she=
ets/AD7781.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,ad7170
> > +      - adi,ad7171
> > +      - adi,ad7780
> > +      - adi,ad7781
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  avdd-supply:
> > +    description:
> > +      The regulator supply for the ADC reference voltage.
> > +    maxItems: 1
> > +
> > +  powerdown-gpios:
> > +    description:
> > +      Must be the device tree identifier of the PDRST pin. If
> > +      specified, it will be asserted during driver probe. As the
> > +      line is active high, it should be marked GPIO_ACTIVE_HIGH.
> > +    maxItems: 1
> > +
> > +  adi,gain-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GAIN pin. Only for
> > +      the ad778x chips. If specified, it will be asserted during
> > +      driver probe. As the line is active low, it should be marked
> > +      GPIO_ACTIVE_LOW.
> > +    maxItems: 1
> > +
> > +  adi,filter-gpios:
> > +    description:
> > +      Must be the device tree identifier of the FILTER pin. Only
> > +      for the ad778x chips. If specified, it will be asserted
> > +      during driver probe. As the line is active low, it should be
> > +      marked GPIO_ACTIVE_LOW.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    spi0 {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        adc@0 {
> > +            compatible =3D "adi,ad7780";
> > +            reg =3D <0>;
> > +
> > +            avdd-supply      =3D <&vdd_supply>;
> > +            powerdown-gpios  =3D <&gpio0 12 GPIO_ACTIVE_HIGH>;
> > +            adi,gain-gpios   =3D <&gpio1  5 GPIO_ACTIVE_LOW>;
> > +            adi,filter-gpios =3D <&gpio2 15 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };
