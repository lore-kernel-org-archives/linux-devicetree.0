Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:40352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727199AbfCAMAp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 1 Mar 2019 07:00:45 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Date: Fri, 1 Mar 2019 12:00:39 +0000
Message-ID: <TYXPR01MB17752BA491B4A41F1257EB61C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Are you happy with this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 15 February 2019 12:26
> Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
>=20
> We usually leave a space between "=3D" and the value of device
> tree properties, but unfortunately that was overlooked for the
> "clocks" property of cpu@0 and cpu@1.
> This patch fixes the spacing with the "clocks" property of
> cpu@0 and cpu@1.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774c0.dtsi
> index 61a0afb..0bbcaf1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -76,7 +76,7 @@
>  			power-domains =3D <&sysc R8A774C0_PD_CA53_CPU0>;
>  			next-level-cache =3D <&L2_CA53>;
>  			enable-method =3D "psci";
> -			clocks =3D<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> +			clocks =3D <&cpg CPG_CORE R8A774C0_CLK_Z2>;
>  			operating-points-v2 =3D <&cluster1_opp>;
>  		};
>=20
> @@ -87,7 +87,7 @@
>  			power-domains =3D <&sysc R8A774C0_PD_CA53_CPU1>;
>  			next-level-cache =3D <&L2_CA53>;
>  			enable-method =3D "psci";
> -			clocks =3D<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> +			clocks =3D <&cpg CPG_CORE R8A774C0_CLK_Z2>;
>  			operating-points-v2 =3D <&cluster1_opp>;
>  		};
>=20
> --
> 2.7.4
