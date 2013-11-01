From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when device-tree
 is used.
Date: Fri, 1 Nov 2013 13:47:49 -0700
Message-ID: <20131101204749.GA19662@kroah.com>
References: <20131101145925.66e22f73@notabene.brown>
 <1383279744.28909.26.camel@pasglop>
 <1383280054.28909.30.camel@pasglop>
 <20131101160329.37f3707b@notabene.brown>
 <1383282516.28909.36.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383282516.28909.36.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 04:08:36PM +1100, Benjamin Herrenschmidt wrote:
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

How can there be device name collisions?  All platform devices _should_
be named uniquely, if not, you have bigger problems...

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
