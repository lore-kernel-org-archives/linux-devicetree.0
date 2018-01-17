From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 10/44] clk: davinci: New driver for davinci PSC clocks
Date: Wed, 17 Jan 2018 17:55:16 +0530
Message-ID: <1b568e12-dd45-f371-a1a8-576c97a6b58e@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-11-git-send-email-david@lechnology.com>
 <e0a9af55-a8b1-c359-fe88-d038648e02f1@ti.com>
 <83f3d207-9645-cbdf-d6cf-b6e6a8458abe@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <83f3d207-9645-cbdf-d6cf-b6e6a8458abe-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 16 January 2018 10:21 PM, David Lechner wrote:

>>> +static struct clk *davinci_psc_clk_register(const char *name,
>>> +                        const char *parent_name,
>>> +                        struct regmap *regmap,
>>> +                        u32 lpsc, u32 pd, u32 flags)
>>> +{
>>> +    struct clk_init_data init;
>>> +    struct davinci_psc_clk *psc;
>>> +    struct clk *clk;
>>> +
>>> +    psc = kzalloc(sizeof(*psc), GFP_KERNEL);
>>> +    if (!psc)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    init.name = name;
>>> +    init.ops = &davinci_psc_clk_ops;
>>> +    init.parent_names = (parent_name ? &parent_name : NULL);
>>> +    init.num_parents = (parent_name ? 1 : 0);
>>> +    init.flags = CLK_SET_RATE_PARENT;
>>
>> Is this needed since PSC does not cause any rate change?
> 
> Yes, because one of the PSCs is the ARM clock and for cpufreq, we
> need to propagate the rate change up the chain to SYSCLK6.

Good point. But how about treating that as an exception with a new LPSC_
quirk flag?

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
