From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] pinctrl: Enable "power-source" to be extracted from DT files
Date: Wed, 28 May 2014 10:36:17 +0200
Message-ID: <1943407.eJZOu7V4pT@phil>
References: <CACRpkdZyLxMTSygRP6pD-mxghQ_D6tQ821tvn8GYw0Rnh9hZoQ@mail.gmail.com> <2480893.UEqfxe8meR@phil> <CACRpkdbaWYgku0_n5CqGU8DAFnn-5jEJ64Mfh9fixB4mRPnfwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbaWYgku0_n5CqGU8DAFnn-5jEJ64Mfh9fixB4mRPnfwg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 28. Mai 2014, 10:15:43 schrieb Linus Walleij:
> On Tue, May 27, 2014 at 3:09 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > Am Dienstag, 27. Mai 2014, 09:27:36 schrieb Ivan T. Ivanov:
> >> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> >>=20
> >> Add "power-source" property to generic options used for DT parsing=
 files.
> >> This  enables drivers, which use generic pin configurations, to ge=
t the
> >> value passed to this property.
> >=20
> > I think the main problem here is, that pinconf-generic.h defines th=
e
> > power-
> > source as having a "custom format". With DT as a hardware descripti=
on,
> > implementaton specific values do not work well - instead it should =
have a
> > regular unit-value.
> >=20
> > For the power-source I think volts could work well - as this is the=
 main
> > use- case for pinctrl I know. The regulator-binding uses microvolts=
,
> > maybe it would be good use a similar unit.
>=20
> (...)
>=20
> >         pcfg_1v8 {
> >        =20
> >                 power-source =3D <1800000>;
> >        =20
> >         };
>=20
> I don't think this is what it's meant for actually. In this case the =
thing
> would be modeled as a regulator rather than some pin control option I
> guess?
>=20
> I think it's more like a selector, such as found on old amplifiers,
> input source A, B or C? So it's just some discrete number.

as I said, you know this better than me ;-)

I was thinking more of these io-voltages, where one can select between =
say 1.8=20
and 3.3V for the pins.

I have this somewhere on my todo list for the rockchips too.

So essentially the pinctrl driver [as it is a pin-group specific settin=
g]=20
should just export regulators for these voltage settings, without touch=
ing the=20
pinconfig itself, right?


Thanks
Heiko

