From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm: Assign highest opp as suspend opp
Date: Thu, 4 Jul 2019 07:49:07 +0000
Message-ID: <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
References: <20190704061403.8249-1-Anson.Huang@nxp.com>
 <20190704061403.8249-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger
List-Id: devicetree@vger.kernel.org

On 7/4/2019 9:23 AM, Anson.Huang@nxp.com wrote:=0A=
> From: Anson Huang <Anson.Huang@nxp.com>=0A=
> =0A=
> Assign highest OPP as suspend OPP to reduce suspend/resume=0A=
> latency on i.MX8MM.=0A=
> =0A=
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>=0A=
> ---=0A=
>   arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +=0A=
>   1 file changed, 1 insertion(+)=0A=
> =0A=
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mm.dtsi=0A=
> index b11fc5e..3a62407 100644=0A=
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi=0A=
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi=0A=
> @@ -136,6 +136,7 @@=0A=
>   			opp-microvolt =3D <1000000>;=0A=
>   			opp-supported-hw =3D <0x8>, <0x3>;=0A=
>   			clock-latency-ns =3D <150000>;=0A=
> +			opp-suspend;=0A=
>   		};=0A=
>   	};=0A=
=0A=
What if the highest OPP is unavailable due to speed grading? Ideally we =0A=
should find a way to suspend at the highest *supported* OPP.=0A=
=0A=
Maybe the opp-suspend marking could be assigned from imx-cpufreq-dt =0A=
driver code?=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
=0A=
