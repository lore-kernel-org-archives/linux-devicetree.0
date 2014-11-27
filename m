From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] arm64: ARM: Fix the Generic Timers interrupt active
 level description
Date: Thu, 27 Nov 2014 15:34:54 +0000
Message-ID: <20141127153453.GR828@e106497-lin.cambridge.arm.com>
References: <1417099005-18638-1-git-send-email-Liviu.Dudau@arm.com>
 <5477389A.8010606@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5477389A.8010606@arm.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <robherring2@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Will Deacon <Will.Deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 02:43:38PM +0000, Marc Zyngier wrote:
> On 27/11/14 14:36, Liviu Dudau wrote:
> > The Cortex-A5x TRM states in paragraph "9.2 Generic Timer functiona=
l
> > description" that generic timers provide an active-LOW interrupt
> > output. Fix the device trees to correctly describe this.
> >=20
> > While doing this update the CPU mask to match the number of describ=
ed
> > CPUs as well.
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > ---
> >=20
> > Arnd, Olof: This is on top of linux-next/master as it patches the J=
uno
> > as well as all the other ARM DTs.
> >=20
> >  arch/arm64/boot/dts/arm/foundation-v8.dts  | 8 ++++----
> >  arch/arm64/boot/dts/arm/juno.dts           | 8 ++++----
> >  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts | 8 ++++----
> >  3 files changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64=
/boot/dts/arm/foundation-v8.dts
> > index 4a06090..27f3296 100644
> > --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
> > +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
> > @@ -78,10 +78,10 @@
> > =20
> >  	timer {
> >  		compatible =3D "arm,armv8-timer";
> > -		interrupts =3D <1 13 0xff01>,
> > -			     <1 14 0xff01>,
> > -			     <1 11 0xff01>,
> > -			     <1 10 0xff01>;
> > +		interrupts =3D <1 13 0xf08>,
> > +			     <1 14 0xf08>,
> > +			     <1 11 0xf08>,
> > +			     <1 10 0xf08>;
> >  		clock-frequency =3D <100000000>;
> >  	};
> > =20
> > diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts=
/arm/juno.dts
> > index 097ecc4..cb3073e 100644
> > --- a/arch/arm64/boot/dts/arm/juno.dts
> > +++ b/arch/arm64/boot/dts/arm/juno.dts
> > @@ -98,10 +98,10 @@
> > =20
> >  	timer {
> >  		compatible =3D "arm,armv8-timer";
> > -		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_ED=
GE_RISING)>,
> > -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING=
)>,
> > -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING=
)>,
> > -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING=
)>;
> > +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LE=
VEL_LOW)>,
> > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
,
> > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
,
> > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>=
;
> >  	};
> > =20
> >  	pmu {
> > diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm6=
4/boot/dts/arm/rtsm_ve-aemv8a.dts
> > index 572005e..efc59b3 100644
> > --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> > +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> > @@ -81,10 +81,10 @@
> > =20
> >  	timer {
> >  		compatible =3D "arm,armv8-timer";
> > -		interrupts =3D <1 13 0xff01>,
> > -			     <1 14 0xff01>,
> > -			     <1 11 0xff01>,
> > -			     <1 10 0xff01>;
> > +		interrupts =3D <1 13 0xf08>,
> > +			     <1 14 0xf08>,
> > +			     <1 11 0xf08>,
> > +			     <1 10 0xf08>;
> >  		clock-frequency =3D <100000000>;
> >  	};
> > =20
> >=20
>=20
> Sorry, but that's wrong. Despite the *cores* having an level-low outp=
ut,
> the GIC only triggers on *level-high*. Yes, there is probably an
> inverter in between.

BTW, should I also update the bindings example to get this right?

Regards,
Liviu

>=20
> 	M.
> --=20
> Jazz is not dead. It just smells funny...
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
