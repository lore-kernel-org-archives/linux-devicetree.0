From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 2/5] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Date: Thu, 26 Sep 2019 10:17:06 +0000
Message-ID: <AM5PR1001MB09944C0F9A4F547BF9E175CF80860@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994ABEF9C32BFB7BEA099B680840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190925155151.75uaxfiiei3i23tz@pengutronix.de>
 <AM5PR1001MB09941810C3AE97110DD82E0F80870@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190926080956.a3k2z4gf3n6m3n4s@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926080956.a3k2z4gf3n6m3n4s@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Support Opensource <Support.Opensource@diasemi.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26 September 2019 09:10, Marco Felsch wrote:

> On 19-09-25 16:18, Adam Thomson wrote:
> > On 25 September 2019 16:52, Marco Felsch wrote:
> >
> > > Hi Adam,
> > >
> > > On 19-09-24 09:23, Adam Thomson wrote:
> > > > On 17 September 2019 13:43, Marco Felsch wrote:
> > > >
> > > > > Add the documentation which describe the voltage selection gpio
> support.
> > > > > This property can be applied to each subnode within the 'regulato=
rs'
> > > > > node so each regulator can be configured differently.
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/mfd/da9062.txt | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > index edca653a5777..9d9820d8177d 100644
> > > > > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > @@ -66,6 +66,15 @@ Sub-nodes:
> > > > >    details of individual regulator device can be found in:
> > > > >    Documentation/devicetree/bindings/regulator/regulator.txt
> > > > >
> > > > > +  Optional regulator device-specific properties:
> > > > > +  - dlg,vsel-sense-gpios : The GPIO reference which should be us=
ed by
> the
> > > > > +    regulator to switch the voltage between active/suspend volta=
ge
> settings.
> > > If
> > > > > +    the signal is active the active-settings are applied else th=
e suspend
> > > > > +    settings are applied. Attention: Sharing the same gpio for o=
ther
> purposes
> > > > > +    or across multiple regulators is possible but the gpio setti=
ngs must be
> the
> > > > > +    same. Also the gpio phandle must refer to to the dlg,da9062-=
gpio
> device
> > > > > +    other gpios are not allowed and make no sense.
> > > > > +
> > > >
> > > > Should we not use the binding names that are defined in 'gpio-
> regulator.yaml'
> > > as
> > > > these seem to be generic and would probably serve the purpose here?
> > >
> > > Hm.. as the description says:
> > >
> > > 8<--------------------------------------------------
> > > gpios:
> > >    description: Array of one or more GPIO pins used to select the
> > >    regulator voltage/current listed in "states".
> > > 8<--------------------------------------------------
> > >
> > > But we don't have a "states" property and we can't select between
> > > voltage or current.
> >
> > Yes I think I was at cross purposes when I made this remark. The bindin=
gs there
> > describe the GPOs that are used to enable/disable and set voltage/curre=
nt for
> > regulators and the supported voltage/current levels that can be configu=
red in
> > this manner. What you're describing is the GPI for DA9061/2. If you loo=
k at
> > GPIO handling in existing regulator drivers I believe they all deal wit=
h external
> > GPOs that are configured to enable/disable and set voltage/current limi=
ts
> rather
> > than the GPI on the PMIC itself. That's why I'm thinking that the confi=
gurations
> > you're doing here should actually be in a pinctrl or GPIO driver.
>=20
> That's true, the common gpio bindings are from the view of the
> processor, e.g. which gpio must the processor drive to enable/switch the
> regualtor. So one reasone more to use a non-common binding.
>=20
> Please take a look on my other comment I made :) I don't use the
> gpio-alternative function. I use it as an input.

I know in the datasheet this isn't marked as an alternate function specific=
ally
but to me having regulator control by the chip's own GPI is an alternative
function for that GPIO pin, in the same way a specific pin can be used for
SYS_EN or Watchdog control. It's a dedicated purpose rather than being a no=
rmal
GPI.

See the following as an example of what I'm suggesting:

https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bin=
dings/pinctrl/pinctrl-palmas.txt

You could then pass the pinctrl information to the regulator driver and use
that rather than having device specific bindings for this. That's at least =
my
current interpretation of this anyway.

>=20
> Regards,
>   Marco
>=20
>=20
> > I'd be interested in hearing Mark's view on this though as he has far m=
ore
> > experience in this area than I do.
> >
> > >
> > > Regards,
> > >   Marco
> > >
> > > > >  - rtc : This node defines settings required for the Real-Time Cl=
ock
> associated
> > > > >    with the DA9062. There are currently no entries in this bindin=
g, however
> > > > >    compatible =3D "dlg,da9062-rtc" should be added if a node is c=
reated.
> > > > > --
> > > > > 2.20.1
> > > >
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           |                         =
    |
> > > Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
