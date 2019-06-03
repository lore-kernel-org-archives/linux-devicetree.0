From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 2/3] clk: imx: Add support for i.MX8MN clock driver
Date: Mon, 3 Jun 2019 07:39:16 +0000
Message-ID: <DB3PR0402MB3916D2B09BACABB79E8989A2F5140@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190603013503.40626-1-Anson.Huang@nxp.com>
 <20190603013503.40626-2-Anson.Huang@nxp.com>
 <20190603073018.j236j57ooc7t5hp6@fsr-ub1664-175>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190603073018.j236j57ooc7t5hp6@fsr-ub1664-175>
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
To: Abel Vesa <abel.vesa@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "olof@lixom.net" <olof@lixom.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

Hi, Abel

> -----Original Message-----
> From: Abel Vesa
> Sent: Monday, June 3, 2019 3:30 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
> mark.rutland@arm.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; catalin.marinas@arm.com;
> will.deacon@arm.com; maxime.ripard@bootlin.com; olof@lixom.net;
> horms+renesas@verge.net.au; jagan@amarulasolutions.com;
> bjorn.andersson@linaro.org; Leonard Crestez <leonard.crestez@nxp.com>;
> dinguyen@kernel.org; enric.balletbo@collabora.com; Aisheng Dong
> <aisheng.dong@nxp.com>; Jacky Bai <ping.bai@nxp.com>;
> l.stach@pengutronix.de; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH V2 2/3] clk: imx: Add support for i.MX8MN clock driver
> 
> On 19-06-03 09:35:02, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > This patch adds i.MX8MN clock driver support.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > Changes since V1:
> > 	- add GPIOx clocks.
> 
> ...
> 
> > +static struct imx_pll14xx_clk imx8mn_sys_pll __initdata = {
> > +		.type = PLL_1416X,
> > +		.rate_table = imx8mn_pll1416x_tbl,
> > +};
> > +
> > +static const char *pll_ref_sels[] = { "osc_24m", "dummy", "dummy",
> > +"dummy", };
> 
> All of these should be "static const char * const ".

OK.

> 
> > +static const char *audio_pll1_bypass_sels[] = {"audio_pll1",
> > +"audio_pll1_ref_sel", }; static const char *audio_pll2_bypass_sels[]
> > += {"audio_pll2", "audio_pll2_ref_sel", };
> 
> ...
> 
> > +	clk_data.clks = clks;
> > +	clk_data.clk_num = ARRAY_SIZE(clks);
> > +	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> > +	if (ret < 0) {
> > +		pr_err("failed to register clks for i.MX8MN\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	imx_register_uart_clocks(uart_clks);
> > +
> > +	return 0;
> > +}
> > +CLK_OF_DECLARE_DRIVER(imx8mn, "fsl,imx8mn-ccm",
> imx8mn_clocks_init);
> 
> Any reason why this cannot be a platform driver ?

It should can be, I just did NOT take care of it, 8MQ uses platform driver model, while
8MM does NOT, I will modify both of them to use platform driver model.

Thanks,
Anson.

> 
> > --
> > 2.7.4
> >
