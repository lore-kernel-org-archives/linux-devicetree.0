Return-Path: <SRS0=fBrN=SF=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb
 node
Date: Wed, 3 Apr 2019 10:26:18 +0000
Message-ID: 
 <TY1PR01MB177003CB9BCE22BAC2FE83A9C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: 
 <1551438348-22119-5-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

I would like to drop this patch.

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 01 March 2019 11:06
> Subject: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb n=
ode
>=20
> Patch "usb: common: Consider only available nodes for dr_mode"
> fixes the way the DT gets parsed to identify the USB controller
> driving the PHY, as such we don't need hsusb to specify dr_mode,
> in fact we don't need to enable the hsusb node at all since
> the USB interface on the board works as USB host only.
>=20
> Fixes: 5c6479d9b25b ("arm64: dts: renesas: r8a7799{0|5}: add/enable USB2.=
0 peripheral")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/=
boot/dts/renesas/r8a77995-draak.dts
> index db2bed1..5f13b8b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -207,11 +207,6 @@
>  	clock-frequency =3D <48000000>;
>  };
>=20
> -&hsusb {
> -	dr_mode =3D "host";
> -	status =3D "okay";
> -};
> -
>  &i2c0 {
>  	pinctrl-0 =3D <&i2c0_pins>;
>  	pinctrl-names =3D "default";
> --
> 2.7.4
