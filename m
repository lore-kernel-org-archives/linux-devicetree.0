Return-Path: <SRS0=4we3=Q3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30046.outbound.protection.outlook.com ([40.107.3.46]:61666
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725379AbfBTHpc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Feb 2019 02:45:32 -0500
From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V7 1/4] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 20 Feb 2019 07:45:27 +0000
Message-ID: <AM6PR04MB42152F3A2F9C6E6D8CF3D0DA807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1550645332-2907-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1550645332-2907-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

> From: Anson Huang
> Sent: Wednesday, February 20, 2019 2:54 PM
>=20
> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as system
> controller, the system controller is in charge of system power, clock and
> thermal sensors etc. management, Linux kernel has to communicate with
> system controller via MU (message unit) IPC to get temperature from therm=
al
> sensors, this patch adds binding doc for i.MX system controller thermal d=
river.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since V6:
> 	- put "imx,sensor-resource-id" property in thermal zone nodes.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 27
> ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 72d481c..ad96881 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -122,6 +122,27 @@ RTC bindings based on SCU Message Protocol
> Required properties:
>  - compatible: should be "fsl,imx8qxp-sc-rtc";
>=20
> +Thermal bindings based on SCU Message Protocol
> +------------------------------------------------------------
> +
> +Required properties:
> +- compatible : Must be "fsl,imx-sc-thermal";
> +- tsens-num : Total number of thermal sensors supported;

We properly don't need this property if the number of sensor
is fixed on a specific SoC.

> +- #thermal-sensor-cells : Should be 1. See
> +			  Documentation/devicetree/bindings/thermal/thermal.txt
> +			  for a description.
> +
> +Required properties for thermal zone nodes:
> +- imx,sensor-resource-id : This property should be defined in each therm=
al

After a further looking at it, I wonder this property may not needed either=
.

> zone
> +			   of thermal-zones node, it passes each thermal zone's
> +			   resource id for thermal driver to get temperature via
> +			   SCU IPC.
> +
> +			   For thermal zone nodes, please refer to below binding
> +			   doc for details:
> +
> +[1] Documentation/devicetree/bindings/thermal/thermal.txt
> +
>  Example (imx8qxp):
>  -------------
>  lsio_mu1: mailbox@5d1c0000 {
> @@ -168,6 +189,12 @@ firmware {
>  		rtc: rtc {
>  			compatible =3D "fsl,imx8qxp-sc-rtc";
>  		};
> +
> +		tsens: thermal-sensor {
> +			compatible =3D "fsl,imx8qxp-sc-thermal";
> +			tsens-num =3D <1>;
> +			#thermal-sensor-cells =3D <1>;

This looks may not correct if sensor cells is 1 but the sensor number
Is also 1.
So we probably better remove tsens-num property.

Regards
Dong Aisheng

> +		};
>  	};
>  };
>=20
> --
> 2.7.4
