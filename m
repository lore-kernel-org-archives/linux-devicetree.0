From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] [media] of: move graph helpers from
 drivers/media/v4l2-core to drivers/media
Date: Wed, 12 Feb 2014 10:25:54 +0100
Message-ID: <1392197154.5536.26.camel@pizza.hi.pengutronix.de>
References: <1392154905-12007-1-git-send-email-p.zabel@pengutronix.de>
	 <52FB1FA8.2070903@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FB1FA8.2070903-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tomi,

Am Mittwoch, den 12.02.2014, 09:15 +0200 schrieb Tomi Valkeinen:
> Hi,
> 
> On 11/02/14 23:41, Philipp Zabel wrote:
> > From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > This patch moves the parsing helpers used to parse connected graphs
> > in the device tree, like the video interface bindings documented in
> > Documentation/devicetree/bindings/media/video-interfaces.txt, from
> > drivers/media/v4l2-core to drivers/media.
> > 
> > This allows to reuse the same parser code from outside the V4L2
> > framework, most importantly from display drivers.
> > The functions v4l2_of_get_next_endpoint, v4l2_of_get_remote_port,
> > and v4l2_of_get_remote_port_parent are moved. They are renamed to
> > of_graph_get_next_endpoint, of_graph_get_remote_port, and
> > of_graph_get_remote_port_parent, respectively.
> > Since there are not that many current users, switch all of them
> > to the new functions right away.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Acked-by: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
> 
> I don't think the graphs or the parsing code has anything video
> specific. It could well be used for anything, whenever there's need to
> describe connections between devices which are not handled by the normal
> child-parent relationships. So the code could well reside in some
> generic place, in my opinion.
> 
> Also, I have no problem with having it in drivers/media, but
> drivers/video should work also. We already have other, generic, video
> related things there like hdmi infoframes and display timings.

I agree. In case anybody wants to use this for audio in the future,
media already sounds more generic than video.

> And last, it's fine to move the funcs as-is in the first place, but I
> think they should be improved a bit before non-v4l2 users use them.

The get_remote_port(_parent) are fine, I think.

> There are a couple of things I tried to accomplish with the omapdss
> specific versions in
> https://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg100761.html:
>
> - Iterating ports and endpoints separately. If a node has multiple
> ports, I would think that the driver needs to know which port and
> endpoint combination is the current one during iteration. It's not
> enough to just get the endpoint.

Yes, I'd already have a use-case for that in enumerating the
encoders/panels connected to a single display interface (port).

On the other hand if you just want to enumerate components from the
device tree, iterating over all endpoints of all ports is useful, too.

> - Simplify cases when there's just one port and one endpoint, in which
> case the port node can be omitted from the DT data.

Also, I'd like to drop the prev reference in get_next_endpoint, then a
for_each_endpoint macro could be made from that.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
