From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 04/11] ARM: davinci: da8xx: add usb phy clocks
Date: Wed, 23 Mar 2016 23:24:31 +0530
Message-ID: <56F2D857.3040807@ti.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-5-git-send-email-david@lechnology.com>
 <56F2CAB8.3090705@ti.com> <56F2D61F.80000@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F2D61F.80000-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 March 2016 11:15 PM, David Lechner wrote:
> On 03/23/2016 11:56 AM, Sekhar Nori wrote:
>>>
>>> +static struct clk usb_ref_clk = {
>>> +    .name        = "usb_ref_clk",
>>> +    .rate        = 48000000,
>>> +    .set_rate    = davinci_simple_set_rate,
>>> +};
>>
>> can we call this usb_refclkin so it matches the TRM name? Also, should
>> this node be not be coming through individual board files as the rate
>> depends on what is connected to the usb_refclkin pin? Or is the
>> expectation that boards will call clk_set_rate() on this clock to the
>> correct value? If yes, I think it is misleading to populate the .rate
>> here.
> 
> You are right. When I did this, I was looking at USB 1.1 only, which
> MUST be 48MHz. However, this can be used for USB 2.0 which can accept a
> number of rates.
> 
> However, even the main reference oscillator in da850.c has the rate hard
> coded in da850.c (DA850_REF_FREQ).

:)

> 
> The clock initialization will fail if a clock does not have a parent or
> a rate, so we have to give it a default rate since it is an external
> clock and has no parent. So, I think 48MHz makes sense for a default
> value. Most boards will probably not be using this clock anyway, but
> rather the PLL in the USB 2.0 PHY.

Alright, I guess the only change is to call it usb_refclkin

> 
> 
>>> +
>>> +    pr_info("Waiting for USB 2.0 PHY clock good...\n");
>>> +    while (!(readl(DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG))
>>> +                        & CFGCHIP2_PHYCLKGD))
>>> +        cpu_relax();
>>
>> I guess this is copying some earlier code, but still, it will be nice to
>> see a timeout mechanism here, rather than loop endlessly.
> 
> Do you have a suggestion on how to do this?

Simplest would be to use a udelay(1) inside the loop and count a
specific number of times (sufficiently large to not cause false
negatives and sufficiently small so as to not appear that board is
frozen forever).

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
