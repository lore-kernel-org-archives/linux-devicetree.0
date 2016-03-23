From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v2 03/11] ARM: davinci: da850: use clk->set_parent for
 async3
Date: Wed, 23 Mar 2016 12:20:28 -0500
Message-ID: <56F2D05C.8030909@lechnology.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-4-git-send-email-david@lechnology.com>
 <56F2BCAB.3040404@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F2BCAB.3040404-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/23/2016 10:56 AM, Sekhar Nori wrote:
> On Thursday 17 March 2016 07:56 AM, David Lechner wrote:
>> The da850 family of processors has an async3 clock domain that can be
>> muxed to either pll0_sysclk2 or pll1_sysclk2. Now that the davinci clocks
>> have a set_parent callback, we can use this to control the async3 mux
>> instead of a stand-alone function.
>>
>> This adds a new async3_clk and sets the appropriate child clocks. The
>> default is use to pll1_sysclk2 since it is not affected by processor
>> frequency scaling.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>
>> +static int da850_async3_set_parent(struct clk *clk, struct clk *parent)
>> +{
>> +	u32 __iomem *cfgchip3;
>> +	u32 val;
>> +
>> +	/*
>> +	 * Can't use DA8XX_SYSCFG0_VIRT() here since this can be called before
>> +	 * da8xx_syscfg0_base is initialized.
>> +	 */
>> +	cfgchip3 = ioremap(DA8XX_SYSCFG0_BASE + DA8XX_CFGCHIP3_REG, 4);
>
> Is this just a theoretical possibility or have you seen this happen? I
> would like to see if there are ways of avoiding this rather than throw
> away usage of DA8XX_SYSCFG0_VIRT()

Yes, it will not boot without this. The problem comes from the fact that 
clocks are setup in davinci_common_init() which is called before 
da8xx_syscfg0_base = ioremap(DA8XX_SYSCFG0_BASE, SZ_4K) in da850_init() 
(and da830_init()). I also tried moving the ioremap() before 
davinci_common_init(), but davinci_common_init() sets up the iomem, so 
that doesn't work either.

So, if you want to use DA8XX_SYSCFG0_VIRT() here, the clock init would 
have to be split out from davinci_common_init() which would affect all 
davinci devices.


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
