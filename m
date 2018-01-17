From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 16/44] clk: davinci: Add platform information for TI
 DM646x PSC
Date: Wed, 17 Jan 2018 20:29:31 +0530
Message-ID: <000fc63a-bba5-6fac-450b-5ed0f8a9bfea@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-17-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1515377863-20358-17-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 08 January 2018 07:47 AM, David Lechner wrote:

> +void __init dm646x_psc_clk_init(void __iomem *psc)
> +{
> +	struct clk_onecell_data *clk_data;
> +
> +	clk_data = davinci_psc_register_clocks(psc, dm646x_psc_info, 41);
> +	if (!clk_data)
> +		return;
> +
> +	clk_register_clkdev(clk_data->clks[0], "arm", NULL);

I don't think this "arm" con_id is used any where for non-DA850 SoCs.
And same with "dsp" in other files. Probably best to drop these dubious
usage ones rather than carry them forward.

Thanks,
Sekhar
