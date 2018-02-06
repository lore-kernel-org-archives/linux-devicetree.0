From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Tue, 06 Feb 2018 11:53:14 +0100
Message-ID: <1517914394.3175.21.camel@pengutronix.de>
References: <20180201174923.7385-1-l.stach@pengutronix.de>
         <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
         <1517825351.3175.3.camel@pengutronix.de>
         <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "A . s . Dong" <aisheng.dong@nxp.com>, linux-imx@nxp.com, Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Linus,

Am Dienstag, den 06.02.2018, 00:13 +0100 schrieb Linus Walleij:
> > On Mon, Feb 5, 2018 at 11:09 AM, Lucas Stach <l.stach@pengutronix.de> wrote:
> 
> > > > +Optional Properties:
> > > > +- drive-strength           Integer: controls Drive Strength
> > > 
> > > I thought drive-strength is supposed to be be in mA. We should not have
> > > differing units in common properties.
> > > 
> > > There was an Atmel binding the other day that this came up.
> > 
> > I know it's in the common binding, but it's going to be very hard to
> > support. The drive-strength in mA really depends on external loading of
> > the pin and the pin voltage, at least for the most widespread
> > controllers that only switch between resistors, instead of driving the
> > pin by a current regulator.
> 
> How does this circuit really look? Can you sketch something so
> we understand what is going on electronically here?

There is no description of how the circuit really looks like and I
would very much prefer this not being a prerequisite to get some
software support in place.

The best description we have is from NXP AN5078:
"The drive strength enable (DSE) can be explained as series resistance
between an ideal driver's output and its load. To achieve maximal
transferred power, the impedance of the driver has to match the load
impedance."

Which means the control bits don't really vary the output impedance,
but the description models it like that. If we _assume_ the simple MOS
totempole setup then adding more totempoles will bring down the output
impedance.

> The way I imagine most drive strength out there works is by simply
> connection more MOS-totempoles after each other and each of them
> has a production-technology-related max output current like 4mA, so
> by putting two in a series yoy double that to 8 mA.

So with this description in mind the drive-strength property doesn't
describe an actual real world drive-strength, but some maximum current
output under ideal load matching?

That's pretty confusing actually, as in a real-world setup increasing
the drive-strength property value might negatively affect the load
matching, leading to _decreasing_ the actual drive-strength.

> Is that what you mean with "current regulator"?
> 
> If you mean rather "output impedance", that is something else and
> something we need a new (generic) property for. I never saw that
> before, really.

So, just because the description of the drive-strength value uses some
(idealized) output impedance, we are now going to introduce yet another
property for the same thing? This is confusing to people reading the
reference manual, which never speaks about output-impedance, but always
about drive-strength.

Hardware people (the ones responsible to come up with the padctrl
settings) are much more likely to read the reference manual than any
idealized dt-binding. I want to make it as easy as possible for them to
match up the hardware and reference manual with the DT description.
So, can we please just keep the drive-strength property and deal with
it being described in different units in different hardware manuals?

Regards,
Lucas
