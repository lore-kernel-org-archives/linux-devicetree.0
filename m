From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Date: Fri, 30 Aug 2019 10:11:03 +0000
Message-ID: <DB7PR04MB4490C2664AE88D18D52E4B018FBD0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190830091720.41156-1-biwen.li@nxp.com>
 <20190830094456.GO21922@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830094456.GO21922@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Leo Li <leoyang.li@nxp.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

>=20
> On 30/08/2019 17:17:19+0800, Biwen Li wrote:
> > Add some properties for pcf85263/pcf85363 as follows:
> >   - interrupt-output-pin: string type
> >   - quartz-load-capacitance: integer type
> >   - quartz-drive-strength: integer type
> >   - quartz-low-jitter: bool type
> >   - wakeup-source: bool type
> >
> > Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  .../devicetree/bindings/rtc/pcf85363.txt      | 31
> +++++++++++++++++++
> >  include/dt-bindings/rtc/pcf85363.h            | 15 +++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > index 94adc1cf93d9..d83359990bd7 100644
> > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > @@ -8,10 +8,41 @@ Required properties:
> >  Optional properties:
> >  - interrupts: IRQ line for the RTC (not implemented).
> >
> > +- interrupt-output-pin: The interrupt output pin must be
> > +  "NONE", "INTA" or "INTB", default value is "NONE"
> > +
>=20
> default value can't be none if there is an interrupts property. Also, bot=
h pins
> can be enabled at the same time and this binding would prevent that.
> Finally, it may also be desirable to have some interrupts on one pin and
> other interrupts on another pin e.g. alarms and timestamping on INTA goin=
g
> to the SoC and only alarms on INTB going to a PMIC.
Ok, got it, I will correct it on v2.
>=20
> > +- quartz-load-capacitance: The internal capacitor to select for the qu=
artz:
> > +     PCF85263_QUARTZCAP_7pF          [0]
> > +     PCF85263_QUARTZCAP_6pF          [1]
> > +     PCF85263_QUARTZCAP_12p5pF       [2] DEFAULT
> > +
>=20
> The correct generic property is quartz-load-femtofarads.
I will replace it on v2.
>=20
> > +- quartz-drive-strength: Drive strength for the quartz:
> > +     PCF85263_QUARTZDRIVE_NORMAL     [0] DEFAULT
> > +     PCF85263_QUARTZDRIVE_LOW        [1]
> > +     PCF85263_QUARTZDRIVE_HIGH       [2]
> > +
>=20
> This has to take a value in ohm to be generic and then you don't need the
> include file.
I will adjust it on v2.
>=20
> > +- quartz-low-jitter: Boolean property, if present enables low jitter
> > +mode
> > +  which reduces jitter at the cost of increased power consumption.
> > +
>=20
> I think that property needs to be nxp specific.
I will replace it with nxp,quartz-low-jitter on v2.
>=20
> > +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> > +  independently of the availability of an IRQ line connected to the So=
C.
> > +  This is useful if the IRQ line is connected to a PMIC or other
> > +circuit
> > +  that can power up the device rather than to a normal SOC interrupt.
> > +
>=20
> This is already defined in bindings/power/wakeup-source.txt I guess you c=
an
> simply refer to it.
I will correct it on v2.
>=20
> >  Example:
> >
> >  pcf85363: pcf85363@51 {
> >       compatible =3D "nxp,pcf85363";
> >       reg =3D <0x51>;
> > +
> > +     interrupt-parent =3D <&gpio1>;
> > +     interrupts =3D <18 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +     #include <dt-bindings/rtc/pcf85363.h>
> > +     wakeup-source;
> > +     interrupt-output-pin =3D "INTA";
> > +     quartz-load-capacitance =3D <PCF85363_QUARTZCAP_12p5pF>;
> > +     quartz-drive-strength =3D <PCF85363_QUARTZDRIVE_LOW>;
> > +     quartz-low-jitter;
> >  };
> >
> > diff --git a/include/dt-bindings/rtc/pcf85363.h
> > b/include/dt-bindings/rtc/pcf85363.h
> > new file mode 100644
> > index 000000000000..2c06c28eb5ff
> > --- /dev/null
> > +++ b/include/dt-bindings/rtc/pcf85363.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */ #ifndef
> > +_DT_BINDINGS_RTC_PCF85363_H #define
> _DT_BINDINGS_RTC_PCF85363_H
> > +
> > +/* Quartz capacitance */
> > +#define PCF85363_QUARTZCAP_7pF               0
> > +#define PCF85363_QUARTZCAP_6pF               1
> > +#define PCF85363_QUARTZCAP_12p5pF    2
> > +
> > +/* Quartz drive strength */
> > +#define PCF85363_QUARTZDRIVE_NORMAL  0
> > +#define PCF85363_QUARTZDRIVE_LOW     1
> > +#define PCF85363_QUARTZDRIVE_HIGH    2
> > +
> > +#endif /* _DT_BINDINGS_RTC_PCF85363_H */
> > --
> > 2.17.1
> >
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl
> in.com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C0a2e5b50f8fc45a
> ef6a208d72d2ebe2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C637027551094795780&amp;sdata=3DPMMS6PMBPkuuIYgMJFmtOaoD%
> 2B7fCO3eZvOtlYhTEL5w%3D&amp;reserved=3D0
