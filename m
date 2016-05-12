From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Subject: Re: [PATCH 0/4] add minimal bcm2835-sdram driver
Date: Thu, 12 May 2016 21:46:17 +0200
Message-ID: <BF982CDB-28CF-4AB3-BC4B-E1D88F34E72A@martin.sperl.org>
References: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org> <87twi39m80.fsf@eliezer.anholt.net>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87twi39m80.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



> On 12.05.2016, at 20:15, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> 
> kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org writes:
> 
>> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>> 
>> As the sdram clock is a critical clock to the system
>> the minimal bcm2835-sdram driver claims (and enables)
>> this clock and also exposes the corresponding sdram
>> registers via debugfs.
> 
> I don't think this is a good solution to the problem you are trying to
> work around.  You're relying on the fact that this driver gets
> successfully probed before a driver that would -EPROBE_DEFER on a
> sibling clock, which is not a guarantee.
Ah - that is probably the reason why hand_off has not gone in...

> 
> Let's please continue the debugging of clock management on linux-clk.

I am just trying to find a solution that works...

Still I think that having a driver that claims the clock and register range
is good to have - at least this way we can have a peek at what
the firmware does set up.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
