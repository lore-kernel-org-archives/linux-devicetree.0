From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: pfuze3000: update sw1a/vldo4 voltage range
Date: Sun, 18 Mar 2018 09:54:42 -0300
Message-ID: <CAOMZO5AFJk_Q5CYrV0s+hLmORHosWujRSGjwf9smyAQc4nmJ+A@mail.gmail.com>
References: <1521269828-8874-1-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5BzE46Dm24++j+xVA4KGFnpsopGfJ97h7sFGOAxVa19=g@mail.gmail.com> <AM3PR04MB1315E1C3071C0BD2E7169968F5D50@AM3PR04MB1315.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB1315E1C3071C0BD2E7169968F5D50@AM3PR04MB1315.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Robin Gong <yibin.gong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 17, 2018 at 11:23 PM, Anson Huang <anson.huang@nxp.com> wrote:

> I thought the max value here means the capability of regulator itself, like the internal

No it is not.

Please check Documentation/devicetree/bindings/regulator/regulator.txt:

"- regulator-max-microvolt: largest voltage consumers may set"
