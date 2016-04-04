From: Lars Persson <lars.persson@axis.com>
Subject: Re: [PATCH v5 2/2] clk: add artpec-6 clock controller
Date: Mon, 4 Apr 2016 10:24:42 +0200
Message-ID: <570224CA.7040500@axis.com>
References: <cover.1459447089.git.larper@axis.com> <24806729fd9726fe79d315a3c88ecf1c9ea237ef.1459447089.git.larper@axis.com> <20160402013928.GF18567@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160402013928.GF18567@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/02/2016 03:39 AM, Stephen Boyd wrote:
> On 03/31, Lars Persson wrote:
>> diff --git a/drivers/clk/axis/Makefile b/drivers/clk/axis/Makefile
>> new file mode 100644
>> index 0000000..628c9d3
>> --- /dev/null
>> +++ b/drivers/clk/axis/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_MACH_ARTPEC6)	+= clk-artpec6.o
>> diff --git a/drivers/clk/axis/clk-artpec6.c b/drivers/clk/axis/clk-artpec6.c
>> new file mode 100644
>> index 0000000..cf716f1
>> --- /dev/null

[snip]
>
>> +
>> +	/* Read PLL1 factors configured by boot strap pins. */
>> +	pll_mode = (readl(clkdata->syscon_base) >> 6) & 3;
>> +	switch (pll_mode) {
>> +	case 0:		/* DDR3-2133 mode */
>> +		pll_m = 4;
>> +		pll_n = 85;
>> +		break;
>> +	case 1:		/* DDR3-1866 mode */
>> +		pll_m = 6;
>> +		pll_n = 112;
>> +		break;
>> +	case 2:		/* DDR3-1600 mode */
>> +		pll_m = 4;
>> +		pll_n = 64;
>> +		break;
>> +	case 3:		/* DDR3-1333 mode */
>> +		pll_m = 8;
>> +		pll_n = 106;
>> +		break;
>> +	}
>> +
>> +	clkdata->clk_table[ARTPEC6_CLK_CPU] =
>> +	    clk_register_fixed_factor(NULL, "cpu", sys_refclk_name, 0, pll_n,
>> +				      pll_m);
>> +	clkdata->clk_table[ARTPEC6_CLK_CPU_PERIPH] =
>> +	    clk_register_fixed_factor(NULL, "cpu_periph", "cpu", 0, 1, 2);
>> +
>> +	/* EPROBE_DEFER on the apb_clock is not handled in amba devices. */
>
> Shouldn't we fix that then?

Marek Szyprowski recently tried to fix this, but Russel NAKed the change 
due to userspace breakage:
https://lkml.org/lkml/2016/2/15/555


>
>> +	clkdata->clk_table[ARTPEC6_CLK_UART_PCLK] =
>> +	    clk_register_fixed_factor(NULL, "uart_pclk", "cpu", 0, 1, 8);
>> +	clkdata->clk_table[ARTPEC6_CLK_UART_REFCLK] =
>> +	    clk_register_fixed_rate(NULL, "uart_ref", sys_refclk_name, 0,
>> +				    50000000);
>
