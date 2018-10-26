Return-Path: <SRS0=avim=NG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ty1jpn01on0130.outbound.protection.outlook.com ([104.47.93.130]:9650
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbeJZSTF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Oct 2018 14:19:05 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: r8a77470: Add watchdog support to SoC dtsi
Date: Fri, 26 Oct 2018 09:42:38 +0000
Message-ID: <TYXPR01MB177526B71CBDB2AC8A16C652C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 1/2] ARM: dts: r8a77470: Add watchdog support to SoC dtsi
>
> This patch adds watchdog support to the r8a77470 SoC dtsi.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch tested against renesas-dev
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470=
.dtsi
> index e40f5a9..872ad3a 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -196,6 +196,16 @@
>  reg =3D <0 0xe6160000 0 0x100>;
>  };
>
> +rwdt: watchdog@e6020000 {
> +compatible =3D "renesas,r8a77470-wdt",
> +     "renesas,rcar-gen2-wdt";
> +reg =3D <0 0xe6020000 0 0x0c>;
> +clocks =3D <&cpg CPG_MOD 402>;
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 402>;
> +status =3D "disabled";
> +};
> +
>  sysc: system-controller@e6180000 {
>  compatible =3D "renesas,r8a77470-sysc";
>  reg =3D <0 0xe6180000 0 0x200>;
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
