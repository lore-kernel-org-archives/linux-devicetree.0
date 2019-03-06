Return-Path: <SRS0=OPqa=RJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:11669
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728228AbfCFLwJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 Mar 2019 06:52:09 -0500
From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
Date: Wed, 6 Mar 2019 11:52:03 +0000
Message-ID: <TYAPR01MB22857AB97F530249900887C1B7730@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1551871785-4093-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551871785-4093-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
List-ID: <devicetree@vger.kernel.org>


> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 06 March 2019 11:30
>=20
> Enable RWDT and use 60 seconds as default timeout.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Kind regards, Chris

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 96ee0d2c..49ad3a5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -84,6 +84,11 @@
>  	};
>  };
>=20
> +&rwdt {
> +	timeout-sec =3D <60>;
> +	status =3D "okay";
> +};
> +
>  &scif2 {
>  	pinctrl-0 =3D <&scif2_pins>;
>  	pinctrl-names =3D "default";
> --
> 2.7.4
