From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH RESEND 2/5] ARM: dts: imx7d-sdb: Assign corresponding
 power supply for LDOs
Date: Tue, 28 May 2019 19:24:04 +0000
Message-ID: <VI1PR04MB5055647612FAC2FE6FBE139FEE1E0@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
 <1557654739-12564-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 12.05.2019 12:57, Anson Huang wrote:=0A=
> On i.MX7D SDB board, sw2 supplies 1p0d/1p2 LDO, this patch assigns=0A=
> corresponding power supply for 1p0d/1p2 LDO to avoid confusion by=0A=
> below log:=0A=
> =0A=
> vdd1p0d: supplied by regulator-dummy=0A=
> vdd1p2: supplied by regulator-dummy=0A=
> =0A=
> With this patch, the power supply is more accurate:=0A=
> =0A=
> vdd1p0d: supplied by SW2=0A=
> vdd1p2: supplied by SW2=0A=
> =0A=
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sd=
b.dts=0A=
>=0A=
> +&reg_1p0d {=0A=
> +	vin-supply =3D <&sw2_reg>;=0A=
> +};=0A=
> +=0A=
> +&reg_1p2 {=0A=
> +	vin-supply =3D <&sw2_reg>;=0A=
> +};=0A=
=0A=
It's not clear why but this patch breaks imx7d-sdb boot. Checked two =0A=
boards: in a board farm and on my desk.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
