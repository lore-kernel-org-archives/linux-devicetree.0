From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct OPP table according to
 latest datasheet
Date: Fri, 28 Jun 2019 05:58:42 +0000
Message-ID: <VI1PR04MB50553915C0D978A8019BDC5CEEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190628032800.8428-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 28.06.2019 06:37, Anson.Huang@nxp.com wrote:=0A=
> From: Anson Huang <Anson.Huang@nxp.com>=0A=
> =0A=
> According to latest datasheet (Rev.1, 10/2018) from below links,=0A=
> in the consumer datasheet, 1.5GHz is mentioned as highest opp but=0A=
> depends on speed grading fuse, and in the industrial datasheet,=0A=
> 1.3GHz is mentioned as highest opp but depends on speed grading=0A=
> fuse. 1.5GHz and 1.3GHz opp use same voltage, so no need for=0A=
> consumer part to support 1.3GHz opp, with same voltage, CPU should=0A=
> run at highest frequency in order to go into idle as quick as=0A=
> possible, this can save power.=0A=
=0A=
I looked at the same datasheets and it's not clear to me that 1.3 Ghz =0A=
should be disallowed for consumer parts. Power consumption increases =0A=
with both voltage and frequency so having two OPPs with same voltage =0A=
does make sense.=0A=
=0A=
>   			opp-hz =3D /bits/ 64 <1300000000>;=0A=
>   			opp-microvolt =3D <1000000>;=0A=
> -			opp-supported-hw =3D <0xc>, <0x7>;=0A=
> +			/* Industrial only but rely on speed grading */=0A=
> +			opp-supported-hw =3D <0xc>, <0x4>;=0A=
=0A=
Comment is false, you're explicitly excluding consumer parts via the =0A=
second element.=0A=
=0A=
>   			opp-hz =3D /bits/ 64 <1500000000>;=0A=
>   			opp-microvolt =3D <1000000>;=0A=
>   			/* Consumer only but rely on speed grading */=0A=
> -			opp-supported-hw =3D <0x8>, <0x7>;=0A=
> +			opp-supported-hw =3D <0x8>, <0x3>;=0A=
=0A=
If you don't want to rely on the fact that only consumer parts should be =
=0A=
fused for 1.5 Ghz then please delete the comment.=0A=
