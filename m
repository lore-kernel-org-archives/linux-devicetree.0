MIME-Version: 1.0
Date: Thu, 18 Oct 2018 08:34:07 -0500
References: <20181005150951.22129-1-chris.brandt@renesas.com>
	<20181005150951.22129-3-chris.brandt@renesas.com>
	<20181016224700.GA26385@bogus>
	<TY1PR01MB15621C230B196C05F2A5BFAB8AFF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621C230B196C05F2A5BFAB8AFF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Message-ID: <CAL_Jsq+xH-iCpsgwU_Q4+fdxO=AGz0xar-OXbP2_6zjUroNq6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, jmondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 16, 2018 at 7:53 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Tuesday, October 16, 2018, Rob Herring wrote:
> > > +Optional properties:
> > > +  - gpio-controller
> > > +    Include this in order to enable GPIO functionality. When included,
> > both
> > > +    gpio_cells and gpio_ranges are then required.
> > > +  - #gpio-cells
> > > +    Must be 2
> > > +  - gpio-ranges
> > > +    Expresses the total number GPIO ports/pins in this SoC
> >
> > Are these really optional? I guess in theory a board could use no GPIOs,
> > but that seems unlikely.
>
> They are 'optional' in the sense that if you don't include them in the
> DT, the driver still loads (just without any GPIO, but pinctrl still
> works). So, I was just documenting that fact.
>
> If you think I should just move these to required, let me know an I'm
> fine with that. (as in, DT documents HW, not software)

I do. There's no implicit requirement that the s/w has to support it.

> > > +Sub-nodes
> > > +---------
> > > +
> > > +The child nodes of the pin controller node describe a pin multiplexing
> > > +function or a GPIO controller alternatively.
> >
> > But the parent is already a GPIO controller. This needs to be fully
> > defined.
>
> Now that I read this, I think my wording was off (I was borrowing text
> for other files).
>
> How about this:
>
> The child nodes of the pin controller designate pins to be used for
> specific peripheral functions or as GPIO.

Sure.
