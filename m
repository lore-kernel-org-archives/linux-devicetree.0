From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v6 20/41] ARM: da830: add new clock init using common
 clock framework
Date: Fri, 2 Feb 2018 12:03:36 -0600
Message-ID: <e5eb68e8-eb53-331d-5941-95df7d295074@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-21-git-send-email-david@lechnology.com>
 <4b2f45f5-7f0d-f0e6-6854-9992e19f45f2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4b2f45f5-7f0d-f0e6-6854-9992e19f45f2@ti.com>
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

On 02/02/2018 08:12 AM, Sekhar Nori wrote:
> On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
>>   void __init da830_init_time(void)
>>   {
>> +#ifdef CONFIG_COMMON_CLK
>> +	void __iomem *pll0, *psc0, *psc1;
>> +	struct clk *clk;
>> +
>> +	pll0 = ioremap(DA8XX_PLL0_BASE, SZ_4K);
>> +	psc0 = ioremap(DA8XX_PSC0_BASE, SZ_4K);
>> +	psc1 = ioremap(DA8XX_PSC1_BASE, SZ_4K);
>> +
>> +	da8xx_register_cfgchip();
>> +
>> +	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DA830_REF_FREQ);
>> +
>> +	da830_pll_clk_init(pll0);
>> +
>> +	da830_psc_clk_init(psc0, psc1);
>> +
> 
>> +	clk = clk_register_fixed_factor(NULL, "i2c0", "pll0_aux_clk", 0, 1, 1);
>> +	clk_register_clkdev(clk, NULL, "i2c_davinci.1");
>> +
>> +	clk = clk_register_fixed_factor(NULL, "timer0", "pll0_aux_clk", 0, 1, 1);
>> +	clk_register_clkdev(clk, "timer0", NULL);
>> +
>> +	clk = clk_register_fixed_factor(NULL, "timer1", "pll0_aux_clk", 0, 1, 1);
>> +	clk_register_clkdev(clk, NULL, "davinci-wdt");
> 
> Isn't this better done in da830_pll_clk_init() ? I think we can get rid
> of the dummy fixed factor clock too and directly use the pll0_auxclk.


I considered it, but I kind of like keeping the fixed factor clocks for
debugging purposes. If you just have "pll0_auxclk" the enable count is
not helpful because you don't know which driver did the enabling.

On the other hand, once things are working, you don't really need to
do any debugging.


> That reminds me, is "pll0_aux_clk" above correct, or should it be
> "pll0_auxclk" like in da830_pll_clk_init()?

Yes, it should be "pll0_auxclk".

> 
>> +
>> +	clk = clk_register_fixed_factor(NULL, "rmii", "pll0_sysclk7", 0, 1, 1);
>> +	clk_register_clkdev(clk, "rmii", NULL);
> 
> I don't see any driver looking for this clock using con_id "rmii". I
> know this came from existing code. But its most likely a vestige and can
> be dropped.
> 
> Thanks,
> Sekhar
> 
