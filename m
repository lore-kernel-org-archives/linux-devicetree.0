From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Date: Tue, 3 Sep 2019 02:15:56 +0000
Message-ID: <DB7PR04MB4490460F9C011289CE85A0028FB90@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190830091720.41156-1-biwen.li@nxp.com>
 <5d6d1b79.1c69fb81.29f0d.e042@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d6d1b79.1c69fb81.29f0d.e042@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Leo Li <leoyang.li@nxp.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

>=20
> Caution: EXT Email
>=20
> On Fri, Aug 30, 2019 at 05:17:19PM +0800, Biwen Li wrote:
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
> > +- quartz-load-capacitance: The internal capacitor to select for the qu=
artz:
> > +     PCF85263_QUARTZCAP_7pF          [0]
> > +     PCF85263_QUARTZCAP_6pF          [1]
> > +     PCF85263_QUARTZCAP_12p5pF       [2] DEFAULT
>=20
> We have a common property for this. Use it.
Ok, I will replace it in v2.
>=20
> > +
> > +- quartz-drive-strength: Drive strength for the quartz:
> > +     PCF85263_QUARTZDRIVE_NORMAL     [0] DEFAULT
> > +     PCF85263_QUARTZDRIVE_LOW        [1]
> > +     PCF85263_QUARTZDRIVE_HIGH       [2]
> > +
> > +- quartz-low-jitter: Boolean property, if present enables low jitter
> > +mode
> > +  which reduces jitter at the cost of increased power consumption.
>=20
> These 2  need vendor prefixes.
Okay, I will add vendor prefixes in v2.
>=20
> > +
> > +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> > +  independently of the availability of an IRQ line connected to the So=
C.
> > +  This is useful if the IRQ line is connected to a PMIC or other
> > +circuit
> > +  that can power up the device rather than to a normal SOC interrupt.
> > +
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
