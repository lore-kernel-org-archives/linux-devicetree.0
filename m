From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/3] dt-bindings: document gpio-charger bindings
Date: Wed, 12 Mar 2014 15:57:18 +0100
Message-ID: <4446481.1MqT47xhP8@phil>
References: <12569216.pGctOhkhxz@phil> <2194340.F9etmr5mIo@phil> <CAL_JsqKoOhHpJ_OL23WbitQbiJJKLpWrtezT824FP0qtZ2xrEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKoOhHpJ_OL23WbitQbiJJKLpWrtezT824FP0qtZ2xrEg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Mittwoch, 12. M=E4rz 2014, 09:28:46 schrieb Rob Herring:
> On Wed, Mar 12, 2014 at 8:46 AM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > From: Heiko Stuebner <heiko.stuebner@bq.com>
> >=20
> > This documents the binding for the gpio-charger power-supply.
>=20
> How does this relate to what's documented in power_supply.txt and
> charger-manager.txt? Both have references to USB charging. Doesn't
> this need some connection to a battery node?

Yep, the gpio-charger takes the position of the "some,usb-charger" from=
=20
power_supply.txt .

       usb_charger: charger {
               compatible =3D "gpio-charger";
               charger-type =3D "usb-sdp";
               gpios =3D <&gpf0 2 0 0 0>;
       }

       battery {
               power-supplies =3D <&usb_charger>;
       };


I guess the binding doc could reflect this.


I haven't deeply looked into what charger-manager does, bit it seems to=
 be a=20
layer on top of chargers and batteries, controlling them. So it seems t=
o be=20
used with more intelligent components.

My setup using gpio-charger for example is vastly simpler, it's just a =
gpio=20
reporting charger present (for gpio-charger), an adc reporting the batt=
ery=20
voltage and another gpio reporting the charging state (which is already=
=20
handled in generic-adc-battery, but needs a dt binding too).


Heiko

> > Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
> > ---
> >=20
> >  .../bindings/power_supply/gpio-charger.txt         | 23
> >  ++++++++++++++++++++++ 1 file changed, 23 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/power_supply/gpio-charger.txt>=20
> > diff --git
> > a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> > b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt n=
ew
> > file mode 100644
> > index 0000000..fad87a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power_supply/gpio-charger.t=
xt
> > @@ -0,0 +1,23 @@
> > +gpio-charger
> > +
> > +Required properties :
> > + - compatible : "gpio-charger"
> > + - gpios : GPIO indicating the charger presence.
> > +   See GPIO binding in bindings/gpio/gpio.txt .
> > + - charger-type : power supply type, one of
> > +     unknown
> > +     battery
> > +     ups
> > +     mains
> > +     usb-sdp (USB standard downstream port)
> > +     usb-dcp (USB dedicated charging port)
> > +     usb-cdp (USB charging downstream port)
> > +     usb-aca (USB accessory charger adapter)
> > +
> > +Example:
> > +
> > +       charger {
> > +               compatible =3D "gpio-charger";
> > +               charger-type =3D "usb-sdp";
> > +               gpios =3D <&gpf0 2 0 0 0>;
> > +       }
> > --
> > 1.8.5.3
