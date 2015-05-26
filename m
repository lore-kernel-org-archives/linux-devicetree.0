From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/5] clk: mediatek: mt8173: Fix enabling of critical
 clocks
Date: Tue, 26 May 2015 09:46:08 +0200
Message-ID: <20150526074608.GE6325@pengutronix.de>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
 <1432192376-6712-3-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432192376-6712-3-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, srv_heupstream@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 03:12:53PM +0800, James Liao wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> On the MT8173 the clocks are provided by different units. To enable
> the critical clocks we must be sure that all parent clocks are already
> registered, otherwise the parents of the critical clocks end up being
> unused and get disabled later. To find a place where all parents are
> registered we try each time after we've registered some clocks if
> all known providers are present now and only then we enable the critical
> clocks
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8173.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 4b9e04c..eb175ac 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -700,6 +700,20 @@ static const struct mtk_composite peri_clks[] __initconst = {
>  	MUX(CLK_PERI_UART3_SEL, "uart3_ck_sel", uart_ck_sel_parents, 0x40c, 3, 1),
>  };
>  
> +static struct clk_onecell_data *mt8173_top_clk_data;
> +static struct clk_onecell_data *mt8173_pll_clk_data;
> +
> +static void mtk_clk_enable_critical(void)
> +{
> +	if (!mt8173_top_clk_data || !mt8173_pll_clk_data)
> +		return;
> +
> +	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_MEM_SEL]);
> +	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_DDRPHYCFG_SEL]);
> +	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_CCI400_SEL]);
> +	clk_prepare_enable(mt8173_top_clk_data->clks[CLK_TOP_RTC_SEL]);

Is CLK_TOP_RTC_SEL really a critical clock?

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
