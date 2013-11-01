From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when device-tree is used.
Date: Fri, 01 Nov 2013 11:04:59 -0700
Message-ID: <20131101180459.81793C40A28@trevor.secretlab.ca>
References: <20131101145925.66e22f73@notabene.brown> <1383279744.28909.26.camel@pasglop> <1383280054.28909.30.camel@pasglop> <20131101160329.37f3707b@notabene.brown> <1383282516.28909.36.camel@pasglop>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383282516.28909.36.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 01 Nov 2013 16:08:36 +1100, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2013-11-01 at 16:03 +1100, NeilBrown wrote:
> 
> > Do you mean we could allow multiple devices on the one bus to have the same
> > name, but get sysfs to notice and de-duplicate by mangling one name?  I don't
> > think I like that but I might have misunderstood.
> 
> What other option do we have ?
> 
> > On my device I seem to have some platform devices registered through
> > device-tree, and some registered through platform_device_add (e.g.
> > 'alarmtimer').  Guaranteeing they remain disjoint sets if the kernel is
> > allowed to evolve independently of the devicetree might be tricky....
> > Maybe we need "/sys/devices/platform" and "/sys/devices/dt_platform" ??
> 
> No, I think device-tree created platform devices should go
> to /sys/devices/platform like the "classic" ones.
> 
> The problem is really how to deal with potential name duplication. We
> could try to register, if we get -EEXIST (assuming sysfs returns the
> right stuff), try again with ".1" etc...

I'd be fine with that approach. As long as the names get created
uniquely there shouldn't be a problem.

> > Hoping someone who understands the device model better than me will help.
> 
> Greg ? :-)

There are two problems here. First, making the change moves all the DT
populated devices under the /sys/devices/platform tree, not just
platform devices.

Second, I expect there is going to be userspace breakage to move them.
I've considered moving them before, but so far have felt that being
tidier hasn't been worth the potential breakage. Userspace /shouldn't/
be relying on the node name, but we all know that userspace always does
what it should, right?

That said, I'm mostly concerned about breakage on Power machines, not on
the ARM devices in this regard. If you are convinced that I'm worrying about
nothing, then I'm fine with making the change. If anyone complains
however then it will need to be reverted.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
