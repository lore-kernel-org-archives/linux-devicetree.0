From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: iio: frequency: Add docs for ADF4371 PLL
Date: Tue, 11 Jun 2019 16:00:31 -0600
Message-ID: <CAL_JsqLXXo7wMef-j8Gj+mim_yJ2w5R3tyqPMNtS8iX5ffrJjg@mail.gmail.com>
References: <1559653697-2760-1-git-send-email-stefan.popa@analog.com> <20190611215932.GA24974@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611215932.GA24974@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Michael Hennerich <Michael.Hennerich@analog.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 3:59 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jun 04, 2019 at 04:08:17PM +0300, Stefan Popa wrote:
> > Document support for Analog Devices ADF4371 SPI Wideband Synthesizer.
> >
> > Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> > ---
> > Changes in v2:
> >       - Nothing changed.
> > Changes in v3:
> >       - Nothing changed.
> > Changes in v4:
> >       - Nothing changed.
> > Changes in v5:
> >       - Nothing changed.
>
> Please add acks/reviewed-bys when posting new versions.
>
> But something else I noticed:
>
> >
> >  .../devicetree/bindings/iio/frequency/adf4371.yaml | 54 ++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> > new file mode 100644
> > index 0000000..d7adf074
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/frequency/adf4371.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADF4371 Wideband Synthesizer
> > +
> > +maintainers:
> > +  - Popa Stefan <stefan.popa@analog.com>
> > +
> > +description: |
> > +  Analog Devices ADF4371 SPI Wideband Synthesizer
> > +  https://www.analog.com/media/en/technical-documentation/data-sheets/adf4371.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,adf4371
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Definition of the external clock (see clock/clock-bindings.txt)
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Must be "clkin"
>
> This can be a schema:
>
> clock-names:
>   items:
>     - clkin

And with that, you can keep my R-by.

Rob
