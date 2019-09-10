From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Date: Tue, 10 Sep 2019 10:21:32 +0000
Message-ID: <DB7PR04MB4490F16B6EB5BBE4FE2472218FB60@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190903061853.19793-1-biwen.li@nxp.com>
 <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
 <20190903173604.GA18177@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903173604.GA18177@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Rob Herring' <robh@kernel.org>, Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Leo Li <leoyang.li@nxp.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

> Caution: EXT Email
>=20
> On Tue, Sep 03, 2019 at 11:37:01AM +0200, Martin Fuzzey wrote:
> > On 03/09/2019 08:18, Biwen Li wrote:
> > > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > index 94adc1cf93d9..588f688b30d1 100644
> > > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > @@ -8,10 +8,39 @@ Required properties:
> > >   Optional properties:
> > >   - interrupts: IRQ line for the RTC (not implemented).
> > > +- interrupt-output-pin: The interrupt output pin must be
> > > +  "INTA" or "INTB", default value is "INTA"
> > > +
> >
> >
> > The hardware has 2 interrupt pins which can be mapped to various
> > interrupt sources (alarm1, alarm2, periodic, ...)
> >
> > Currently the driver only supports alarm1.
> >
> > It is even possible to use both pins for the same interrupt (eg if
> > INTA were wired to the SoC, INTB to a PMIC and both used for alarm...)
> >
> >
> > So maybe it would be better to have
> >
> > alarm1-interrupt-output-pin: The interrupt output pin used for the
> > alarm function. Must be "INTA", "INTB" or "BOTH"
>=20
> That's a property per source. 2 properties possible sources (either a mas=
k or list)
> would be my preference.
>=20
> Also, whatever you end up with needs a vendor prefix.
>=20
> >
> > Then, if and when other types of interrupts are supported by the
> > driver new properties could be added for them.
> >
> >
> >
> > > +- quartz-load-femtofarads: The internal capacitor to select for the =
quartz:
> > > +   PCF85263_QUARTZCAP_7pF          [0]
> > > +   PCF85263_QUARTZCAP_6pF          [1]
> > > +   PCF85263_QUARTZCAP_12p5pF       [2] DEFAULT
> > > +
> >
> >
> > The standard DT property "quartz-load-femtofarads" takes the real
> > physical value in femto Farads ie values should be 7000, 6000, 12500 wi=
thout
> defines.
>=20
> I believe I said this on the last version.
Yes, I will fix it in v4.
>=20
> >
> >
> > > +- nxp,quartz-drive-strength: Drive strength for the quartz:
> > > +   PCF85263_QUARTZDRIVE_100ko      [0] DEFAULT
> > > +   PCF85263_QUARTZDRIVE_60ko       [1]
> > > +   PCF85263_QUARTZDRIVE_500ko      [2]
> > > +
> >
> >
> > Not sure about this.
> >
> > Wouldn't it be better to either use a real impedence value in ohms
> > (like load property above, even though it is a vendor specific value)
> > rather than a define, or defines for "Low, Medium, High"?
> >
> >
> > Martin
> >
> >
