From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 10/44] clk: davinci: New driver for davinci PSC clocks
Date: Tue, 16 Jan 2018 10:51:45 -0600
Message-ID: <83f3d207-9645-cbdf-d6cf-b6e6a8458abe@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-11-git-send-email-david@lechnology.com>
 <e0a9af55-a8b1-c359-fe88-d038648e02f1@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0a9af55-a8b1-c359-fe88-d038648e02f1@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/16/2018 05:03 AM, Sekhar Nori wrote:
> On Monday 08 January 2018 07:47 AM, David Lechner wrote:
>> This adds a new driver for mach-davinci PSC clocks. This is porting the
>> code from arch/arm/mach-davinci/psc.c to the common clock framework and
>> is converting it to use regmap to simplify the code. Additionally, it adds
>> device tree support for these clocks.
>>
>> Note: although there are similar clocks for TI Keystone we are not able
>> to share the code for a few reasons. The keystone clocks are device tree
>> only and use legacy one-node-per-clock bindings. Also the keystone driver
>> makes the assumption that there is only one PSC per SoC and uses global
>> variables, but here we have two controllers per SoC.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---

>> +static void psc_config(struct davinci_psc_clk *psc,
>> +		       enum davinci_psc_state next_state)
>> +{
>> +	u32 epcpr, pdstat, mdstat, mdctl, ptstat;
>> +
>> +	mdctl = next_state;
>> +	if (psc->flags & LPSC_FORCE)
>> +		mdctl |= MDCTL_FORCE;
>> +	regmap_write_bits(psc->regmap, MDCTL(psc->lpsc), MDSTAT_STATE_MASK,
>> +			  mdctl);
> 
> Wont this ignore the MDCTL_FORCE bit since MDSTAT_STATE_MASK does not
> cover that?
> 
>> +
>> +	regmap_read(psc->regmap, PDSTAT(psc->pd), &pdstat);
>> +	if ((pdstat & PDSTAT_STATE_MASK) == 0) {
>> +		regmap_write_bits(psc->regmap, PDSTAT(psc->pd),
>> +				  PDSTAT_STATE_MASK, PDCTL_NEXT);
> 
> Shouldn't this be a write to PDCTL register?
> 

Looks like I have some mistakes here. Thank you.

...

>> +static struct clk *davinci_psc_clk_register(const char *name,
>> +					    const char *parent_name,
>> +					    struct regmap *regmap,
>> +					    u32 lpsc, u32 pd, u32 flags)
>> +{
>> +	struct clk_init_data init;
>> +	struct davinci_psc_clk *psc;
>> +	struct clk *clk;
>> +
>> +	psc = kzalloc(sizeof(*psc), GFP_KERNEL);
>> +	if (!psc)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	init.name = name;
>> +	init.ops = &davinci_psc_clk_ops;
>> +	init.parent_names = (parent_name ? &parent_name : NULL);
>> +	init.num_parents = (parent_name ? 1 : 0);
>> +	init.flags = CLK_SET_RATE_PARENT;
> 
> Is this needed since PSC does not cause any rate change?

Yes, because one of the PSCs is the ARM clock and for cpufreq, we
need to propagate the rate change up the chain to SYSCLK6.
