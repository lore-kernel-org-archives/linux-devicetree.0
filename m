From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 5/5] clk: imx: add clock driver for i.MX8MQ CCM
Date: Fri, 24 Aug 2018 09:58:27 +0200
Message-ID: <20180824075827.l54jghjbetulzntg@pengutronix.de>
References: <1534945703-4730-1-git-send-email-abel.vesa@nxp.com>
 <1534945703-4730-6-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534945703-4730-6-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 04:48:23PM +0300, Abel Vesa wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> Add driver for the Clock Control Module found on i.MX8MQ.
> 
> This is largely based on the downstream driver from Anson Huang and
> Bai Ping at NXP, with only some small adaptions to mainline from me.

It's time to rephrase the commit message. With the new composite clock
the adaptions are no longer that small.

> +
> +static int const clks_init_on[] __initconst = {
> +	IMX8MQ_CLK_DRAM_CORE, IMX8MQ_CLK_AHB_CG,
> +	IMX8MQ_CLK_NOC, IMX8MQ_CLK_NOC_APB,
> +	IMX8MQ_CLK_USB_BUS, IMX8MQ_CLK_NAND_USDHC_BUS,
> +	IMX8MQ_CLK_MAIN_AXI, IMX8MQ_CLK_A53_CG,
> +	IMX8MQ_CLK_AUDIO_AHB_DIV, IMX8MQ_CLK_TMU_ROOT,
> +	IMX8MQ_CLK_DRAM_APB,
> +};

This is unused and you seem to have converted all these clocks to add
the CLK_IS_CRITICAL flag.

Are all these really needed? some clocks like IMX8MQ_CLK_AUDIO_AHB_DIV,
IMX8MQ_CLK_USB_BUS and IMX8MQ_CLK_NAND_USDHC_BUS look suspicious.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
