From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Thu, 20 Mar 2014 19:16:29 +0100
Message-ID: <2161777.L3ZZmhyfM4@avalon>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> <20140312102556.GC21483@n2100.arm.linux.org.uk> <20140320175432.0559CC4067A@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140320175432.0559CC4067A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 20 March 2014 17:54:31 Grant Likely wrote:
> On Wed, 12 Mar 2014 10:25:56 +0000, Russell King - ARM Linux wrote:
> > On Mon, Mar 10, 2014 at 02:52:53PM +0100, Laurent Pinchart wrote:
> > > In theory unidirectional links in DT are indeed enough. However, let's
> > > not forget the following.
> > > 
> > > - There's no such thing as single start points for graphs. Sure, in some
> > > simple cases the graph will have a single start point, but that's not a
> > > generic rule. For instance the camera graphs
> > > http://ideasonboard.org/media/omap3isp.ps and
> > > http://ideasonboard.org/media/eyecam.ps have two camera sensors, and
> > > thus two starting points from a data flow point of view.
> > 
> > I think we need to stop thinking of a graph linked in terms of data
> > flow - that's really not useful.
> > 
> > Consider a display subsystem.  The CRTC is the primary interface for
> > the CPU - this is the "most interesting" interface, it's the interface
> > which provides access to the picture to be displayed for the CPU.  Other
> > interfaces are secondary to that purpose - reading the I2C DDC bus for
> > the display information is all secondary to the primary purpose of
> > displaying a picture.
> > 
> > For a capture subsystem, the primary interface for the CPU is the frame
> > grabber (whether it be an already encoded frame or not.)  The sensor
> > devices are all secondary to that.
> > 
> > So, the primary software interface in each case is where the data for
> > the primary purpose is transferred.  This is the point at which these
> > graphs should commence since this is where we would normally start
> > enumeration of the secondary interfaces.
> > 
> > V4L2 even provides interfaces for this: you open the capture device,
> > which then allows you to enumerate the capture device's inputs, and
> > this in turn allows you to enumerate their properties.  You don't open
> > a particular sensor and work back up the tree.
> > 
> > I believe trying to do this according to the flow of data is just wrong.
> > You should always describe things from the primary device for the CPU
> > towards the peripheral devices and never the opposite direction.
> 
> Agreed.

Absolutely not agreed. The whole concept of CPU towards peripherals only makes 
sense for very simple devices and breaks as soon as the hardware gets more 
complex. There's no such thing as CPU towards peripherals when peripherals 
communicate directly.

Please consider use cases more complex than just a display controller and an 
encoder, and you'll realize how messy not being able to parse the whole graph 
at once will become. Let's try to improve things, not to make sure to prevent 
support for future devices.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
