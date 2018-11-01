From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH] ARM: dtsi: sun8i-r40: add mali node
Date: Thu, 01 Nov 2018 08:52:17 +0100
Message-ID: <1868657.3A2CuZcRV2@jernej-laptop>
References: <20181101073833.2936-1-lothar.felten@gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBNHB5LPAKGQEJUJ6QMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181101073833.2936-1-lothar.felten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lothar Felten <lothar.felten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 01. november 2018 ob 08:38:33 CET je Lothar Felten napisa=
l(a):
> This patch adds a node for the mali 400 GPU of the R40/V40 SoC
>=20
> Signed-off-by: Lothar Felten <lothar.felten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi
> b/arch/arm/boot/dts/sun8i-r40.dtsi index 6f4c9ca5a3ee..ddf765e931f3 10064=
4
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -542,6 +542,31 @@
>=20
>  		};
>=20
> +		mali: gpu@1c40000 {
> +			compatible =3D "allwinner,sun7i-a20-mali", "arm,mali-400";
> +			reg =3D <0x01c40000 0x10000>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "gp",
> +					  "gpmmu",
> +					  "pp0",
> +					  "ppmmu0",
> +					  "pp1",
> +					  "ppmmu1",
> +					  "pmu";
> +			clocks =3D <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
> +			clock-names =3D "bus", "core";
> +			resets =3D <&ccu RST_BUS_GPU>;
> +
> +			assigned-clocks =3D <&ccu CLK_GPU>;
> +			assigned-clock-rates =3D <384000000>;

In previous e-mail I already stated that above 2 lines doesn't belong here.=
=20
Driver is responsible for clock rate management.

> +		};
> +
>  		gmac: ethernet@1c50000 {
>  			compatible =3D "allwinner,sun8i-r40-gmac";
>  			syscon =3D <&ccu>;
> @@ -813,7 +838,8 @@
>  		};
>=20
>  		hdmi_phy: hdmi-phy@1ef0000 {
> -			compatible =3D "allwinner,sun8i-r40-hdmi-phy";
> +			compatible =3D "allwinner,sun8i-r40-hdmi-phy",
> +				     "allwinner,sun50i-a64-hdmi-phy";

In previous e-mail I also stated that above changes are not related to GPU=
=20
node and they are also not needed, since HDMI on R40 works without this.

>  			reg =3D <0x01ef0000 0x10000>;
>  			clocks =3D <&ccu CLK_BUS_HDMI1>, <&ccu CLK_HDMI_SLOW>,
>  				 <&ccu 7>, <&ccu 16>;

You cleary didn't read rules for patch submission. When you are sending new=
=20
version of the patch, you have to state which version is it in subject line=
=20
and write a changelog below "---" line.

Best regards,
Jernej




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
