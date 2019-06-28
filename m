From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm: Correct OPP table according to
 latest datasheet
Date: Fri, 28 Jun 2019 06:01:05 +0000
Message-ID: <VI1PR04MB50555399D8A3E4890D8C91E6EEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190628032800.8428-1-Anson.Huang@nxp.com>
 <20190628032800.8428-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kern>
List-Id: devicetree@vger.kernel.org

On 28.06.2019 06:37, Anson.Huang@nxp.com wrote:=0A=
=0A=
> According to latest datasheet (Rev.0.2, 04/2019) from below links,=0A=
> 1.8GHz is ONLY available for consumer part, so the market segment=0A=
> bits for 1.8GHz opp should ONLY available for consumer part accordingly.=
=0A=
> =0A=
>   			opp-hz =3D /bits/ 64 <1800000000>;=0A=
>   			opp-microvolt =3D <1000000>;=0A=
>   			/* Consumer only but rely on speed grading */=0A=
> -			opp-supported-hw =3D <0x8>, <0x7>;=0A=
> +			opp-supported-hw =3D <0x8>, <0x3>;=0A=
=0A=
Only consumer parts should be fused for this highest OPP. If you don't =0A=
want to rely on this then maybe also delete the comment above?=0A=
=0A=
--=0A=
Regards,=0A=
leonard=0A=
