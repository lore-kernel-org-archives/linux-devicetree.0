Return-Path: <SRS0=68YU=Q3=nxp.com=aisheng.dong@kernel.org>
From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V6 1/4] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 20 Feb 2019 03:26:50 +0000
Message-ID: 
 <AM6PR04MB4215E32892899A6E84182D43807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1549532838-27025-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1549532838-27025-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

> From: Anson Huang
> Sent: Thursday, February 7, 2019 5:53 PM
[...]
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
> ChangeLog since V5:
> 	- add "imx,sensor-resource-id" in each thermal zone to pass resource ID
> for thermal driver.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt    | 20
> ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 72d481c..4b79751 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -122,6 +122,20 @@ RTC bindings based on SCU Message Protocol
> Required properties:
>  - compatible: should be "fsl,imx8qxp-sc-rtc";
>=20
> +Thermal bindings based on SCU Message Protocol
> +------------------------------------------------------------
> +
> +Required properties:
> +- compatible : Must be "fsl,imx8qxp-sc-thermal";
> +- tsens-num : Total number of thermal sensors supported;
> +- #thermal-sensor-cells : Should be 1. See
> +			  Documentation/devicetree/bindings/thermal/thermal.txt
> +			  for a description.
> +- imx,sensor-resource-id : This property should be defined in each therm=
al
> zone
> +			   of thermal-zones node, it passes each thermal zone's
> +			   resource id for thermal driver to get temperature via
> +			   SCU IPC.

This is missing in the example?

BTW, is this SCU function likely platform dependent?
If not, you probably could add a fallback compatible such as "fsl,scu-rtc"

Regards
Dong Aisheng

> +
>  Example (imx8qxp):
>  -------------
>  lsio_mu1: mailbox@5d1c0000 {
> @@ -168,6 +182,12 @@ firmware {
>  		rtc: rtc {
>  			compatible =3D "fsl,imx8qxp-sc-rtc";
>  		};
> +
> +		tsens: thermal-sensor {
> +			compatible =3D "fsl,imx8qxp-sc-thermal";
> +			tsens-num =3D <1>;
> +			#thermal-sensor-cells =3D <1>;
> +		};
>  	};
>  };
>=20
> --
> 2.7.4
