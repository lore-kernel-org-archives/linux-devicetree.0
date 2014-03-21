From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Fri, 21 Mar 2014 14:33:04 +0000
Message-ID: <20140321143304.D62ADC405B0@trevor.secretlab.ca>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> < 139468148.3QhLg3QYq1@avalon> <531F08A8.300@ti.com> <1883687.VdfitvQEN3@ samsung.com> <avalon@samsung.com> <20140320172302.CD320C4067A@trevor. secretlab.ca> <532C1808.6090409@samsung.com> <20140321114735.3E132C4052A@ trevor.secretlab.ca> <532C2D94.4020705@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <532C2D94.4020705-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 21 Mar 2014 14:16:20 +0200, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> On 21/03/14 13:47, Grant Likely wrote:
> 
> > I'm firm on the opinion that the checking must also happen at runtime.
> > The biggest part of my objection has been how easy it would be to get a
> > linkage out of sync, and dtc is not necessarily the last tool to touch
> > the dtb before the kernel gets booted. I want the kernel to flat out
> > reject any linkage that is improperly formed.
> 
> Isn't it trivial to verify it with the current v4l2 bindings? And
> endpoint must have a 'remote-endpoint' property, and the endpoint on the
> other end must have similar property, pointing in the first endpoint.
> Anything else is an error.
> 
> I agree that it's easier to write bad links in the dts with
> double-linking than with single-linking, but it's still trivial to
> verify it in the kernel.

Right, which is exactly what I'm asking for.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
