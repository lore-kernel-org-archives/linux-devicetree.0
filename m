From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/20] Armada 370/XP watchdog support
Date: Thu, 30 Jan 2014 23:00:50 +0100
Message-ID: <52EACB92.2080700@gmail.com>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com> <20140129181949.GB27143@localhost> <20140130205315.GD29184@titan.lakedaemon.net> <20140130215056.GA1063@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140130215056.GA1063@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/30/2014 10:50 PM, Ezequiel Garcia wrote:
> On Thu, Jan 30, 2014 at 03:53:15PM -0500, Jason Cooper wrote:
>> Ezequiel,
>>
>> On Wed, Jan 29, 2014 at 03:19:50PM -0300, Ezequiel Garcia wrote:
>>> On Mon, Jan 27, 2014 at 12:27:00PM -0300, Ezequiel Garcia wrote:
>>>> A new round, mostly fixing some minor nitpicks.
>>>>
>>>
>>> If anyone wants to give this a test, here's a public branch:
>>>
>>> https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_for_v3.14_v5
>>
>> I just took a quick glance at this (commit oneliners/tags) and there
>> doesn't appear to be any dependence on Sebastian's series.  Did I miss
>> something?
>>
>
> True, I've completely missed that. I pushed the branch in a rush!
>
> Let me prepare a v6, fixing the remaining issue pointed out by Russell,
> and push again (together with Sebastian's irqchip fixes).

Umm, no. Just directly name irqchip-orion fixes. Jason will send a PR
for irqchip-fixes _with-in_ v3.14 while watchdog will go into v3.15.

Or are there any plans to get watchdog in *now*?

In any way, do not include my patches into your set.

Jason: Ezequiel's watchdog patches install an irq handler that will
panic(TM) on a watchdog irq. irqchip-orion does not properly clear
stale bridge irqs which could signal a watchdog irq left by bootloader
(or watchdog triggering between bootloader and driver probe).

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
