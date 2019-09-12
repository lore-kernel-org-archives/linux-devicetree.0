From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx7d: Correct speed grading fuse settings
Date: Thu, 12 Sep 2019 12:45:00 +0000
Message-ID: <VI1PR04MB7023E48B04999733859F7158EEB00@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <1568256992-31707-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 2019-09-12 5:57 AM, Anson Huang wrote:=0A=
> The 800MHz opp speed grading fuse mask should be 0xd instead=0A=
> of 0xf according to fuse map definition:=0A=
> =0A=
> SPEED_GRADING[1:0]	MHz=0A=
> 	00		800=0A=
> 	01		500=0A=
> 	10		1000=0A=
> 	11		1200=0A=
> =0A=
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>=0A=
=0A=
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
=0A=
Are you going to add the 500mhz OPP as well?=0A=
