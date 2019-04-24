From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: tsl2772: convert bindings to
 YAML format
Date: Wed, 24 Apr 2019 10:50:41 -0500
Message-ID: <CAL_JsqLQRkBO=DxSqNaGqE=zoQq0n0EQ920pQNGGE+LnVZid5A@mail.gmail.com>
References: <20190424092238.6381-1-masneyb@onstation.org> <20190424122648.GA15745@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424122648.GA15745@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 7:26 AM Brian Masney <masneyb@onstation.org> wrote:
>
> On Wed, Apr 24, 2019 at 05:22:37AM -0400, Brian Masney wrote:
> > Convert the tsl2772 device tree bindings to the new YAML format.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > Changes since v1:
> > - Dropped description from reg and interrupts properties.
> > - Dropped $ref from led-max-microamp, vdd-supply, and vddio-supply.
> > - Changed 'tsl2772@39' in example to 'proximity-sensor@39'
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        proximity-sensor@39 {
>
> I didn't think of this until after I sent out that patch, but I think
> this example should be 'als-proximity-sensor@39' instead of
> 'proximity-sensor@39'.

I'd just do 'sensor@39' in that case. We normally use light-sensor for
ALS devices, but we haven't been real consistent here.

Rob
