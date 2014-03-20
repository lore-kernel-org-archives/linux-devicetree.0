From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Thu, 20 Mar 2014 19:50:35 +0100
Message-ID: <13435143.OQHHLITVrH@avalon>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> <2161777.L3ZZmhyfM4@avalon> <20140320181820.GY7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140320181820.GY7528-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Thursday 20 March 2014 18:18:20 Russell King - ARM Linux wrote:
> On Thu, Mar 20, 2014 at 07:16:29PM +0100, Laurent Pinchart wrote:
> > On Thursday 20 March 2014 17:54:31 Grant Likely wrote:
> > > On Wed, 12 Mar 2014 10:25:56 +0000, Russell King - ARM Linux wrote:

[snip]

> > > > I believe trying to do this according to the flow of data is just
> > > > wrong. You should always describe things from the primary device for
> > > > the CPU towards the peripheral devices and never the opposite
> > > > direction.
> > > 
> > > Agreed.
> > 
> > Absolutely not agreed. The whole concept of CPU towards peripherals only
> > makes sense for very simple devices and breaks as soon as the hardware
> > gets more complex. There's no such thing as CPU towards peripherals when
> > peripherals communicate directly.
> > 
> > Please consider use cases more complex than just a display controller and
> > an encoder, and you'll realize how messy not being able to parse the
> > whole graph at once will become. Let's try to improve things, not to make
> > sure to prevent support for future devices.
> 
> That's odd, I did.
> 
> Please draw some (ascii) diagrams of the situations you're saying this
> won't work for, because at the moment all I'm seeing is some vague
> hand-waving rather than anything factual that I can relate to.  Help
> us to actually _see_ the problem you have with this approach so we can
> understand it.

Working on it. Given my drawing skills this will take a bit of time.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
