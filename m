Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50076.outbound.protection.outlook.com ([40.107.5.76]:34896
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727789AbeK2Cse (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 21:48:34 -0500
From: Aisheng DONG <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 4/4] ARM64: dts: imx: add i.MX8QXP system controller
 RTC support
Date: Wed, 28 Nov 2018 15:46:24 +0000
Message-ID: <AM0PR04MB42115A31CAE5A72D047BE7B880D10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
 <1543398696-3140-5-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543398696-3140-5-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

[...]
> Subject: [PATCH V3 4/4] ARM64: dts: imx: add i.MX8QXP system controller R=
TC
> support
>=20
> Add i.MX8QXP system controller RTC support.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index da99b6f..5e8b554 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -406,4 +406,8 @@
>  		#size-cells =3D <1>;
>  		ranges =3D <0x5f000000 0x0 0x5f000000 0x1000000>;
>  	};
> +
> +	rtc: rtc {
> +		compatible =3D "nxp,imx8qxp-sc-rtc";

As I replied in patch 1, this belongs to scu node as well.

Regards
Dong Aisheng

> +	};
>  };
> --
> 2.7.4
