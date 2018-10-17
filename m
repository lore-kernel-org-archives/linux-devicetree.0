Return-Path: <SRS0=toaV=M5=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Date: Wed, 17 Oct 2018 00:53:40 +0000
Message-ID: 
 <TY1PR01MB15621C230B196C05F2A5BFAB8AFF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181005150951.22129-1-chris.brandt@renesas.com>
 <20181005150951.22129-3-chris.brandt@renesas.com>
 <20181016224700.GA26385@bogus>
In-Reply-To: <20181016224700.GA26385@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, jacopo mondi <jacopo@jmondi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tuesday, October 16, 2018, Rob Herring wrote:
> > +Optional properties:
> > +  - gpio-controller
> > +    Include this in order to enable GPIO functionality. When included,
> both
> > +    gpio_cells and gpio_ranges are then required.
> > +  - #gpio-cells
> > +    Must be 2
> > +  - gpio-ranges
> > +    Expresses the total number GPIO ports/pins in this SoC
>=20
> Are these really optional? I guess in theory a board could use no GPIOs,
> but that seems unlikely.

They are 'optional' in the sense that if you don't include them in the=20
DT, the driver still loads (just without any GPIO, but pinctrl still=20
works). So, I was just documenting that fact.

If you think I should just move these to required, let me know an I'm=20
fine with that. (as in, DT documents HW, not software)


> > +Sub-nodes
> > +---------
> > +
> > +The child nodes of the pin controller node describe a pin multiplexing
> > +function or a GPIO controller alternatively.
>=20
> But the parent is already a GPIO controller. This needs to be fully
> defined.

Now that I read this, I think my wording was off (I was borrowing text=20
for other files).

How about this:

The child nodes of the pin controller designate pins to be used for
specific peripheral functions or as GPIO.


Chris
