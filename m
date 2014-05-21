From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: add mtk-timer bindings
Date: Wed, 21 May 2014 09:53:57 -0700
Message-ID: <3a9b6824-e088-4774-b125-7a33b5a895dc@BN1AFFO11FD022.protection.gbl>
References: <1400689583-21119-1-git-send-email-matthias.bgg@gmail.com>
 <1400689583-21119-3-git-send-email-matthias.bgg@gmail.com>
 <63a3ee29-aa23-4137-9c0c-5b2bdd75a68f@BN1BFFO11FD014.protection.gbl>
 <1948139.7c1AZ80ZQt@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1948139.7c1AZ80ZQt@phil>
Sender: linux-doc-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko.stuebner@bq.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-05-21 at 06:54PM +0200, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 21. Mai 2014, 09:34:10 schrieb S=C3=B6ren Brinkmann:
> > Hi Matthias,
> >=20
> > On Wed, 2014-05-21 at 06:26PM +0200, Matthias Brugger wrote:
> > > Add binding documentation for the General Porpose Timer driver of
> >=20
> > Typo: Purpose
> >=20
> > > the Mediatek SoCs.
> > >=20
> > > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > ---
> > >=20
> > >  .../devicetree/bindings/timer/mediatek,mtk-timer.txt   | 18
> > >  ++++++++++++++++++ 1 file changed, 18 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt>=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > > b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt =
new file
> > > mode 100644
> > > index 0000000..7d909f7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.=
txt
> > > @@ -0,0 +1,18 @@
> > > +Mediatek MT6577, MT6572 and MT6589 Timers
> > > +---------------------------------------
> > > +
> > > +Required properties:
> > > +- compatible: Should be "mediatek,mtk6577-timer"
> > > +- reg: Should contain location and length for timers register.
> > > +- clocks: Clocks driving the timer hardware. This list shoud inc=
lude two
> > > +	clocks. The order is system clock and as second clock the RTC c=
lock.
> > > +
> > > +Examples:
> > > +
> > > +	timer {
> >=20
> > The node name should be timer@0x10008000
>=20
> I think the more commonly used variant is
>=20
> 	timer@10008000
>=20
> without the 0x. While some dts files really use @0x they are in the m=
inority.

You're right.

>=20
>=20
> >=20
> > > +		compatible =3D "mediatek,mtk6577-timer";
> > > +		reg =3D <0x10008000 0x80>;
> > > +		interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > > +		clocks =3D <&system_clk>, <&rtc_clk>;
> > > +		clock-names =3D "system-clk", "rtc-clk";
> >=20
> > I'm still not convinced that the timer IP calls its clock inputs th=
is
> > way, but well.
>=20
> Maybe this might convince you ;-)
>=20
> "The GPT includes 5 32-bit timers and one 64-bit timer. Each timer ha=
s 4=20
> operation modes, which are ONE-SHOT,  REPEAT,  KEEP-GO and  FREERUN, =
and can=20
> operate on one of the 2 clock sources, RTC clock (32.768kHz) and syst=
em clock=20
> (13MHz)."

Is this copied from the timer data sheet or the SOC documentation?

	S=C3=B6ren
