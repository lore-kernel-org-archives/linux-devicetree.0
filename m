From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 2/5] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Date: Thu, 26 Sep 2019 14:04:23 +0000
Message-ID: <AM5PR1001MB099405D4A0C06CD6BF2886E880860@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994ABEF9C32BFB7BEA099B680840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190925155151.75uaxfiiei3i23tz@pengutronix.de>
 <AM5PR1001MB09941810C3AE97110DD82E0F80870@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190926080956.a3k2z4gf3n6m3n4s@pengutronix.de>
 <AM5PR1001MB09944C0F9A4F547BF9E175CF80860@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190926114354.qvv2rs7mc4xh6lkp@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926114354.qvv2rs7mc4xh6lkp@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, "broonie@kernel.org" <broonie@kernel.org>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Support Opensource <Support.Opensource@diasemi.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26 September 2019 12:44, Marco Felsch wrote:

> On 19-09-26 10:17, Adam Thomson wrote:
> > On 26 September 2019 09:10, Marco Felsch wrote:
> >
> > > On 19-09-25 16:18, Adam Thomson wrote:
> > > > On 25 September 2019 16:52, Marco Felsch wrote:
> > > >
> > > > > Hi Adam,
> > > > >
> > > > > On 19-09-24 09:23, Adam Thomson wrote:
> > > > > > On 17 September 2019 13:43, Marco Felsch wrote:
> > > > > >
> > > > > > > Add the documentation which describe the voltage selection gp=
io
> > > support.
> > > > > > > This property can be applied to each subnode within the 'regu=
lators'
> > > > > > > node so each regulator can be configured differently.
> > > > > > >
> > > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/mfd/da9062.txt | 9 +++++++=
++
> > > > > > >  1 file changed, 9 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > index edca653a5777..9d9820d8177d 100644
> > > > > > > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > @@ -66,6 +66,15 @@ Sub-nodes:
> > > > > > >    details of individual regulator device can be found in:
> > > > > > >    Documentation/devicetree/bindings/regulator/regulator.txt
> > > > > > >
> > > > > > > +  Optional regulator device-specific properties:
> > > > > > > +  - dlg,vsel-sense-gpios : The GPIO reference which should b=
e used
> by
> > > the
> > > > > > > +    regulator to switch the voltage between active/suspend v=
oltage
> > > settings.
> > > > > If
> > > > > > > +    the signal is active the active-settings are applied els=
e the suspend
> > > > > > > +    settings are applied. Attention: Sharing the same gpio f=
or other
> > > purposes
> > > > > > > +    or across multiple regulators is possible but the gpio s=
ettings must
> be
> > > the
> > > > > > > +    same. Also the gpio phandle must refer to to the dlg,da9=
062-gpio
> > > device
> > > > > > > +    other gpios are not allowed and make no sense.
> > > > > > > +
> > > > > >
> > > > > > Should we not use the binding names that are defined in 'gpio-
> > > regulator.yaml'
> > > > > as
> > > > > > these seem to be generic and would probably serve the purpose h=
ere?
> > > > >
> > > > > Hm.. as the description says:
> > > > >
> > > > > 8<--------------------------------------------------
> > > > > gpios:
> > > > >    description: Array of one or more GPIO pins used to select the
> > > > >    regulator voltage/current listed in "states".
> > > > > 8<--------------------------------------------------
> > > > >
> > > > > But we don't have a "states" property and we can't select between
> > > > > voltage or current.
> > > >
> > > > Yes I think I was at cross purposes when I made this remark. The bi=
ndings
> there
> > > > describe the GPOs that are used to enable/disable and set voltage/c=
urrent
> for
> > > > regulators and the supported voltage/current levels that can be con=
figured
> in
> > > > this manner. What you're describing is the GPI for DA9061/2. If you=
 look at
> > > > GPIO handling in existing regulator drivers I believe they all deal=
 with
> external
> > > > GPOs that are configured to enable/disable and set voltage/current =
limits
> > > rather
> > > > than the GPI on the PMIC itself. That's why I'm thinking that the
> configurations
> > > > you're doing here should actually be in a pinctrl or GPIO driver.
> > >
> > > That's true, the common gpio bindings are from the view of the
> > > processor, e.g. which gpio must the processor drive to enable/switch =
the
> > > regualtor. So one reasone more to use a non-common binding.
> > >
> > > Please take a look on my other comment I made :) I don't use the
> > > gpio-alternative function. I use it as an input.
> >
> > I know in the datasheet this isn't marked as an alternate function spec=
ifically
> > but to me having regulator control by the chip's own GPI is an alternat=
ive
> > function for that GPIO pin, in the same way a specific pin can be used =
for
> > SYS_EN or Watchdog control. It's a dedicated purpose rather than being =
a
> normal
> > GPI.
>=20
> Nope, SYS_EN or Watchdog is a special/alternate function and not a
> normal input.

Having spoken with our HW team there's essentially no real difference.

>=20
> > See the following as an example of what I'm suggesting:
> >
> >
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/b=
indin
> gs/pinctrl/pinctrl-palmas.txt
> >
> > You could then pass the pinctrl information to the regulator driver and=
 use
> > that rather than having device specific bindings for this. That's at le=
ast my
> > current interpretation of this anyway.
>=20
> For me pinctrl decides which function should be assigned to a pin. So in
> our case this would be:
>   - alternate
>   - gpo
>   - gpi
>=20
> In our use-case it is a gpi..

It's not being used as a normal GPI as such. It's being used to enable/disa=
ble
the regulator so I disagree.

>=20
> An other reason why pinctrl seems not be the right solution is that the
> regulator must be configured to use this gpi. This decision can't be
> made globally because each regulator can be configured differently.. For
> me its just a local gpio.

You'd pass pinctrl information, via DT, to the regulator driver so it can s=
et
accordingly. At least that's my take here, unless I'm missing something. Th=
e
regulator driver would be the consumer and could set the regulator control
accordingly.

At the end of the day I'm not the gatekeeper here so I think Mark's input i=
s
necessary as he will likely have a view on how this should be done. I appre=
ciate
the work you've done here but I want to be sure we have a generic solution
as this would also apply to DA9063 and possibly other devices too.

Have added Mark to the 'To' in this e-mail thread so he might see it.
>=20
> Regards,
>   Marco
>=20
> > >
> > > Regards,
> > >   Marco
> > >
> > >
> > > > I'd be interested in hearing Mark's view on this though as he has f=
ar more
> > > > experience in this area than I do.
> > > >
> > > > >
> > > > > Regards,
> > > > >   Marco
> > > > >
> > > > > > >  - rtc : This node defines settings required for the Real-Tim=
e Clock
> > > associated
> > > > > > >    with the DA9062. There are currently no entries in this bi=
nding,
> however
> > > > > > >    compatible =3D "dlg,da9062-rtc" should be added if a node =
is created.
> > > > > > > --
> > > > > > > 2.20.1
> > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Pengutronix e.K.                           |                     =
        |
> > > > > Industrial Linux Solutions                 | http://www.pengutron=
ix.de/  |
> > > > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-2069=
17-0
> |
> > > > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-2069=
17-5555 |
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
