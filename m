From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when
 device-tree is used.
Date: Sat, 02 Nov 2013 10:10:25 +1100
Message-ID: <1383347425.28909.63.camel@pasglop>
References: <20131101145925.66e22f73@notabene.brown>
	 <1383279744.28909.26.camel@pasglop> <1383280054.28909.30.camel@pasglop>
	 <20131101160329.37f3707b@notabene.brown>
	 <1383282516.28909.36.camel@pasglop> <20131101204749.GA19662@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131101204749.GA19662-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-11-01 at 13:47 -0700, Greg Kroah-Hartman wrote:

> > > On my device I seem to have some platform devices registered through
> > > device-tree, and some registered through platform_device_add (e.g.
> > > 'alarmtimer').  Guaranteeing they remain disjoint sets if the kernel is
> > > allowed to evolve independently of the devicetree might be tricky....
> > > Maybe we need "/sys/devices/platform" and "/sys/devices/dt_platform" ??
> > 
> > No, I think device-tree created platform devices should go
> > to /sys/devices/platform like the "classic" ones.
> > 
> > The problem is really how to deal with potential name duplication. We
> > could try to register, if we get -EEXIST (assuming sysfs returns the
> > right stuff), try again with ".1" etc...
> 
> How can there be device name collisions?  All platform devices _should_
> be named uniquely, if not, you have bigger problems...

The problem is how to create a unique name for a platform device created
from a device-tree node.

Device tree nodes aren't necessarily uniquely named. They are unique
under a given parent but that hierarchy isn't preserved when creating
corresponding platform devices (and it would be very tricky to do so).

Currently, we simply append a number to the name when creating them,
which is obtained from a global counter.

Neil is unhappy about that because on his specific hardware, the device
has a unique name and thus we introduce a naming difference between
device-tree usage and old-style "hard coded" board file usage.

It would be nice if we could do something that only appends the "global
number" at the end of the name if the name isn't already unique. Thus my
proposal of trying first with the base name, and trying again if that
returns -EEXIST in some kind of loop.

Do you have a better idea ?

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
