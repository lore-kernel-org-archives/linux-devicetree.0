Return-Path: <SRS0=3RKS=W5=gmail.com=dmitry.torokhov@kernel.org>
Date: Mon, 2 Sep 2019 08:48:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190902154839.GJ187474@dtor-ws>
References: <20190823071021.5598-1-linus.walleij@linaro.org>
 <20190826220022.GA7663@dtor-ws>
 <CACRpkdbv8yVP==WDo-wBgotyvnPhApTCD2x7oamCHBQKuNp3RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbv8yVP==WDo-wBgotyvnPhApTCD2x7oamCHBQKuNp3RQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Harish Jenny K N <harish_kandiga@mentor.com>, Rob Herring <robh+dt@kernel.org>, Linux Input <linux-input@vger.kernel.org>, Denis Carikli <denis@eukrea.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 27, 2019 at 09:42:46AM +0200, Linus Walleij wrote:
> On Tue, Aug 27, 2019 at 12:00 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > >  Optional properties:
> > >  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> > > -  The penirq pin goes to low when the panel is touched.
> > > +  The penirq pin goes to low when the panel is touched, so make sure to tag
> > > +  the GPIO line with GPIO_ACTIVE_LOW.
> >
> > I think this is too strong. I am sure that one can come up with a way to
> > connect the attention signal though polarity inverter and then one would
> > have to specify GPIO_ACTIVE_HIGH in the DT.
> 
> Yeah this is something that has been discussed recently as
> Harish is suggesting to add an actual inverter to the device
> tree model. As the description of reality in the device tree is
> incomplete, these flags, which should nominally be consumer
> flags and indicate the behavior of the consumer, becomes
> a panacea for solving shortcomings in the device tree model.
> 
> I am in favor of introducing explicit inverters in device tree,
> as it makes the descriptions more consistent: e.g. regulators
> are consumer oriented, they even model rails to make things
> very clear on where a voltage applies, whereas GPIO polarity
> is defined as "trial-and-error until whatever makes the system
> run" more or less.
> 
> > Can we say:
> >
> > The penirq pin goes to low when the panel is touched, so GPIO line
> > should normally be tagged with GPIO_ACTIVE_LOW.
> 
> Sure, this is not the place for hashing out DT design issues,
> can you fix when applying or should I send a new version?

I can fix it up on my side, once I hear from DY folks that they are OK
with existing DTS changes.

Thanks.

-- 
Dmitry
