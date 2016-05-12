From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Subject: Re: [PATCH 0/4] add minimal bcm2835-sdram driver
Date: Thu, 12 May 2016 18:03:00 +0200
Message-ID: <9C676BB7-E96C-4526-B0FD-2D441C1200CC@martin.sperl.org>
References: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org> <1861597197.20753.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange@email.1und1.de> <B30D094A-1E5A-4777-8F2A-C3D53AF89044@martin.sperl.org> <527736177.22944.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange@email.1und1.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527736177.22944.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On 12.05.2016, at 17:55, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> 
> Hi,
> 
>> Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org> hat am 12. Mai 2016 um 17:28
>> geschrieben:
>> 
>> 
>> 
>>> On 12.05.2016, at 16:50, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
>>> 
>>> Hi Martin,
>>> 
>>>> kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org hat am 12. Mai 2016 um 14:38 geschrieben:
>>>> 
>>>> 
>>>> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>>>> 
>>>> As the sdram clock is a critical clock to the system
>>>> the minimal bcm2835-sdram driver claims (and enables)
>>>> this clock and also exposes the corresponding sdram
>>>> registers via debugfs.
>>> 
>>> sounds like this driver should fix an clock handling issue. Unfortunately
>>> this
>>> isn't a solution in case the driver is disabled.
>> Unfortunately there is no way around this - the driver has
>> to be enabled so that the sdram clock or the parent pll,
>> which typically is plld_core, never gets disabled.
>> 
>> The only other option would be marking the clock as critical
>> for those legacy drivers.
> 
> i would prefer this option. Since this would be more a fix we could get this
> faster in, it's more clear why we are doing that and less to review.
> 
> Did i miss a drawback?

We had long discussions already on that - and HAND_OFF did not make
it into the kernel either.

I had hoped that this was simple enough.

Martin



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
