From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 04/44] clk: davinci: Add platform information for TI
 DA850 PLL
Date: Tue, 16 Jan 2018 14:07:07 +0530
Message-ID: <f9c0c0c5-ca81-ec0c-358d-f45299250f42@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-5-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1515377863-20358-5-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> +void __init da850_pll_clk_init(void __iomem *pll0, void __iomem *pll1)
> +{
> +	const struct davinci_pll_divclk_info *info;
> +
> +	davinci_pll_clk_register("pll0", "ref_clk", pll0);

I think this will be more readable with empty lines between these
function calls. So here ..

> +	davinci_pll_aux_clk_register("pll0_aux_clk", "ref_clk", pll0);

.. here

> +	for (info = da850_pll0_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll0);
> +
> +	davinci_pll_clk_register("pll1", "ref_clk", pll1);

.. and here.

> +	for (info = da850_pll1_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll1);

I see that you have included empty line only when changing the PLL, but
I feel its more readable with the additional spacing suggested.

Same comment for other patches too with similar function implemented.
With that minor comment:

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
