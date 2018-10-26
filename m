Return-Path: <SRS0=avim=NG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ty1jpn01on0130.outbound.protection.outlook.com ([104.47.93.130]:9650
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726243AbeJZSTF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Oct 2018 14:19:05 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable watchdog support
Date: Fri, 26 Oct 2018 09:42:40 +0000
Message-ID: <TYXPR01MB177563B2A1D45D6033AEDE4BC0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
 <1540546347-42791-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540546347-42791-2-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable watchdog support
>
> This patch enables watchdog support on the iWave iwg23s sbc.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dt=
s/r8a77470-iwg23s-sbc.dts
> index 6277571..bc953fa 100644
> --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> @@ -128,6 +128,11 @@
>  };
>  };
>
> +&rwdt {
> +timeout-sec =3D <60>;
> +status =3D "okay";
> +};
> +
>  &scif1 {
>  pinctrl-0 =3D <&scif1_pins>;
>  pinctrl-names =3D "default";
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
