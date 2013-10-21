From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or is there something	better?
Date: Mon, 21 Oct 2013 12:00:59 +0200
Message-ID: <2094033.tOlJaI9GT0@avalon>
References: <52644A9E.3060007@wwwdotorg.org> <20131020231134.GR25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131020231134.GR25034-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Monday 21 October 2013 00:11:34 Russell King - ARM Linux wrote:

[snip]

> Other thoughts on DT... it's a pain in the backside as it's far too
> easy to make a subtle mistake in a DT source file and have it "build"
> to a blob. You can then spend hours trying to debug why something isn't
> working, and it's very simply because you typo'd something.  A recent
> example:
> 
> 	pintctrl-0 = <...>;
> 
> and then you start wondering why aren't I getting signals out from the
> pins you want, and you start chasing around trying to find out if its
> something that you haven't thought of, whether some setting in the
> pin settings is wrong or whatever.  You completely fail to notice the
> additional 't' for hours and hours.  Eventually, you start pasting it
> onto IRC and at that point you spot the error.
> 
> You may laugh at that, but that's exactly what has happened - all
> because the DT compiler is freeform - provided the strings look okay
> to it, that's all it cares about.  Whether the description is correct
> for the device or not is outside of its concern.
> 
> I'm pretty certain that I won't be the only one who has gone through
> this - and I'm probably not going to be the last.
> 
> We already know that "board firmware" has a tendency to be buggy.  Well,
> the DT compiler as it stands today does nothing what so ever to help
> people make sure that what they _think_ they're typing into the DT
> file is actually correct.  All the time that we're have a tool which
> allows typos through we're going to encounter bugs like this.  Not a
> problem when DT is shipped with the kernel, but when it isn't, what
> then...

I just wanted to point to

http://www.spinics.net/lists/devicetree/msg08856.html

The DT compiler (or an external tool) would get the ability the validate the 
DT source against a schema to spot missing properties, extra properties not 
defined in the bindings, or other kind of mistakes. The schema would be 
considered part of the bindings themselves and would be the authoritative 
source of information. It will obviously not solve all issues, but it should 
be a good starting point.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
