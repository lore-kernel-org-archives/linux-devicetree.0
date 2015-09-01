From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 1/4] dt-binding: gpio: Add Qualcomm SMSM device tree
 documentation
Date: Mon, 31 Aug 2015 22:26:39 -0700
Message-ID: <20150901052639.GF13472@usrtlx11787.corpusers.net>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1440697078-4106-2-git-send-email-bjorn.andersson@sonymobile.com>
 <CAL_Jsq+WmENn6zbc-ju7d3De4ewBtOe8Hm7JGXvUxfqwpz=iTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+WmENn6zbc-ju7d3De4ewBtOe8Hm7JGXvUxfqwpz=iTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 31 Aug 08:43 PDT 2015, Rob Herring wrote:

> On Thu, Aug 27, 2015 at 12:37 PM, Bjorn Andersson
> <bjorn.andersson@sonymobile.com> wrote:
> > This documents a device tree binding for exposing the Qualcomm Shared
> > Memory State Machine as a set of gpio- and interrupt-controllers.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > ---
> >  .../devicetree/bindings/gpio/qcom,smsm.txt         | 114 +++++++++++++++++++++
> 
> >  drivers/gpio/Kconfig                               |   8 ++
> >  drivers/gpio/Makefile                              |   1 +
> 
> Presumably this goes in patch 2.
> 

Of course, my git-fu let me down.

> >  3 files changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/qcom,smsm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/qcom,smsm.txt b/Documentation/devicetree/bindings/gpio/qcom,smsm.txt
> > new file mode 100644
> > index 000000000000..06201ba76594
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/qcom,smsm.txt
> > @@ -0,0 +1,114 @@
> > +Qualcomm Shared Memory State Machine
> > +
> > +The Shared Memory State Machine facilitates broadcasting of single bit state
> > +information between the processors in a Qualcomm SoC. Each processor is
> > +assigned 32 bits of state that can be modified. A processor can through a
> > +matrix of bitmaps signal subscription of notifications upon changes to a
> > +certain bit owned by a certain remote processor.
> 
> Are all the bits s/w driven, but somehow fixed in their functional definition?
> 

There's a wide range of systems implementing this, but I think it's all
software. The definition of the individual bits used to be defined by
one large enum, but it looks like Qualcomm ran out of bits and started
to re-use them.

But the functions are always well defined for a given platform.

> > +This document defines the binding for a driver that implements and exposes this
> > +a GPIO controller and a set of interrupt controllers.
> 
> I imagine Linus will have thoughts about that.
> 

Looking forward to hearing his comments :)

I have not been able to find any other suitable framework to expose this
functionality with and I am hoping to not be forced to create a new one
as this one fits the purpose well.

> > +
> > +- compatible:
> > +       Usage: required
> > +       Value type: <string>
> > +       Definition: must be one of:
> > +                   "qcom,smsm"
> 
> There are not versions of the h/w?
> 

There are basically 2 versions; the original version comprised the
application cpu and the modem cpu, sometime around 2008-2009 this was
replaced with something called "N-way SMSM" - i.e. this implementation.
The only change since then is in the number of entries and number of
hosts - which we can determine in runtime if it's not compatible with
the original sizes.


So I have not been able to find any reasons to be more specific.


Thanks for taking a look.

Regards,
Bjorn
