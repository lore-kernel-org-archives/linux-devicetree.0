From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] pinctrl: Enable "power-source" to be extracted from DT files
Date: Fri, 30 May 2014 16:31:34 +0200
Message-ID: <1687581.SB5xYE3yEq@phil>
References: <CACRpkdZyLxMTSygRP6pD-mxghQ_D6tQ821tvn8GYw0Rnh9hZoQ@mail.gmail.com> <CACRpkdYR9cZOnG2r3Kh027LNKgsDJqxL0J9Gryu+JHXacTNHbQ@mail.gmail.com> <1401435691.13544.3.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401435691.13544.3.camel@iivanov-dev>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 30. Mai 2014, 10:41:31 schrieb Ivan T. Ivanov:
> On Wed, 2014-05-28 at 10:48 +0200, Linus Walleij wrote:
> > On Wed, May 28, 2014 at 10:36 AM, Heiko St=FCbner <heiko@sntech.de>=
 wrote:
> > > Am Mittwoch, 28. Mai 2014, 10:15:43 schrieb Linus Walleij:
> > >> On Tue, May 27, 2014 at 3:09 PM, Heiko St=FCbner <heiko@sntech.d=
e> wrote:
> > >> > Am Dienstag, 27. Mai 2014, 09:27:36 schrieb Ivan T. Ivanov:
> > >> >> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> > >> >>=20
> > >> >> Add "power-source" property to generic options used for DT pa=
rsing
> > >> >> files.
> > >> >> This  enables drivers, which use generic pin configurations, =
to get
> > >> >> the
> > >> >> value passed to this property.
> > >> >=20
> > >> > I think the main problem here is, that pinconf-generic.h defin=
es the
> > >> > power-
> > >> > source as having a "custom format". With DT as a hardware
> > >> > description,
> > >> > implementaton specific values do not work well - instead it sh=
ould
> > >> > have a
> > >> > regular unit-value.
> > >> >=20
> > >> > For the power-source I think volts could work well - as this i=
s the
> > >> > main
> > >> > use- case for pinctrl I know. The regulator-binding uses micro=
volts,
> > >> > maybe it would be good use a similar unit.
> > >>=20
> > >> (...)
> > >>=20
> > >> >         pcfg_1v8 {
> > >> >        =20
> > >> >                 power-source =3D <1800000>;
> > >> >        =20
> > >> >         };
> > >>=20
> > >> I don't think this is what it's meant for actually. In this case=
 the
> > >> thing
> > >> would be modeled as a regulator rather than some pin control opt=
ion I
> > >> guess?
> > >>=20
> > >> I think it's more like a selector, such as found on old amplifie=
rs,
> > >> input source A, B or C? So it's just some discrete number.
> > >=20
> > > as I said, you know this better than me ;-)
> > >=20
> > > I was thinking more of these io-voltages, where one can select be=
tween
> > > say 1.8 and 3.3V for the pins.
> > >=20
> > > I have this somewhere on my todo list for the rockchips too.
> > >=20
> > > So essentially the pinctrl driver [as it is a pin-group specific
> > > setting]
> > > should just export regulators for these voltage settings, without
> > > touching the pinconfig itself, right?
> >=20
> > Hm hm hm.
> >=20
> > I am a bit in the blue actually.
> >=20
> > I think we need to have a discussion with Mark Brown on how to
> > handle this.
> >=20
> > We have previously had the case of MMC/SD level-shifters, where
> > a certain setting gives a certain level of signals out, and another
> > setting
> > gives another level. Like two discrete levels.
> >=20
> > So we modeled that as a regulator provider inside the pin control
> > driver eventually, see sh-pfc/pfc-sh73a0.c
> >=20
> > But this is different: it is the power of the pin itself.
> >=20
> > I can think of a "padring regulator" hooking in as part of the pin =
state
> > but have no clear idea on how to actually do that. We need some
> > coding I think.
>=20
> In my case this is just a switch, which can select from different pow=
er
> sources and these sources are external from the chip. So I can't know
> a priory what the levels are and hard code them inside the driver.

Yep, that is exactly what Linus described as use-case too ... I was sim=
ply=20
thinking in the wrong direction :-)

Heiko
