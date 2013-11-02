From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when device-tree
 is used.
Date: Sat, 2 Nov 2013 08:58:24 -0700
Message-ID: <20131102155824.GG23938@kroah.com>
References: <20131101145925.66e22f73@notabene.brown>
 <1383279744.28909.26.camel@pasglop>
 <1383280054.28909.30.camel@pasglop>
 <20131101160329.37f3707b@notabene.brown>
 <1383282516.28909.36.camel@pasglop>
 <20131101204749.GA19662@kroah.com>
 <1383347399.28909.46.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383347399.28909.46.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 02, 2013 at 10:09:59AM +1100, Benjamin Herrenschmidt wrote:
> On Fri, 2013-11-01 at 13:47 -0700, Greg Kroah-Hartman wrote:
> 
> > > > On my device I seem to have some platform devices registered through
> > > > device-tree, and some registered through platform_device_add (e.g.
> > > > 'alarmtimer').  Guaranteeing they remain disjoint sets if the kernel is
> > > > allowed to evolve independently of the devicetree might be tricky....
> > > > Maybe we need "/sys/devices/platform" and "/sys/devices/dt_platform" ??
> > > 
> > > No, I think device-tree created platform devices should go
> > > to /sys/devices/platform like the "classic" ones.
> > > 
> > > The problem is really how to deal with potential name duplication. We
> > > could try to register, if we get -EEXIST (assuming sysfs returns the
> > > right stuff), try again with ".1" etc...
> > 
> > How can there be device name collisions?  All platform devices _should_
> > be named uniquely, if not, you have bigger problems...
> 
> The problem is how to create a unique name from a platform device
> created from a device-tree node.

I have no idea, and frankly, I don't care, I leave that to the
device-tree maintainers, as they are the ones that are using platform
devices for this type of kernel interaction.

So go blame them for this, not me, remember, I'm the one who _hates_
platform devices and wish they had never been created...

> Device tree nodes aren't necessarily uniquely named. They are unique
> under a given parent but that hierarchy isn't preserved when creating
> corresponding platform devices (and it would be very tricky to do so).
> 
> Currently, we simply append a number to the name when creating them,
> which is obtained from a global counter.

That's the best solution, you can't rely on device ids being the same
for any type of bus, that's just life.

> Neil is unhappy about that because on his specific hardware, the device
> has a unique name and thus we introduce a naming difference between
> device-tree usage and old-style "hard coded" board file usage.
> 
> It would be nice if we could do something that only appends the "global
> number" at the end of the name if the name isn't already unique. Thus my
> proposal of trying first with the base name, and trying again if that
> returns -EEXIST in some kind of loop.

Just loop through all the platform devices before registering it to
determine if you need to do this, the platform code can do this just
fine.  If you try to register a duplicate name with the driver core,
odds are it will complain loudly, so don't do that.

good luck,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
