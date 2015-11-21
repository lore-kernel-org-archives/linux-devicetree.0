From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH 4/4] MIPS: bmips: Convert bcm63xx_wdt to use WATCHDOG_CORE
Date: Sat, 21 Nov 2015 21:44:27 +0000
Message-ID: <5650E5BB.6020404@simon.arlott.org.uk>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <5650C08C.6090300@simon.arlott.org.uk> <5650E2FA.6090408@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5650E2FA.6090408-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/11/15 21:32, Guenter Roeck wrote:
> On 11/21/2015 11:05 AM, Simon Arlott wrote:
>> Convert bcm63xx_wdt to use WATCHDOG_CORE and add a device tree binding.
>>
>> Adds support for the time left value and provides a more effective
>> interrupt handler based on the watchdog warning interrupt behaviour.
>>
>> This removes the unnecessary software countdown timer and replaces the
>> use of bcm63xx_timer with a normal interrupt when not using mach-bcm63xx.
>>
> 
> Hi Simon,
> 
> this is really doing a bit too much in a single patch.
> Conversion to the watchdog infrastructure should probably be
> the first step, followed by further optimizations and improvements.

I'll split it into two patches, but that won't remove the need for #ifdefs.

> In general, it would be great if we can avoid #ifdef in the code.
> Maybe there is some other means to determine if one code path
> needs to be taken or another. The driver may be part of a
> multi-platform image, and #ifdefs in the code make that all
> but impossible. Besides, it makes the code really hard to read
> and understand.

It's impossible to avoid the #ifdefs because the driver needs to support
mach-bmips while still supporting mach-bcm63xx. I don't think they make
it too difficult to understand. Until there are device tree supporting
drivers for everything mach-bcm63xx needs, it can't be removed.

> We have some infrastructure changes in the works which will move
> the need for soft-timers from individual drivers into the watchdog core.
> Would this possibly be helpful here ? The timer-driven watchdog ping
> seems to accomplish pretty much the same.

There is no need for a software timer. This is not a timer-driven
watchdog ping, there is an unmaskable timer interrupt when the watchdog
timer has less than 50% remaining.

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
