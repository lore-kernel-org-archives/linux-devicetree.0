From: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from
 drivers/media/v4l2-core to drivers/of
Date: Thu, 20 Mar 2014 15:38:04 -0300
Message-ID: <20140320153804.35d5b835@samsung.com>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de>
 <20140226110114.CF2C7C40A89@trevor.secretlab.ca> <531D916C.2010903@ti.com>
 <5427810.BUKJ3iUXnO@avalon> <20140312102556.GC21483@n2100.arm.linux.org.uk>
 <20140320175432.0559CC4067A@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140320175432.0559CC4067A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Em Thu, 20 Mar 2014 17:54:31 +0000
Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> escreveu:

> On Wed, 12 Mar 2014 10:25:56 +0000, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > On Mon, Mar 10, 2014 at 02:52:53PM +0100, Laurent Pinchart wrote:
> > > In theory unidirectional links in DT are indeed enough. However, let's not 
> > > forget the following.
> > > 
> > > - There's no such thing as single start points for graphs. Sure, in some 
> > > simple cases the graph will have a single start point, but that's not a 
> > > generic rule. For instance the camera graphs 
> > > http://ideasonboard.org/media/omap3isp.ps and 
> > > http://ideasonboard.org/media/eyecam.ps have two camera sensors, and thus two 
> > > starting points from a data flow point of view.
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

I don't agree, as what's the primary device is relative. 

Actually, in the case of a media data flow, the CPU is generally not
the primary device.

Even on general purpose computers, if the full data flow is taken into
the account, the CPU is a mere device that will just be used to copy
data either to GPU and speakers or to disk, eventually doing format
conversions, when the hardware is cheap and don't provide format
converters.

On more complex devices, like the ones we want to solve with the
media controller, like an embedded hardware like a TV or a STB, the CPU
is just an ancillary component that could even hang without stopping 
TV reception, as the data flow can be fully done inside the chipset.

Regards,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
