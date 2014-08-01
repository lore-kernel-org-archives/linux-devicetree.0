From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Fri, 01 Aug 2014 12:04:35 +0200
Message-ID: <53DB6633.3020005@kpanic.de>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-3-git-send-email-sassmann@kpanic.de> <53DA3613.9010305@ti.com> <53DA3C68.3020406@kpanic.de> <53DA3D66.1030407@ti.com> <53DA4D37.4030408@kpanic.de> <20140731192053.4463.27499@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140731192053.4463.27499@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31.07.2014 21:20, Mike Turquette wrote:
> Quoting Stefan Assmann (2014-07-31 07:05:43)
>> On 31.07.2014 14:58, Peter Ujfalusi wrote:
>>> On 07/31/2014 03:54 PM, Stefan Assmann wrote:
>>>>> Why would you do this? The point of a clock provider is that you can
>>>>> enable/disable the clock on demand. Here you enable the clock and leave it
>>>>> enabled for the rest of the time...
>>>>>
>>>>> clk-dra7-atl deals with similar issue
>>>>
>>>> The idea is to enable the clock by default to get the wifi working.
>>>> Sorry if I got it wrong.
>>>
>>> You should have a clock driver for the 32K clock. The wifi driver should
>>> request and manage it's clocks via the clock API.
>>>
>>
>> If the clock does not get enabled the wifi driver wl12xx doesn't even
>> get probed. Which is my initial problem. Maybe I need to figure that out
>> first.
> 
> Sounds like the wifi driver's probe is missing something like:

Thanks for the example Mike, but the issue is that the wifi drivers
probe function doesn't even get called without the clock being
powered/enabled. I've instrumented do_one_initcall() to verify this.
With the clock being enabled I see:
[   19.693511] init/main.c do_one_initcall:792 initcall wl1271_init+0x0/0x38 [wlcore_sdio]
[   20.993347] init/main.c do_one_initcall:792 initcall wl12xx_driver_init+0x0/0x14 [wl12xx]
If the clock is kept disabled none of the calls is made and we never get
to wl12xx_probe().
The device might not be discoverable without the clock.

Maybe we should rethink the idea of doing that single register write to
enable the device in twl-core code, if the TWL6030 is present.

Alternatively this could be done by u-boot. Seems like something that
should have been done by firmware upfront.

  Stefan

> 
> """
> #include <linux/clk.h>
> 
> int ret;
> 
> struct clk *clk32k = clk_get(...);
> 
> if (IS_ERR(clk32k))
>         explode();
> 
> ret = clk_prepare_enable(clk32k);
> 
> if (ret)
>         explode();
> """
> 
> Regards,
> Mike
> 
>>
>>   Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
