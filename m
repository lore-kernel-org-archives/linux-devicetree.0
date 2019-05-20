From: Alexandru Ardelean <ardeleanalex@gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: accel: adxl372: switch to YAML bindings
Date: Mon, 20 May 2019 13:46:37 +0300
Message-ID: <CA+U=DsrvRcAARa+jZB8GKQ+q+wWWqAh7dmnHymLd9cpFGC2QSw@mail.gmail.com>
References: <20190518215542.25140-1-lucasseikioshiro@gmail.com> <20190519122418.7722641b@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190519122418.7722641b@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lucas Oshiro <lucasseikioshiro@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-usp@googlegroups.com, Rodrigo Ribeiro <rodrigorsdc@gmail.com>, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 19, 2019 at 8:27 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 18 May 2019 18:55:42 -0300
> Lucas Oshiro <lucasseikioshiro@gmail.com> wrote:
>
> > Convert the old device tree documentation to yaml format.
> >
> > Signed-off-by: Lucas Oshiro <lucasseikioshiro@gmail.com>
> > Signed-off-by: Rodrigo Ribeiro <rodrigorsdc@gmail.com>
> > Co-developed-by: Rodrigo Ribeiro <rodrigorsdc@gmail.com>
> > ---
> >
> > Hello,
> > We've added Stefan Popa as maintainer of the yaml documentation of this driver
> > because we found through git that he was the author of the older documentation.
>
> Definitely going to need an Ack from Stefan for that ;)

CC-ing my work-email
There are some issues with it and mailing lists; I'll hopefully sort
them out in the next weeks.

Stefan is out-of-office.
He'll take a look when he comes back.

I'll add a few notes until then.

I'd still like Stefan's ack to be final.

>
> I've not really gotten yaml formats into my head yet, but from a quick
> look I think this is fine.  I will however be looking for review from others
> on these.
>
> Thanks,
>
> Jonathan
>
> >
> >  .../bindings/iio/accel/adi,adxl372.yaml       | 66 +++++++++++++++++++
> >  .../devicetree/bindings/iio/accel/adxl372.txt | 33 ----------
> >  2 files changed, 66 insertions(+), 33 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/iio/accel/adxl372.txt

Also update the MAINTAINERS file when changing this.
For reference, many things can be borrowed from the ADXL345, which is
similar (from a dt-binding doc perspective only).

> >
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> > new file mode 100644
> > index 000000000000..a6e2893d2ab1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/accelerometers/adi,adxl372.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer
> > +
> > +maintainers:
> > +  - Stefan Popa <stefan.popa@analog.com>
> > +
> > +description: |
> > +  Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer that supports
> > +  both I2C & SPI interfaces
> > +    https://www.analog.com/en/products/adxl372.html
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,adxl372
> > +
> > +  reg:
> > +    description: the I2C address or SPI chip select number for the device

no need to add a description for reg
it's a standard property

> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      interrupt mapping for IRQ as documented in
> > +      Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

no need to describe this either

> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg

I think interrupts is also required.

> > +
> > +examples:
> > +  - |
> > +        #include <dt-bindings/gpio/gpio.h>
> > +        #include <dt-bindings/interrupt-controller/irq.h>
> > +        i2c0 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                /* Example for a I2C device node */
> > +                accelerometer@53 {
> > +                        compatible = "adi,adxl372";
> > +                        reg = <0x53>;
> > +                        interrupt-parent = <&gpio>;
> > +                        interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > +                };
> > +        };
> > +  - |
> > +        #include <dt-bindings/gpio/gpio.h>
> > +        #include <dt-bindings/interrupt-controller/irq.h>
> > +        spi0 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                accelerometer@0 {
> > +                        compatible = "adi,adxl372";
> > +                        reg = <0>;
> > +                        spi-max-frequency = <1000000>;
> > +                        interrupt-parent = <&gpio>;
> > +                        interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > +                };
> > +        };

Rest looks good.

> > diff --git a/Documentation/devicetree/bindings/iio/accel/adxl372.txt b/Documentation/devicetree/bindings/iio/accel/adxl372.txt
> > deleted file mode 100644
> > index a289964756a7..000000000000
> > --- a/Documentation/devicetree/bindings/iio/accel/adxl372.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer
> > -
> > -http://www.analog.com/media/en/technical-documentation/data-sheets/adxl372.pdf
> > -
> > -Required properties:
> > - - compatible : should be "adi,adxl372"
> > - - reg: the I2C address or SPI chip select number for the device
> > -
> > -Required properties for SPI bus usage:
> > - - spi-max-frequency: Max SPI frequency to use
> > -
> > -Optional properties:
> > - - interrupts: interrupt mapping for IRQ as documented in
> > -   Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > -
> > -Example for a I2C device node:
> > -
> > -     accelerometer@53 {
> > -             compatible = "adi,adxl372";
> > -             reg = <0x53>;
> > -             interrupt-parent = <&gpio>;
> > -             interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > -     };
> > -
> > -Example for a SPI device node:
> > -
> > -     accelerometer@0 {
> > -             compatible = "adi,adxl372";
> > -             reg = <0>;
> > -             spi-max-frequency = <1000000>;
> > -             interrupt-parent = <&gpio>;
> > -             interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > -     };
>
