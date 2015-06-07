From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] drivers: of/base: move of_init to driver_init
Date: Sun, 07 Jun 2015 08:05:39 +0100
Message-ID: <20150607070539.A8C7EC409D1@trevor.secretlab.ca>
References: <1431595695-17103-1-git-send-email-sudeep.holla@arm.com>
	<1431613704-30801-1-git-send-email-sudeep.holla@arm.com>
	<555B2C9C.1000709@arm.com> <20150519171732.GD9213@kroah.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150519171732.GD9213-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 19 May 2015 10:17:32 -0700
, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
 wrote:
> On Tue, May 19, 2015 at 01:29:16PM +0100, Sudeep Holla wrote:
> > Hi Rob/Greg,
> > 
> > On 14/05/15 15:28, Sudeep Holla wrote:
> > >Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> > >devices with an OF node") adds the symlink `of_node` for each device
> > >pointing to it's device tree node while creating/initialising it.
> > >
> > >However the devicetree sysfs is created and setup in of_init which is
> > >executed at core_initcall level. For all the devices created before
> > >of_init, the following error is thrown:
> > >	"Error -2(-ENOENT) creating of_node link"
> > >
> > >Like many other components in driver model, initialize the sysfs support
> > >for OF/devicetree from driver_init so that it's ready before any devices
> > >are created.
> > >
> > >Fixes: 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> > >	devices with an OF node")
> > >Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > >Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > >Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > >Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> > 
> > I assume one of you will pick this up if there are no further comments ?
> 
> I will once things settle down...

I've picked it up. Yell if you'd prefer to take it by your tree.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
