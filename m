From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 3/3] clk: imx: clk-imx6ul: add clk support for imx6ull
Date: Wed, 2 Nov 2016 06:45:57 +0000
Message-ID: <HE1PR04MB14508C014D6370FBC875B9508BA00@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1477969343-19887-1-git-send-email-peter.chen@nxp.com>
 <1477969343-19887-4-git-send-email-peter.chen@nxp.com>
 <20161102001205.GA16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161102001205.GA16026-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=20
>
>On 11/01, Peter Chen wrote:
>>  	clks[IMX6UL_CLK_USDHC1]		=3D imx_clk_gate2("usdhc1",
>	"usdhc1_podf",	 base + 0x80,	2);
>>  	clks[IMX6UL_CLK_USDHC2]		=3D imx_clk_gate2("usdhc2",
>	"usdhc2_podf",	 base + 0x80,	4);
>> -	clks[IMX6UL_CLK_SIM1]		=3D imx_clk_gate2("sim1",
>	"sim_sel",	 base + 0x80,	6);
>> -	clks[IMX6UL_CLK_SIM2]		=3D imx_clk_gate2("sim2",
>	"sim_sel",	 base + 0x80,	8);
>> +	if (clk_on_imx6ul()) {
>> +		clks[IMX6UL_CLK_SIM1]		=3D imx_clk_gate2("sim1",
>	"sim_sel",	 base + 0x80,	6);
>> +		clks[IMX6UL_CLK_SIM2]		=3D imx_clk_gate2("sim2",
>	"sim_sel",	 base + 0x80,	8);
>> +	}
>>  	clks[IMX6UL_CLK_EIM]		=3D imx_clk_gate2("eim",
>	"eim_slow_podf", base + 0x80,	10);
>>  	clks[IMX6UL_CLK_PWM8]		=3D imx_clk_gate2("pwm8",
>	"perclk",	 base + 0x80,	16);
>>  	clks[IMX6UL_CLK_UART8_IPG]	=3D imx_clk_gate2("uart8_ipg",	"ipg",
>	 base + 0x80,	14);
>> @@ -430,6 +478,7 @@ static void __init imx6ul_clocks_init(struct device_=
node
>*ccm_node)
>>  	clk_set_rate(clks[IMX6UL_CLK_ENET_REF], 50000000);
>>  	clk_set_rate(clks[IMX6UL_CLK_ENET2_REF], 50000000);
>>  	clk_set_rate(clks[IMX6UL_CLK_CSI], 24000000);
>> +	clk_set_rate(clks[IMX6UL_CLK_PLL3_PFD2], 320000000);
>
>Can you use assigned clock rates for this instead?
>

Thanks, I will move it to dts.

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
