From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Date: Tue, 17 Sep 2019 09:13:24 +0000
Message-ID: <DB7PR04MB4490D48E9773CFDDD2617FF38F8F0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190910104247.13142-1-biwen.li@nxp.com>
 <20190917084504.GD21254@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917084504.GD21254@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Alexandre Belloni' <alexandre.belloni@bootlin.com>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Leo Li <leoyang.li@nxp.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

>=20
> Caution: EXT Email
>=20
> On 10/09/2019 18:42:46+0800, Biwen Li wrote:
> > Add some properties for pcf85263/pcf85363 as follows:
> >   - nxp,rtc-interrupt-type: integer type
> >   - nxp,rtc-interrupt-output-pin: string type
> >   - quartz-load-femtofarads: integer type
> >   - nxp,quartz-drive-strength: integer type
> >   - nxp,quartz-low-jitter: bool type
> >   - wakeup-source: bool type
> >
> > Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v4:
> >       - Drop robust defines in include/dt-bindings/rtc/pcf85363.h
> >       - Add nxp,rtc-interrupt-type property
> >       - Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin
> >
> > Change in v3:
> >       - None
> >
> > Change in v2:
> >       - Replace properties name
> >         quartz-load-capacitance -> quartz-load-femtofarads
> >         quartz-drive-strength -> nxp,quartz-drive-strength
> >         quartz-low-jitter -> nxp,quartz-low-jitter
> >       - Replace drive strength name
> >         PCF85263_QUARTZDRIVE_NORMAL ->
> PCF85263_QUARTZDRIVE_100ko
> >         PCF85263_QUARTZDRIVE_LOW ->
> PCF85263_QUARTZDRIVE_60ko
> >         PCF85263_QUARTZDRIVE_HIGH ->
> PCF85263_QUARTZDRIVE_500ko
> >       - Set default interrupt-output-pin as "INTA"
> >
> >  .../devicetree/bindings/rtc/pcf85363.txt      | 44
> ++++++++++++++++++-
> >  include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
> >  2 files changed, 57 insertions(+), 1 deletion(-)  create mode 100644
> > include/dt-bindings/rtc/pcf85363.h
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > index 94adc1cf93d9..fc1579463657 100644
> > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > @@ -8,10 +8,52 @@ Required properties:
> >  Optional properties:
> >  - interrupts: IRQ line for the RTC (not implemented).
> >
> > +- nxp,rtc-interrupt-type: integer property, represent the interrupt's
> > +  type. Valid values are
> > +  INT_PIE(periodic interrupt enable),
> > +  INT_OIE(offset correction interrupt enable),
> > +  INT_A1IE(alarm1 interrupt enable),
> > +  INT_A2IE(alarm2 interrupt enable),
> > +  INT_TSRIE(timestamp register interrupt enable)
> > +  INT_BSIE(battery switch interrupt enable),
> > +  INT_WDIE(WatchDog interrupt enable,and
> > +  compose these values such as: INT_A1IE | INT_A2IE,
> > +  but currently only support INT_A1IE, default value is INT_A1IE.
> > +  The property and property nxp,rtc-interrupt-output-pin
> > +  work together to generate some interrupts on some pins.
> > +
> > +- nxp,rtc-interrupt-output-pin: The interrupt output pin must be
> > +  "INTA" or "INTB", default value is "INTA". The property and
> > +property
> > +  nxp,rtc-interrupt-type work together to generate some interrupts on
> > +  some pins.
> > +
>=20
> This binding still doesn't work because there may be any combination of
> interrupts on any of the two pins that this binding doesn't allow.
Combination of interrupt maybe need users to select.So it is flexibity.=20
>=20
> > +- quartz-load-femtofarads: The internal capacitor to select for the
> > +quartz,
> > +  expressed in femto Farad (fF). Valid values are 6000, 7000 and 12500=
.
> > +  Default value is 12500fF.
> > +
> > +- nxp,quartz-drive-strength: Drive strength for the quartz,
> > +  expressed in kilo ohms (kOhm) Valid values are 60, 100 and 500.
> > +  Default value is 100kOhm.
> > +
>=20
> It makes more sense to have quartz-drive-strength-ohms as a generic
> property.
Got it, thanks
>=20
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl
> in.com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C34fc927717674d
> 73cd8d08d73b4b577a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C637043067081363670&amp;sdata=3DSXAXKb5qQMf4eXJNB46CGdvh
> oA%2F%2BG2r26yYaC2tEGX0%3D&amp;reserved=3D0
