From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Thu, 31 Jul 2014 16:05:43 +0200
Message-ID: <53DA4D37.4030408@kpanic.de>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-3-git-send-email-sassmann@kpanic.de> <53DA3613.9010305@ti.com> <53DA3C68.3020406@kpanic.de> <53DA3D66.1030407@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DA3D66.1030407-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31.07.2014 14:58, Peter Ujfalusi wrote:
> On 07/31/2014 03:54 PM, Stefan Assmann wrote:
>>> Why would you do this? The point of a clock provider is that you can
>>> enable/disable the clock on demand. Here you enable the clock and leave it
>>> enabled for the rest of the time...
>>>
>>> clk-dra7-atl deals with similar issue
>>
>> The idea is to enable the clock by default to get the wifi working.
>> Sorry if I got it wrong.
> 
> You should have a clock driver for the 32K clock. The wifi driver should
> request and manage it's clocks via the clock API.
> 

If the clock does not get enabled the wifi driver wl12xx doesn't even
get probed. Which is my initial problem. Maybe I need to figure that out
first.

  Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
