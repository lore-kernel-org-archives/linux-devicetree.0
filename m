From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: imx8mm: Add SNVS clock
Date: Wed, 15 May 2019 10:18:02 +0000
Message-ID: <AM0PR04MB6434DFD7728BD5B105EF2A31EE090@AM0PR04MB6434.eurprd04.prod.outlook.com>
References: <1557883490-22360-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

On 15.05.2019 04:29, Anson Huang wrote:=0A=
> Add macro for the SNVS clock of the i.MX8MM.=0A=
> =0A=
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>=0A=
> ---=0A=
> This patch is based on patch: https://patchwork.kernel.org/patch/10939997=
/=0A=
=0A=
Numbering also conflicts with one of my patches:=0A=
=0A=
https://patchwork.kernel.org/patch/10940303/=0A=
=0A=
The conflict is easy to resolve but I don't mind resending if your =0A=
patches get accepted first. If should probably resend anyway to also add =
=0A=
gic clk to 8mq.=0A=
=0A=
For series:=0A=
=0A=
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
