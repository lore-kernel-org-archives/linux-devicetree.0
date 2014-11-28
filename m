From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] arm64: ARM: Fix the Generic Timers interrupt active
 level description
Date: Fri, 28 Nov 2014 11:50:02 +0000
Message-ID: <20141128115002.GZ828@e106497-lin.cambridge.arm.com>
References: <1417099005-18638-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417099005-18638-1-git-send-email-Liviu.Dudau@arm.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <Marc.Zyngier@arm.com>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 02:36:45PM +0000, Liviu Dudau wrote:
> The Cortex-A5x TRM states in paragraph "9.2 Generic Timer functional
> description" that generic timers provide an active-LOW interrupt
> output. Fix the device trees to correctly describe this.
>=20
> While doing this update the CPU mask to match the number of described
> CPUs as well.
>=20
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>

arm-soc maintainers: Please discard my v2 patch as it proved to be the =
wrong fix.
This patch should still be considered for inclusion for v3.19 as it fix=
es the
arm64 DT files.

Marc, care to Ack this patch?

Best regards,
Liviu

> ---
>=20
> Arnd, Olof: This is on top of linux-next/master as it patches the Jun=
o
> as well as all the other ARM DTs.
>=20
>  arch/arm64/boot/dts/arm/foundation-v8.dts  | 8 ++++----
>  arch/arm64/boot/dts/arm/juno.dts           | 8 ++++----
>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/b=
oot/dts/arm/foundation-v8.dts
> index 4a06090..27f3296 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
> +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
> @@ -78,10 +78,10 @@
> =20
>  	timer {
>  		compatible =3D "arm,armv8-timer";
> -		interrupts =3D <1 13 0xff01>,
> -			     <1 14 0xff01>,
> -			     <1 11 0xff01>,
> -			     <1 10 0xff01>;
> +		interrupts =3D <1 13 0xf08>,
> +			     <1 14 0xf08>,
> +			     <1 11 0xf08>,
> +			     <1 10 0xf08>;
>  		clock-frequency =3D <100000000>;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/a=
rm/juno.dts
> index 097ecc4..cb3073e 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -98,10 +98,10 @@
> =20
>  	timer {
>  		compatible =3D "arm,armv8-timer";
> -		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE=
_RISING)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>=
,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>=
,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>=
;
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVE=
L_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
> =20
>  	pmu {
> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/=
boot/dts/arm/rtsm_ve-aemv8a.dts
> index 572005e..efc59b3 100644
> --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> @@ -81,10 +81,10 @@
> =20
>  	timer {
>  		compatible =3D "arm,armv8-timer";
> -		interrupts =3D <1 13 0xff01>,
> -			     <1 14 0xff01>,
> -			     <1 11 0xff01>,
> -			     <1 10 0xff01>;
> +		interrupts =3D <1 13 0xf08>,
> +			     <1 14 0xf08>,
> +			     <1 11 0xf08>,
> +			     <1 10 0xf08>;
>  		clock-frequency =3D <100000000>;
>  	};
> =20
> --=20
> 2.1.3
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
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
