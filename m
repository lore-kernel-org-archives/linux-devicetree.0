From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 0/8] Move device tree graph parsing helpers to drivers/of
Date: Fri, 07 Mar 2014 18:49:34 +0000
Message-ID: <20140307184934.5F6D2C40D2A@trevor.secretlab.ca>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de> < 20140306152414.GC21483@n2100.arm.linux.org.uk> <1394120379.3622.37.camel@ paszta.hi.pengutronix.de> <20140306155018.GD21483@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140306155018.GD21483-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 6 Mar 2014 15:50:18 +0000, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Mar 06, 2014 at 04:39:39PM +0100, Philipp Zabel wrote:
> > Am Donnerstag, den 06.03.2014, 15:24 +0000 schrieb Russell King - ARM
> > Linux:
> > > On Wed, Mar 05, 2014 at 10:20:34AM +0100, Philipp Zabel wrote:
> > > > this version of the OF graph helper move series further addresses a few of
> > > > Tomi's and Sylwester's comments.
> > > 
> > > Philipp,
> > > 
> > > You mention in your other cover for imx-drm bits that this is available
> > > via:
> > > 
> > > 	git://git.pengutronix.de/git/pza/linux.git topic/of-graph
> > > 
> > > What is this tree based upon?
> > 
> > It is based on v3.14-rc5.
> 
> Great.  As everyone seems happy, can you both send me and Mauro a pull
> request for this please?  Once Mauro says it's in his tree, I'll pull
> it in for imx-drm stuff.
> 
> Thanks.

I'm really not. There are still unresolved issues.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
