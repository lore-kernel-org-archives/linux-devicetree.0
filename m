From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2] pinctrl: Enable "power-source" to be extracted from
 DT files
Date: Fri, 30 May 2014 10:41:31 +0300
Message-ID: <1401435691.13544.3.camel@iivanov-dev>
References: <CACRpkdZyLxMTSygRP6pD-mxghQ_D6tQ821tvn8GYw0Rnh9hZoQ@mail.gmail.com>
	 <2480893.UEqfxe8meR@phil>
	 <CACRpkdbaWYgku0_n5CqGU8DAFnn-5jEJ64Mfh9fixB4mRPnfwg@mail.gmail.com>
	 <1943407.eJZOu7V4pT@phil>
	 <CACRpkdYR9cZOnG2r3Kh027LNKgsDJqxL0J9Gryu+JHXacTNHbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYR9cZOnG2r3Kh027LNKgsDJqxL0J9Gryu+JHXacTNHbQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-05-28 at 10:48 +0200, Linus Walleij wrote:
> On Wed, May 28, 2014 at 10:36 AM, Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
> > Am Mittwoch, 28. Mai 2014, 10:15:43 schrieb Linus Walleij:
> >> On Tue, May 27, 2014 at 3:09 PM, Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >> > Am Dienstag, 27. Mai 2014, 09:27:36 schrieb Ivan T. Ivanov:
> >> >> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> >> >>
> >> >> Add "power-source" property to generic options used for DT pars=
ing files.
> >> >> This  enables drivers, which use generic pin configurations, to=
 get the
> >> >> value passed to this property.
> >> >
> >> > I think the main problem here is, that pinconf-generic.h defines=
 the
> >> > power-
> >> > source as having a "custom format". With DT as a hardware descri=
ption,
> >> > implementaton specific values do not work well - instead it shou=
ld have a
> >> > regular unit-value.
> >> >
> >> > For the power-source I think volts could work well - as this is =
the main
> >> > use- case for pinctrl I know. The regulator-binding uses microvo=
lts,
> >> > maybe it would be good use a similar unit.
> >>
> >> (...)
> >>
> >> >         pcfg_1v8 {
> >> >
> >> >                 power-source =3D <1800000>;
> >> >
> >> >         };
> >>
> >> I don't think this is what it's meant for actually. In this case t=
he thing
> >> would be modeled as a regulator rather than some pin control optio=
n I
> >> guess?
> >>
> >> I think it's more like a selector, such as found on old amplifiers=
,
> >> input source A, B or C? So it's just some discrete number.
> >
> > as I said, you know this better than me ;-)
> >
> > I was thinking more of these io-voltages, where one can select betw=
een say 1.8
> > and 3.3V for the pins.
> >
> > I have this somewhere on my todo list for the rockchips too.
> >
> > So essentially the pinctrl driver [as it is a pin-group specific se=
tting]
> > should just export regulators for these voltage settings, without t=
ouching the
> > pinconfig itself, right?
>=20
> Hm hm hm.
>=20
> I am a bit in the blue actually.
>=20
> I think we need to have a discussion with Mark Brown on how to
> handle this.
>=20
> We have previously had the case of MMC/SD level-shifters, where
> a certain setting gives a certain level of signals out, and another s=
etting
> gives another level. Like two discrete levels.
>=20
> So we modeled that as a regulator provider inside the pin control
> driver eventually, see sh-pfc/pfc-sh73a0.c
>=20
> But this is different: it is the power of the pin itself.
>=20
> I can think of a "padring regulator" hooking in as part of the pin st=
ate
> but have no clear idea on how to actually do that. We need some
> coding I think.
>=20

In my case this is just a switch, which can select from different power
sources and these sources are external from the chip. So I can't know
a priory what the levels are and hard code them inside the driver.

Thanks,
Ivan


