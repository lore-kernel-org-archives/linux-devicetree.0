From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: add mtk-timer bindings
Date: Wed, 21 May 2014 10:21:44 -0700
Message-ID: <57d6737a-47c8-4297-b668-65bbe6e00369@BY2FFO11FD028.protection.gbl>
References: <1400689583-21119-1-git-send-email-matthias.bgg@gmail.com>
 <1948139.7c1AZ80ZQt@phil>
 <3a9b6824-e088-4774-b125-7a33b5a895dc@BN1AFFO11FD022.protection.gbl>
 <1615424.OJcNQb1ONt@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1615424.OJcNQb1ONt@phil>
Sender: linux-doc-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko.stuebner@bq.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-05-21 at 07:18PM +0200, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 21. Mai 2014, 09:53:57 schrieb S=C3=B6ren Brinkmann:
> > On Wed, 2014-05-21 at 06:54PM +0200, Heiko St=C3=BCbner wrote:
> > > Am Mittwoch, 21. Mai 2014, 09:34:10 schrieb S=C3=B6ren Brinkmann:
> > > > Hi Matthias,
> > > >=20
> > > > On Wed, 2014-05-21 at 06:26PM +0200, Matthias Brugger wrote:
> > > > > +		compatible =3D "mediatek,mtk6577-timer";
> > > > > +		reg =3D <0x10008000 0x80>;
> > > > > +		interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > > > > +		clocks =3D <&system_clk>, <&rtc_clk>;
> > > > > +		clock-names =3D "system-clk", "rtc-clk";
> > > >=20
> > > > I'm still not convinced that the timer IP calls its clock input=
s this
> > > > way, but well.
> > >=20
> > > Maybe this might convince you ;-)
> > >=20
> > > "The GPT includes 5 32-bit timers and one 64-bit timer. Each time=
r has 4
> > > operation modes, which are ONE-SHOT,  REPEAT,  KEEP-GO and  FREER=
UN, and
> > > can operate on one of the 2 clock sources, RTC clock (32.768kHz) =
and
> > > system clock (13MHz)."
> >=20
> > Is this copied from the timer data sheet or the SOC documentation?
>=20
> That is from the processor datasheet containing the timer documentati=
on.
> I don't think it's customary for soc vendors to provide additional in=
dividual=20
> documentation for self-developed IPs contained in a SoC.

May be, but that is what might create the problem I'm talking about. Th=
e
next generation SOC using the same IP may use different clocks to
drive it. Now you're stuck with RTC and system clock as names, but they
don't apply to the latest integration anymore. That's why I advocate
using the IP's naming for its clock signals as opposed to the SOC's
clock names.
So, my concern is still standing. But I see, that this might not be
resolvable, in case such information is not available. Nevertheless,
I see the currently used names as implementation details of the SOC
and not a property of the here described timer IP. But might be that
this is as good as it gets.

	S=C3=B6ren
