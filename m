From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH 3/4] clk: imx8mm: Add system counter to clock tree
Date: Thu, 11 Jul 2019 08:19:09 +0000
Message-ID: <20190711081908.ray2pjtigbjaezyc@fsr-ub1664-175>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
 <20190621070720.12395-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190621070720.12395-3-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <5D9D0CDF90B35D4FB3BC742B2D394AB9@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, "will@kernel.org" <will@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, linux-arm-kernel@lists.infrad
List-Id: devicetree@vger.kernel.org

On 19-06-21 15:07:19, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> i.MX8MM timer-imx-sysctr driver needs system counter clock
> for proper function, add it into clock tree.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 43fa9c3..56d53dd 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -645,6 +645,8 @@ static int __init imx8mm_clocks_init(struct device_node *ccm_node)
>  	clks[IMX8MM_CLK_DRAM_ALT_ROOT] = imx_clk_fixed_factor("dram_alt_root", "dram_alt", 1, 4);
>  	clks[IMX8MM_CLK_DRAM_CORE] = imx_clk_mux2_flags("dram_core_clk", base + 0x9800, 24, 1, imx8mm_dram_core_sels, ARRAY_SIZE(imx8mm_dram_core_sels), CLK_IS_CRITICAL);
>  
> +	clks[IMX8MM_CLK_SYS_CTR] = imx_clk_fixed_factor("sys_ctr", "osc_24m", 1, 3);
> +
>  	clks[IMX8MM_CLK_ARM] = imx_clk_cpu("arm", "arm_a53_div",
>  					   clks[IMX8MM_CLK_A53_DIV],
>  					   clks[IMX8MM_CLK_A53_SRC],
> -- 
> 2.7.4
> 
