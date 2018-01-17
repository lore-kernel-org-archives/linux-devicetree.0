From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 10/44] clk: davinci: New driver for davinci PSC clocks
Date: Wed, 17 Jan 2018 11:28:41 -0600
Message-ID: <b6cd0d89-82f5-66bd-f595-f13fc26bc557@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-11-git-send-email-david@lechnology.com>
 <e0a9af55-a8b1-c359-fe88-d038648e02f1@ti.com>
 <83f3d207-9645-cbdf-d6cf-b6e6a8458abe@lechnology.com>
 <1b568e12-dd45-f371-a1a8-576c97a6b58e@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1b568e12-dd45-f371-a1a8-576c97a6b58e@ti.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/17/2018 06:25 AM, Sekhar Nori wrote:
> On Tuesday 16 January 2018 10:21 PM, David Lechner wrote:
> 
>>>> +static struct clk *davinci_psc_clk_register(const char *name,
>>>> +                        const char *parent_name,
>>>> +                        struct regmap *regmap,
>>>> +                        u32 lpsc, u32 pd, u32 flags)
>>>> +{
>>>> +    struct clk_init_data init;
>>>> +    struct davinci_psc_clk *psc;
>>>> +    struct clk *clk;
>>>> +
>>>> +    psc = kzalloc(sizeof(*psc), GFP_KERNEL);
>>>> +    if (!psc)
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +
>>>> +    init.name = name;
>>>> +    init.ops = &davinci_psc_clk_ops;
>>>> +    init.parent_names = (parent_name ? &parent_name : NULL);
>>>> +    init.num_parents = (parent_name ? 1 : 0);
>>>> +    init.flags = CLK_SET_RATE_PARENT;
>>>
>>> Is this needed since PSC does not cause any rate change?
>>
>> Yes, because one of the PSCs is the ARM clock and for cpufreq, we
>> need to propagate the rate change up the chain to SYSCLK6.
> 
> Good point. But how about treating that as an exception with a new LPSC_
> quirk flag?

Sure.
