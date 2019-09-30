From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 2/5] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Date: Mon, 30 Sep 2019 09:53:21 +0000
Message-ID: <AM5PR1001MB0994316EA8AD903B2943CE2080820@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994ABEF9C32BFB7BEA099B680840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190925155151.75uaxfiiei3i23tz@pengutronix.de>
 <AM5PR1001MB09941810C3AE97110DD82E0F80870@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190926080956.a3k2z4gf3n6m3n4s@pengutronix.de>
 <AM5PR1001MB09944C0F9A4F547BF9E175CF80860@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190926114354.qvv2rs7mc4xh6lkp@pengutronix.de>
 <AM5PR1001MB099405D4A0C06CD6BF2886E880860@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190926143835.tjv535h4gnfyystk@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926143835.tjv535h4gnfyystk@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, Support Opensource <Support.Opensource@diasemi.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26 September 2019 15:39, Marco Felsch wrote:

> On 19-09-26 14:04, Adam Thomson wrote:
> > On 26 September 2019 12:44, Marco Felsch wrote:
> >
> > > On 19-09-26 10:17, Adam Thomson wrote:
> > > > On 26 September 2019 09:10, Marco Felsch wrote:
> > > >
> > > > > On 19-09-25 16:18, Adam Thomson wrote:
> > > > > > On 25 September 2019 16:52, Marco Felsch wrote:
> > > > > >
> > > > > > > Hi Adam,
> > > > > > >
> > > > > > > On 19-09-24 09:23, Adam Thomson wrote:
> > > > > > > > On 17 September 2019 13:43, Marco Felsch wrote:
> > > > > > > >
> > > > > > > > > Add the documentation which describe the voltage selectio=
n gpio
> > > > > support.
> > > > > > > > > This property can be applied to each subnode within the
> 'regulators'
> > > > > > > > > node so each regulator can be configured differently.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > > > > ---
> > > > > > > > >  Documentation/devicetree/bindings/mfd/da9062.txt | 9
> +++++++++
> > > > > > > > >  1 file changed, 9 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/Documentation/devicetree/bindings/mfd/da9062=
.txt
> > > > > > > > > b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > > > index edca653a5777..9d9820d8177d 100644
> > > > > > > > > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > > > +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> > > > > > > > > @@ -66,6 +66,15 @@ Sub-nodes:
> > > > > > > > >    details of individual regulator device can be found in=
:
> > > > > > > > >    Documentation/devicetree/bindings/regulator/regulator.=
txt
> > > > > > > > >
> > > > > > > > > +  Optional regulator device-specific properties:
> > > > > > > > > +  - dlg,vsel-sense-gpios : The GPIO reference which shou=
ld be
> used
> > > by
> > > > > the
> > > > > > > > > +    regulator to switch the voltage between active/suspe=
nd
> voltage
> > > > > settings.
> > > > > > > If
> > > > > > > > > +    the signal is active the active-settings are applied=
 else the
> suspend
> > > > > > > > > +    settings are applied. Attention: Sharing the same gp=
io for other
> > > > > purposes
> > > > > > > > > +    or across multiple regulators is possible but the gp=
io settings
> must
> > > be
> > > > > the
> > > > > > > > > +    same. Also the gpio phandle must refer to to the dlg=
,da9062-
> gpio
> > > > > device
> > > > > > > > > +    other gpios are not allowed and make no sense.
> > > > > > > > > +
> > > > > > > >
> > > > > > > > Should we not use the binding names that are defined in 'gp=
io-
> > > > > regulator.yaml'
> > > > > > > as
> > > > > > > > these seem to be generic and would probably serve the purpo=
se
> here?
> > > > > > >
> > > > > > > Hm.. as the description says:
> > > > > > >
> > > > > > > 8<--------------------------------------------------
> > > > > > > gpios:
> > > > > > >    description: Array of one or more GPIO pins used to select=
 the
> > > > > > >    regulator voltage/current listed in "states".
> > > > > > > 8<--------------------------------------------------
> > > > > > >
> > > > > > > But we don't have a "states" property and we can't select bet=
ween
> > > > > > > voltage or current.
> > > > > >
> > > > > > Yes I think I was at cross purposes when I made this remark. Th=
e
> bindings
> > > there
> > > > > > describe the GPOs that are used to enable/disable and set
> voltage/current
> > > for
> > > > > > regulators and the supported voltage/current levels that can be
> configured
> > > in
> > > > > > this manner. What you're describing is the GPI for DA9061/2. If=
 you look
> at
> > > > > > GPIO handling in existing regulator drivers I believe they all =
deal with
> > > external
> > > > > > GPOs that are configured to enable/disable and set voltage/curr=
ent
> limits
> > > > > rather
> > > > > > than the GPI on the PMIC itself. That's why I'm thinking that t=
he
> > > configurations
> > > > > > you're doing here should actually be in a pinctrl or GPIO drive=
r.
> > > > >
> > > > > That's true, the common gpio bindings are from the view of the
> > > > > processor, e.g. which gpio must the processor drive to enable/swi=
tch the
> > > > > regualtor. So one reasone more to use a non-common binding.
> > > > >
> > > > > Please take a look on my other comment I made :) I don't use the
> > > > > gpio-alternative function. I use it as an input.
> > > >
> > > > I know in the datasheet this isn't marked as an alternate function =
specifically
> > > > but to me having regulator control by the chip's own GPI is an alte=
rnative
> > > > function for that GPIO pin, in the same way a specific pin can be u=
sed for
> > > > SYS_EN or Watchdog control. It's a dedicated purpose rather than be=
ing a
> > > normal
> > > > GPI.
> > >
> > > Nope, SYS_EN or Watchdog is a special/alternate function and not a
> > > normal input.
> >
> > Having spoken with our HW team there's essentially no real difference.
>
> So I don't have to configure the gpio to alternate to use it as SYS_EN?

Yes you do, but the effect is much the same as manually configuring the GPI=
O as
input, just that the IC does it for you. The regulator control features cou=
ld
well have been done in a similar manner. Guess that was a design choice.

>
> > >
> > > > See the following as an example of what I'm suggesting:
> > > >
> > > >
> > >
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/b=
indin
> > > gs/pinctrl/pinctrl-palmas.txt
> > > >
> > > > You could then pass the pinctrl information to the regulator driver=
 and use
> > > > that rather than having device specific bindings for this. That's a=
t least my
> > > > current interpretation of this anyway.
> > >
> > > For me pinctrl decides which function should be assigned to a pin. So=
 in
> > > our case this would be:
> > >   - alternate
> > >   - gpo
> > >   - gpi
> > >
> > > In our use-case it is a gpi..
> >
> > It's not being used as a normal GPI as such. It's being used to enable/=
disable
> > the regulator so I disagree.
>
> This one is used as voltage-selection. What is a "normal" GPI in your
> point of view?

With the voltage selection and enable/disable control the actual work of
handling the GPI state is all done internally in the IC. There is no contro=
l
required from SW other than setting of initial direction. For a normal GPI
I would expect SW to be involved in the handling of that GPI state, for exa=
mple
as part of a bit banging interface.

>
> > >
> > > An other reason why pinctrl seems not be the right solution is that t=
he
> > > regulator must be configured to use this gpi. This decision can't be
> > > made globally because each regulator can be configured differently.. =
For
> > > me its just a local gpio.
> >
> > You'd pass pinctrl information, via DT, to the regulator driver so it c=
an set
> > accordingly. At least that's my take here, unless I'm missing something=
. The
> > regulator driver would be the consumer and could set the regulator cont=
rol
> > accordingly.
>
> IMHO this is what I have done. I use the gpi so the regulator is the
> consumer. Since the gpi can be used by several regulators for voltage
> selection or enable/disable action this gpi is marked as shared. If I
> got you right than you would do something like for regulatorX.
>
>   pinctrl-node {
>
>   	gpio2 {
> 		func =3D "vsel";
> 	}
>   }
>
> But the gpi(o)2 can also be used to enable/disable a regulatorY if I
> understood the datasheet correctly. I other words:
>
>
>
>          +--> Alternate function
>       /
>   ---+   +--> GPI ----> Edge detection ---> more processing
>    |       |                |
>    |       |                +-----> Regulator control
>    |       |                          |
>    \__  __/ \__________  _______
>       \/               \/
>    pinctrl            gpio
>
> This is how I understood the pinctrl use-case. I configure the pin as
> gpio and then the regulator driver consume a gpio.

How I see it is that you configure the function through pinctrl as
'regulator_switch' or 'regulator_vsel' (or whatever name is deemed sensible=
 to
cover the two types of functionality) and then the pinctrl driver code woul=
d do
the work of requesting and configuring the relevant GPIO as input so it's n=
o
longer available for use as something else (basically what you do in the
regulator driver right now).

I believe you can have more than one consumer of a pinctrl pin so it could =
be
provided to both regulator X and Y to indicate that this is the chosen
functionality of that pin and so the regulator can then be marked as being
controlled by that pin. Using pinctrl also would mean you're using standard
bindings as well rather than something which is device specific.

>
> > At the end of the day I'm not the gatekeeper here so I think Mark's inp=
ut is
> > necessary as he will likely have a view on how this should be done. I a=
ppreciate
> > the work you've done here but I want to be sure we have a generic solut=
ion
> > as this would also apply to DA9063 and possibly other devices too.
>
> Why should this only apply to da9062 devices? IMHO this property can be
> used by any other dlg pmic as well if it is supported. Comments and sugge=
stions
> are welcome so no worries ;)

You're right. You can do the same for DA9063 and other devices potentially.=
 I
would just like to make sure we take the right/agreed approach. Potentially
this could be used in non-Dialog products as well which have similar
functionality.

As I say, Mark is really the gatekeeper so his input is also key in this.

>
> Regards,
>   Marco
>
> > Have added Mark to the 'To' in this e-mail thread so he might see it.
> > >
> > > Regards,
> > >   Marco
> > >
> > > > >
> > > > > Regards,
> > > > >   Marco
> > > > >
> > > > >
> > > > > > I'd be interested in hearing Mark's view on this though as he h=
as far
> more
> > > > > > experience in this area than I do.
> > > > > >
> > > > > > >
> > > > > > > Regards,
> > > > > > >   Marco
> > > > > > >
> > > > > > > > >  - rtc : This node defines settings required for the Real=
-Time Clock
> > > > > associated
> > > > > > > > >    with the DA9062. There are currently no entries in thi=
s binding,
> > > however
> > > > > > > > >    compatible =3D "dlg,da9062-rtc" should be added if a n=
ode is
> created.
> > > > > > > > > --
> > > > > > > > > 2.20.1
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Pengutronix e.K.                           |                 =
            |
> > > > > > > Industrial Linux Solutions                 | http://www.pengu=
tronix.de/  |
> > > > > > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-=
206917-
> 0
> > > |
> > > > > > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-=
206917-5555
> |
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
>
> --
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
