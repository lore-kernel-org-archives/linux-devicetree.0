Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40040.outbound.protection.outlook.com ([40.107.4.40]:2716
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727979AbeK2Ckl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 21:40:41 -0500
From: Aisheng DONG <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 1/4] dt-bindings: rtc: add binding doc for i.MX system
 controller RTC driver
Date: Wed, 28 Nov 2018 15:38:31 +0000
Message-ID: <AM0PR04MB421116B3A25246AB43B535F380D10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
 <1543398696-3140-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543398696-3140-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

> diff --git a/Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt
> b/Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt
> new file mode 100644
> index 0000000..d6e2353
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt

This should belong to scu binding doc.

Regards
Dong Aisheng

> @@ -0,0 +1,10 @@
> +* NXP i.MX System Controller Real Time Clock
> +
> +Required properties:
> +- compatible: should be "nxp,imx8qxp-sc-rtc";
> +
> +Example:
> +
> +rtc: rtc {
> +	compatible =3D "nxp,imx8qxp-sc-rtc";
> +};
> --
> 2.7.4
