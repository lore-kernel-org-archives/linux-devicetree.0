Return-Path: <SRS0=P0hq=MI=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7-dbcm-ca: Improve model string
Date: Wed, 26 Sep 2018 10:11:57 +0000
Message-ID: 
 <TY1PR01MB1770D9F588C9B9D7DF434F86C0150@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537956082-17542-1-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1537956082-17542-1-git-send-email-chris.paterson2@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Paterson <Chris.Paterson2@renesas.com>, Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH] ARM: dts: iwg20d-q7-dbcm-ca: Improve model string
>
> Update the model string for this platform configuration and fix the
> grammar at the same time.
>
> This brings the syntax in line with the RZ/G1E iWave board.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> Perhaps this patch isn't really needed, but the current string annoys me.
>
> Patch applies cleanly to renesas-devel-20180925-v4.19-rc5.
> ---
>  arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts b/arch/arm/b=
oot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> index 0d006aea99da1b40..6811ddc4af6460ce 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> @@ -11,7 +11,7 @@
>  #include "iwg20d-q7-dbcm-ca.dtsi"
>
>  / {
> -model =3D "iW-RainboW-G20D-Q7 RZ/G1M based plus camera daughter board";
> +model =3D "iWave RainboW-G20D-Q7 RZ/G1M based board with camera add-on";
>  compatible =3D "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
>  };
>
> --
> 1.9.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
