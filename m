Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
Date: Fri, 26 Oct 2018 09:48:48 +0000
Message-ID: 
 <TYXPR01MB17759C4C2CE8754365B82DA1C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
 <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
>
> This patch enables cmt0 support on the iWave iwg23s sbc.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dt=
s/r8a77470-iwg23s-sbc.dts
> index 518b0c0..6277571 100644
> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> @@ -73,6 +73,10 @@
>  };
>  };
>
> +&cmt0 {
> +status =3D "okay";
> +};
> +
>  &ehci1 {
>  status =3D "okay";
>  };
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
