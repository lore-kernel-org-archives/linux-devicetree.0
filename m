Return-Path: <SRS0=ZPg/=RD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:37376
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730883AbfB1Lgd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Feb 2019 06:36:33 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3IR
 power domain
Date: Thu, 28 Feb 2019 11:36:28 +0000
Message-ID: <TY1PR01MB1770F8D490EB33636F24954AC0750@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190228105119.548-1-geert+renesas@glider.be>
In-Reply-To: <20190228105119.548-1-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 28 February 2019 10:51
> Subject: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3I=
R power domain
>=20
> The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> removed the A3IR power domain on R-Car M3-N, as this SoC does not have
> an Image Processing Unit (IMP-X5).
>=20
> As of commit d8c6557bc93be73e ("arm64: dts: renesas: r8a77965: Remove
> non-existent IPMMU-IR"), this definition is no longer used from DT, and
> thus can be removed.
>=20
> Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support=
")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> v2:
>   - Drop RFC, as the dependency is part of v5.0-rc1.
> ---
>  include/dt-bindings/power/r8a77965-sysc.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/power/r8a77965-sysc.h b/include/dt-bindi=
ngs/power/r8a77965-sysc.h
> index 05a4b5917314791a..de82d8a15ea13a85 100644
> --- a/include/dt-bindings/power/r8a77965-sysc.h
> +++ b/include/dt-bindings/power/r8a77965-sysc.h
> @@ -21,7 +21,6 @@
>  #define R8A77965_PD_A3VC		14
>  #define R8A77965_PD_3DG_A		17
>  #define R8A77965_PD_3DG_B		18
> -#define R8A77965_PD_A3IR		24
>  #define R8A77965_PD_A2VC1		26
>=20
>  /* Always-on power area */
> --
> 2.17.1
