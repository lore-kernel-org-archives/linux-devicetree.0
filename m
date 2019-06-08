From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
Date: Sat, 8 Jun 2019 09:58:18 +0000
Message-ID: <DB3PR0402MB391678C245944942EA2A7F62F5110@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190604015928.23157-1-Anson.Huang@nxp.com>
 <20190604015928.23157-3-Anson.Huang@nxp.com>
 <20190606162543.EFFB820645@mail.kernel.org>
 <DB3PR0402MB391625A0B3D838CE88C53E33F5100@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190607180039.611C7208C0@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190607180039.611C7208C0@mail.kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "festevam@gmail.com" <festevam@gmail.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, mturq
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Stephen

> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Saturday, June 8, 2019 2:01 AM
> To: bjorn.andersson@linaro.org; catalin.marinas@arm.com;
> devicetree@vger.kernel.org; dinguyen@kernel.org;
> enric.balletbo@collabora.com; festevam@gmail.com;
> horms+renesas@verge.net.au; jagan@amarulasolutions.com;
> kernel@pengutronix.de; l.stach@pengutronix.de; linux-arm-
> kernel@lists.infradead.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org; mark.rutland@arm.com;
> maxime.ripard@bootlin.com; mturquette@baylibre.com; olof@lixom.net;
> robh+dt@kernel.org; s.hauer@pengutronix .de <s.hauer@pengutronix.de>;
> shawnguo@kernel.org; will.deacon@arm.com; Abel Vesa
> <abel.vesa@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>; Anson
> Huang <anson.huang@nxp.com>; Jacky Bai <ping.bai@nxp.com>; Leonard
> Crestez <leonard.crestez@nxp.com>
> Cc: dl-linux-imx <linux-imx@nxp.com>
> Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
> 
> Quoting Anson Huang (2019-06-06 17:50:28)
> >
> > I will use devm_platform_ioremap_resource() instead of ioremap(), and
> > can you be more specific about devmified clk registration?
> >
> 
> I mean using things like devm_clk_hw_register().

Sorry, I am still a little confused, all the clock register(clk_register()) are via each different
clock types like imx_clk_gate4/imx_clk_pll14xx, if using clk_hw_register, means we need
to re-write the clock driver using different clk register method, that will make the driver
completely different from i.mx8mq/i.mx8mm, they are actually same series of SoC as i.mx8mn,
it will introduce many confusion, is my understanding correct? And is it OK to just keep what
it is and make them all aligned?

Thanks,
Anson.
