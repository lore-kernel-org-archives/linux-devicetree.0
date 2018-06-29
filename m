From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 2/2] ARM: dts: imx6ul: add GPIO clocks
Date: Fri, 29 Jun 2018 11:39:38 -0700
Message-ID: <153029757874.143105.17774476792947607999@swboyd.mtv.corp.google.com>
References: <1527990245-13619-1-git-send-email-Anson.Huang@nxp.com>
 <1527990245-13619-2-git-send-email-Anson.Huang@nxp.com>
 <AM3PR04MB1315D8B57E1A5D47BECBDCD3F54A0@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <20180628005217.GC22683@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628005217.GC22683@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "matteo.lisi@engicam.com" <matteo.lisi@engicam.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "michael@amarulasolutions.com" <michael@amarulasolutions.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Quoting Shawn Guo (2018-06-27 17:52:18)
> On Mon, Jun 25, 2018 at 03:14:39AM +0000, Anson Huang wrote:
> > Gentle Ping...
> =

> I cannot apply this dts patch until the clock patch is landed on
> mainline, because it has a dependency on new clock ID IMX6UL_CLK_GPIO1
> created by clock patch.
> =


Does it matter if that clk ID changes across branches? Or is everything
good if it just exists as some number? The patch adding the define
conflicts with another patch to fix the numbering scheme to be
incremental instead of changing IMX6UL and IMX6ULL which is annoying.
I'll probably make a topic branch just for the fix and merge it into
clk-fixes and this branch so you can pick it up from there if you like.
