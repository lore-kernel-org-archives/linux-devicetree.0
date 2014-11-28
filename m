From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2] arm64: ARM: Fix the Generic Timers interrupt active
 level description
Date: Fri, 28 Nov 2014 10:38:43 +0000
Message-ID: <20141128103843.GW828@e106497-lin.cambridge.arm.com>
References: <1417105283-19575-1-git-send-email-Liviu.Dudau@arm.com>
 <54776FE0.8030600@arm.com>
 <20141128111252.4a6e8892@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141128111252.4a6e8892@xhacker>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: Marc Zyngier <Marc.Zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 28, 2014 at 03:12:52AM +0000, Jisheng Zhang wrote:
> Dear Marc and Liviu,
>=20
> On Thu, 27 Nov 2014 10:39:28 -0800
> Marc Zyngier <marc.zyngier@arm.com> wrote:
>=20
> > On 27/11/14 16:21, Liviu Dudau wrote:
> > > The Cortex-A5x TRM states in paragraph "9.2 Generic Timer functio=
nal
> > > description" that generic timers provide a level not edge interru=
pt
> > > output. Fix the device trees to correctly describe this.
> > >=20
> > > While doing this update the CPU mask to match the number of descr=
ibed
> > > CPUs as well as the DT bindings documentation for Generic Timers.
> > >=20
> > > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >=20
> > Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> >=20
> > 	M.
> >=20
> > > ---
> > >=20
> > > Arnd, Olof: This is on top of linux-next/master as it patches Jun=
o's
> > > as well as all the other ARM DTs.
> > >=20
> > > --
> > >=20
> > >  Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++---=
-
> > >  arch/arm64/boot/dts/arm/foundation-v8.dts            | 8 ++++---=
-
> > >  arch/arm64/boot/dts/arm/juno.dts                     | 8 ++++---=
-
> > >  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts           | 8 ++++---=
-
> > >  4 files changed, 16 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt
> > > b/Documentation/devicetree/bindings/arm/arch_timer.txt index
> > > 37b2caf..6d2aa87 100644 ---
> > > a/Documentation/devicetree/bindings/arm/arch_timer.txt +++
> > > b/Documentation/devicetree/bindings/arm/arch_timer.txt @@ -27,10 =
+27,10
> > > @@ Example: timer {
> > >  		compatible =3D "arm,cortex-a15-timer",
> > >  			     "arm,armv7-timer";
> > > -		interrupts =3D <1 13 0xf08>,
> > > -			     <1 14 0xf08>,
> > > -			     <1 11 0xf08>,
> > > -			     <1 10 0xf08>;
> > > +		interrupts =3D <1 13 0xf04>,
> > > +			     <1 14 0xf04>,
> > > +			     <1 11 0xf04>,
> > > +			     <1 10 0xf04>;
> > >  		clock-frequency =3D <100000000>;
> > >  	};
> > > =20
>=20
> Does it mean we also need to fix the interrupt level description unde=
r
> arch/arm/boot/dts? I found they are also wrong or I misunderstand som=
ething?

Hi Jisheng,

It looks like Marc and I managed to confuse ourselves. The TRM for GIC-=
500 and
GIC-400 (basically covering most of GICv1 and > GICv2) clearly says tha=
t for *PPIs*
the level triggered interrupts are active-LOW.

So, this patch is invalid and my v1 version is correct, but Marc tells =
that in
that case the GIC driver needs patching (which I'm going to look into).

Best regards,
Liviu

>=20
> Thanks,
> Jisheng
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
