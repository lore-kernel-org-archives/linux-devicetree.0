From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Tue, 11 Feb 2014 18:24:19 +0100
Message-ID: <1630124.cN9chd5dbu@avalon>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> <8648675.AIXYyYlgXy@avalon> <1392136617.6943.33.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392136617.6943.33.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Tuesday 11 February 2014 17:36:57 Philipp Zabel wrote:
> Am Dienstag, den 11.02.2014, 16:23 +0100 schrieb Laurent Pinchart:
> > On Tuesday 11 February 2014 14:52:48 Russell King - ARM Linux wrote:
> > > On Tue, Feb 11, 2014 at 07:56:33AM -0600, Rob Herring wrote:
> > > > On Tue, Feb 11, 2014 at 5:45 AM, Philipp Zabel wrote:
> > > > > This allows to reuse the same parser code from outside the V4L2
> > > > > framework, most importantly from display drivers. There have been
> > > > > patches that duplicate the code (and I am going to send one of my
> > > > > own),
> > > > > such as
> > > > > http://lists.freedesktop.org/archives/dri-devel/2013-August/043308.h
> > > > > tml
> > > > > and others that parse the same binding in a different way:
> > > > > https://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg100761.ht
> > > > > ml
> > > > > 
> > > > > I think that all common video interface parsing helpers should be
> > > > > moved to a single place, outside of the specific subsystems, so that
> > > > > it can be reused by all drivers.
> > > > 
> > > > Perhaps that should be done rather than moving to drivers/of now and
> > > > then again to somewhere else.
> > > 
> > > Do you have a better suggestion where it should move to?
> > > 
> > > drivers/gpu/drm - no, because v4l2 wants to use it
> > > drivers/media/video - no, because DRM drivers want to use it
> > > drivers/video - no, because v4l2 and drm drivers want to use it
> > 
> > Just pointing out a missing location (which might be rejected due to
> > similar concerns), there's also drivers/media, which isn't V4L-specific.
> 
> Since drivers/Makefile has media/ in obj-y, moving the graph helpers to
> drivers/media should technically work.
> 
> > > Maybe drivers/of-graph/ ?  Or maybe it's just as good a place to move it
> > > into drivers/of ?
> 
> include/media/of_graph.h,
> drivers/media/of_graph.c?

I'm personally fine with that.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
