From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] irqchip: Add bcm2836 interrupt controller for Raspberry
 Pi 2.
Date: Mon, 13 Jul 2015 23:09:56 -0600
Message-ID: <55A499A4.2000809@wwwdotorg.org>
References: <1436303617-17185-1-git-send-email-eric@anholt.net> <1436303617-17185-5-git-send-email-eric@anholt.net> <55A0A5EB.4090007@wwwdotorg.org> <alpine.DEB.2.11.1507110940420.17353@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1507110940420.17353@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/11/2015 01:51 AM, Thomas Gleixner wrote:
> On Fri, 10 Jul 2015, Stephen Warren wrote:
>> On 07/07/2015 03:13 PM, Eric Anholt wrote:
>>> +static struct arm_local_intc intc  __read_mostly;
>>
>> It'd be nice to give everything (types, functions, variables) a
>> consistent symbol prefix; bcm2836_arm_irqchip_ sounds like a good
>> bikeshed to me, but perhaps just propagating the above arm_local_ to the
>> functions too would be good, although that seems to risk symbol name
>> collisions with other ARM SoCs.
> 
> Which is irrelevant because its static.

Except if you want to look up a symbol name without having to qualify it
by filename.

Or, does e.g. gdb require statics always be qualified even if they're
globally unique?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
