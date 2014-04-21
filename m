From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dt: platform driver: Fill the resources before
 probe and defer if needed
Date: Mon, 21 Apr 2014 08:54:24 -0700
Message-ID: <20140421155424.GD23945@atomide.com>
References: <20140320161118.B7075C4067A@trevor.secretlab.ca>
 <1395413185-29763-1-git-send-email-jjhiblot@traphandler.com>
 <1395413185-29763-3-git-send-email-jjhiblot@traphandler.com>
 <CAL_Jsq+aU+rs28gV=Gesb_-Dy6Ht7zuKrRA6_hmqp94Uun23Yg@mail.gmail.com>
 <20140418205213.GA21823@atomide.com>
 <CAL_JsqJvVvo6R-qNXxur7wiZERKbi52xyKoWnmzJTfKS2iKK7A@mail.gmail.com>
 <20140418215848.GD21823@atomide.com>
 <20140418230335.GI24070@n2100.arm.linux.org.uk>
 <20140418232407.GQ21823@atomide.com>
 <CAL_JsqLvLTJwgsB-m0W72WxSUoTV4ubMdvM_a784J4k2eiK9AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLvLTJwgsB-m0W72WxSUoTV4ubMdvM_a784J4k2eiK9AQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [140421 06:47]:
> On Fri, Apr 18, 2014 at 6:24 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > * Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> [140418 16:04]:
> >> On Fri, Apr 18, 2014 at 02:58:48PM -0700, Tony Lindgren wrote:
> >> > Oh come on, let's stop pretending it's not broken. And it's way worse with
> >> > device tree as there's nothing making sure the resources for a driver
> >> > are set up before the driver probes. And we've been unable to fix just
> >> > this issue alone for about six months now. It's also broken beyond that.
> >> > It's called of_platform_bus yet it won't even pass the platform_data
> >> > as auxdata to the devices on a sub-bus instantatiated like I2C.
> >>
> >> Isn't there a much simpler solution to the platform device IRQ problem?
> >>
> >> Rather than trying to fix it at the point where the resources are
> >> created, why not just *not* have DT create the IRQ resources in the
> >> first place, and instead have platform_get_irq() (which is the function
> >> which should be used to get an IRQ) be the actor to do whatever is
> >> necessary to return the IRQ(s) ?
> >
> > Yeah why not. I don't see why we would need to do all this of_* special
> > trickery for much anything beyond parsing the binding.
> 
> That can work, but it will still need something like
> of_find_irq_domain() to determine whether to return -EPROBE_DEFER or
> not.

Right. Naturally let's do whatever it takes to first fix this issue
in a minimal way first for the -rc cycle so we can do the longer term
changes needed.
 
> You could also go in the other direction and don't create the device
> until the resources can be resolved. Unlike any of the other
> solutions, that would work for amba bus as well although we may never
> have a case where we need this with the amba bus. This would require
> making of_platform_populate be callable multiple times, but there are
> already some other reasons for wanting to do that. Specifically, I
> would like the core code to call of_platform_populate with default
> options and then only platforms with non-default options need a call
> to of_platform_populate.

I like this idea as this would also probably remove the the numerous
dmesg errors we are currently getting for drivers reprobing with
-EPROBE_DEFER.

In the long term we should have platform bus just call a set of
standardized functions implemented by whatever the data source might
be. That way we can limit the use of of_* functions in device drivers
to just parsing of custom bindings in the drivers and use bus specific
functions for everything else.

> >> Yes, I know we have some drivers which use platform_get_resources() with
> >> IORESOURCE_IRQ, but they should really use the right accessor.  And those
> >> who just dereference the resource array directly... get what's coming
> >> (though of course they have to be fixed.)
> >
> > $ git grep IORESOURCE_IRQ drivers/ | grep platform_get_resource | wc -l
> > 179
> 
> Certainly, this is worthwhile clean-up no matter what the solution.

Yeah agreed. But let's also consider the IORESOURCE_IRQ as just another
source for for the bus or driver data in addition to the DT parsed data.
Both sources of data should work just fine with platform_bus even
without cleaning up the drivers.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
