From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner@bq.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: add mtk-timer bindings
Date: Wed, 21 May 2014 19:18:59 +0200
Message-ID: <1615424.OJcNQb1ONt@phil>
References: <1400689583-21119-1-git-send-email-matthias.bgg@gmail.com> <1948139.7c1AZ80ZQt@phil> <3a9b6824-e088-4774-b125-7a33b5a895dc@BN1AFFO11FD022.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <3a9b6824-e088-4774-b125-7a33b5a895dc@BN1AFFO11FD022.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 21. Mai 2014, 09:53:57 schrieb S=F6ren Brinkmann:
> On Wed, 2014-05-21 at 06:54PM +0200, Heiko St=FCbner wrote:
> > Am Mittwoch, 21. Mai 2014, 09:34:10 schrieb S=F6ren Brinkmann:
> > > Hi Matthias,
> > >=20
> > > On Wed, 2014-05-21 at 06:26PM +0200, Matthias Brugger wrote:
> > > > +		compatible =3D "mediatek,mtk6577-timer";
> > > > +		reg =3D <0x10008000 0x80>;
> > > > +		interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > > > +		clocks =3D <&system_clk>, <&rtc_clk>;
> > > > +		clock-names =3D "system-clk", "rtc-clk";
> > >=20
> > > I'm still not convinced that the timer IP calls its clock inputs =
this
> > > way, but well.
> >=20
> > Maybe this might convince you ;-)
> >=20
> > "The GPT includes 5 32-bit timers and one 64-bit timer. Each timer =
has 4
> > operation modes, which are ONE-SHOT,  REPEAT,  KEEP-GO and  FREERUN=
, and
> > can operate on one of the 2 clock sources, RTC clock (32.768kHz) an=
d
> > system clock (13MHz)."
>=20
> Is this copied from the timer data sheet or the SOC documentation?

That is from the processor datasheet containing the timer documentation=
=2E
I don't think it's customary for soc vendors to provide additional indi=
vidual=20
documentation for self-developed IPs contained in a SoC.

