From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx7d-sdb: Make SW2's voltage fixed
Date: Wed, 29 May 2019 10:25:10 +0000
Message-ID: <VI1PR04MB505512BC507108ABC7620F4AEE1F0@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190529065056.27516-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 29.05.2019 09:49, Anson.Huang@nxp.com wrote:=0A=
> From: Anson Huang <Anson.Huang@nxp.com>=0A=
> =0A=
> On i.MX7D SDB board, SW2 supplies a lot of peripheral devices,=0A=
> its voltage should be fixed at 1.8V. The commit 43967d9b5a7c=0A=
> ("ARM: dts: imx7d-sdb: Assign corresponding power supply for LDOs")=0A=
> assigns SW2 as the supplier of vdd1p0d, and when its comsumers=0A=
> pcie-phy/mipi-phy try to set the vdd1p0d to 1.0V, regulator core=0A=
> will also set SW2 to its best(min) voltage to 1.5V, and it will=0A=
> lead to board reset.=0A=
> =0A=
> This patch makes SW2's voltage fixed at 1.8V to avoid this issue.=0A=
> =0A=
> Fixes: 43967d9b5a7c ("ARM: dts: imx7d-sdb: Assign corresponding power sup=
ply for LDOs")=0A=
> Reported-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>=0A=
=0A=
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
=0A=
Other boards don't seem to be affected by the original series.=0A=
