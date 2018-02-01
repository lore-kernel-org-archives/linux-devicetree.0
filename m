From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 04/41] clk: davinci: Add platform information for TI
 DA850 PLL
Date: Thu, 1 Feb 2018 14:28:57 +0530
Message-ID: <834cb7ce-9406-a806-3ec1-a59766bd8a9d@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-5-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516468460-4908-5-git-send-email-david@lechnology.com>
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
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
> This adds platform-specific declarations for the PLL clocks on TI DA850/
> OMAP-L138/AM18XX SoCs.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

> +static const struct davinci_pll_clk_info da850_pll1_info __initconst = {
> +	.name = "pll1",
> +	.unlock_reg = CFGCHIP(3),
> +	.unlock_mask = CFGCHIP3_PLL1_MASTER_LOCK,

I guess this will change with the cfgchip handling discussion last week.

> +	.pllm_mask = GENMASK(4, 0),
> +	.pllm_min = 4,
> +	.pllm_max = 32,
> +	.pllout_min_rate = 300000000,
> +	.pllout_max_rate = 600000000,
> +	.flags = PLL_HAS_POSTDIV,
> +};
> +

[...]

> +void __init da850_pll_clk_init(void __iomem *pll0, void __iomem *pll1)
> +{
> +	const struct davinci_pll_sysclk_info *info;
> +
> +	davinci_pll_clk_register(&da850_pll0_info, "ref_clk", pll0);
> +
> +	davinci_pll_auxclk_register("pll0_auxclk", pll0);
> +
> +	for (info = da850_pll0_sysclk_info; info->name; info++)
> +		davinci_pll_sysclk_register(info, pll0);
> +
> +	davinci_pll_obsclk_register(&da850_pll0_obsclk_info, pll0);
> +
> +	davinci_pll_clk_register(&da850_pll1_info, "oscin", pll1);

Both PLL0 and PLL1 use the same reference clock. So this should be
"ref_clk". I dont think we ever need to register a clock called oscin
along with "ref_clk". There is only one reference clock. It can either
be obtained using internal oscillator or external oscillator.

Thanks,
Sekhar
