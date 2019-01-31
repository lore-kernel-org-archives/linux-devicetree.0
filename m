From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: Re: [PATCH v3 2/2] iio:dac:dac7612: device tree bindings
Date: Thu, 31 Jan 2019 15:33:04 +0100
Message-ID: <CAPybu_0Pd4xNzhR2RAdegomckcMxHeM8t7uCrNCXY4CZz2bZZg@mail.gmail.com>
References: <20190128094931.4430-1-ricardo@ribalda.com> <20190128094931.4430-2-ricardo@ribalda.com>
 <20190130170723.GA24708@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130170723.GA24708@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob

Thanks for your comments!

On Wed, Jan 30, 2019 at 6:07 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 28, 2019 at 10:49:31AM +0100, Ricardo Ribalda Delgado wrote:
> > Bindings for dac7612.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  .../bindings/iio/dac/ti,dac7612.txt           | 29 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> >
> > diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> > new file mode 100644
> > index 000000000000..e1b8158fab35
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> > @@ -0,0 +1,29 @@
> > +* Texas Instruments Dual, 12-Bit Serial Input Digital-to-Analog Converter
> > +
> > +The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with guaranteed
> > +12-bit monotonicity performance over the industrial temperature range.
> > +Is is programmable through an SPI interface.
> > +
> > +The internal DACs are loaded when the LOADDACS pin is pulled down.
> > +
> > +http://www.ti.com/lit/ds/sbas106/sbas106.pdf
> > +
> > +Required Properties:
> > +- compatible: Should be one of:
> > +             "ti,dac7612"
> > +             "ti,dac7612u"
> > +             "ti,dac7612b"
>
> What's the difference? I can only find 'u' and 'ub' variants and nothing
> about how those are different. So maybe just 1 string is enough?

dac7612 is how it is named on the datasheet commercial name.
dac7612u and dac7612ub being the variants. ub being slightly more
accurante. Shall I leave only 7612?
or keep the tree variants (fixing 7612b with 7612ub)?

Thanks!

>
> > +- reg: Definition as per Documentation/devicetree/bindings/spi/spi-bus.txt
> > +
> > +Optional Properties:
> > +- loaddacs-gpios: GPIO descriptor for the LOADDACS pin.
>
> Needs a 'ti' vendor prefix.
>
> > +- spi-*: Definition as per Documentation/devicetree/bindings/spi/spi-bus.txt
> > +
> > +Example:
> > +
> > +     dac7612@1 {
>
> dac@1
>
> > +             compatible = "ti,dac7612";
> > +             reg = <0x1>;
> > +             loaddacs-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
> > +     };
> > +
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 30ba5435906b..e28e5afaae16 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14882,6 +14882,7 @@ M:    Ricardo Ribalda <ricardo@ribalda.com>
> >  L:   linux-iio@vger.kernel.org
> >  S:   Supported
> >  F:   drivers/iio/dac/ti-dac7612.c
> > +F:   Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> >
> >  THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
> >  M:   Hans Verkuil <hverkuil@xs4all.nl>
> > --
> > 2.20.1
> >



-- 
Ricardo Ribalda
