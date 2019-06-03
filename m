Return-Path: <SRS0=5yH4=UC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:64765
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725856AbfFCI1f (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 3 Jun 2019 04:27:35 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 0/2] Fix SDR50 on iwg20d and iwg23s
Date: Mon, 3 Jun 2019 08:27:30 +0000
Message-ID: <TY1PR01MB177000019AE130363FB65CE4C0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Actually, it looks like that since commit
0e7d6f940164 ("gpio: of: Apply regulator-gpio quirk only to enable-gpios")
property enable-active-high is not necessary anymore.
I am going to send a v2 to only flip the polarity of the GPIOs.

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 30 May 2019 09:08
> Subject: [PATCH 0/2] Fix SDR50 on iwg20d and iwg23s
>=20
> Dear All,
>=20
> SDR50 has been broken on both the iwg20d and the iwg23s since
> commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors").
> Other Renesas' platforms may be affected as well due
> to the lack of property enable-active-high.
> This patch series fixes the problem with the iWave platforms.
>=20
> Thanks,
> Fab
>=20
> Fabrizio Castro (2):
>   ARM: dts: iwg20d-q7-common: Fix SDHI1 VccQ regularor
>   ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
>=20
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi   | 4 +++-
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> --
> 2.7.4
