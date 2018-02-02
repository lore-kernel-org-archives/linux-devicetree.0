From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v6 21/41] ARM: da850: add new clock init using common
 clock framework
Date: Fri, 2 Feb 2018 12:05:08 -0600
Message-ID: <a54220c3-7108-1b53-9883-b4643eda2ef3@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-22-git-send-email-david@lechnology.com>
 <73d2c30d-ee86-1269-dd4b-1ebfe88a3149@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <73d2c30d-ee86-1269-dd4b-1ebfe88a3149@ti.com>
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
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

On 02/02/2018 08:20 AM, Sekhar Nori wrote:
> On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
>>   void __init da850_init_time(void)
>>   {
>> +#ifdef CONFIG_COMMON_CLK
>> +	void __iomem *pll0, *pll1, *psc0, *psc1;
>> +	struct regmap *cfgchip;
>> +	struct clk *clk;
>> +	struct clk_hw *parent;
>> +
>> +	pll0 = ioremap(DA8XX_PLL0_BASE, SZ_4K);
>> +	pll1 = ioremap(DA850_PLL1_BASE, SZ_4K);
>> +	psc0 = ioremap(DA8XX_PSC0_BASE, SZ_4K);
>> +	psc1 = ioremap(DA8XX_PSC1_BASE, SZ_4K);
>> +
>> +	cfgchip = da8xx_register_cfgchip();
>> +	if (WARN(IS_ERR(cfgchip), "failed to register CFGCHIP syscon"))
>> +		return;
>> +
>> +	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DA850_REF_FREQ);
>> +
>> +	da850_pll_clk_init(pll0, pll1);
>> +
>> +	da8xx_cfgchip_register_div4p5(cfgchip);
>> +
>> +	da8xx_cfgchip_register_async1(cfgchip);
>> +
>> +	clk = clk_register_fixed_factor(NULL, "async2", "pll0_auxclk", 0, 1, 1);
>> +	clk_register_clkdev(clk, NULL, "i2c_davinci.1");
>> +	clk_register_clkdev(clk, "timer0", NULL);
>> +	clk_register_clkdev(clk, NULL, "davinci-wdt");
> 
> I think its better to get these clkdevs registered in
> da850_pll_clk_init() itself.

Sounds good to me.

> 
>> +
>> +	clk = da8xx_cfgchip_register_async3(cfgchip);
>> +
>> +	/* pll1_sysclk2 is not affected by CPU scaling, so use it for async3 */
>> +	parent = clk_hw_get_parent_by_index(__clk_get_hw(clk), 1);
>> +	if (parent)
>> +		clk_set_parent(clk, parent->clk);
>> +	else
>> +		pr_warn("%s: Failed to find async3 parent clock\n", __func__);
>> +
>> +	da850_psc_clk_init(psc0, psc1);
>> +
>> +	clk = clk_register_fixed_factor(NULL, "rmii", "pll0_sysclk7", 0, 1, 1);
>> +	clk_register_clkdev(clk, "rmii", NULL);
> 
> Like in da830, can drop this rmii clock, I think.
> 
> Thanks,
> Sekhar
> 
