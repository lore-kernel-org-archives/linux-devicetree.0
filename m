From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something better?
Date: Tue, 19 Nov 2013 13:54:32 +0000
Message-ID: <20131119135432.9DD0AC4079D@trevor.secretlab.ca>
References: <52644A9E.3060007@wwwdotorg.org> <20131020231134.GR25034@n2100. arm.linux.org.uk> <20131021083242.GB30088@pengutronix.de> <20131021084854. GV25034@n2100.arm.linux.org.uk> <20131021092730.GF30088@pengutronix.de> < CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com> < 20131024072811.GS30088@pengutronix.de> < CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A@mail.gmail.com> < 20131118124518.GA16735@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131118124518.GA16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 18 Nov 2013 12:45:19 +0000, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Oct 24, 2013 at 05:21:54PM -0400, Rob Clark wrote:
> > ahh, ok.  Yeah, we do need some way to make this easier, as it is a
> > too-common pattern.  I do think we do need a way to know if something
> > is missing because it isn't there vs it hasn't been probed yet.  Ie.
> > late_initcall() is not the awesome solution.
> 
> On this topic, I now have a solution to this which is not DRM specific,
> nor is it DT specific.
> 
> It's a core piece of code which gathers up the struct device pointers,
> and a callback for the master device to assemble the components and
> indicate when the master is complete.

That's pretty clean. I think that will work nicely.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
