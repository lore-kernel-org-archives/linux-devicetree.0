From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v6 4/8] of: Reduce indentation in of_graph_get_next_endpoint
Date: Mon, 10 Mar 2014 20:19:44 +0100
Message-ID: <1688746.6CaQoSDOni@avalon>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de> <31687163.hgTkcLrn0Z@avalon> <1394214054.16309.45.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394214054.16309.45.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Friday 07 March 2014 18:40:54 Philipp Zabel wrote:
> Am Freitag, den 07.03.2014, 01:12 +0100 schrieb Laurent Pinchart:
> > Hi Philipp,
> > 
> > Thank you for the patch.
> > 
> > I've submitted a fix for the of_graph_get_next_endpoint() function, but it
> > hasn't been applied yet due to the patch series that contained it needing
> > more work.
> > 
> > The patch is available at https://patchwork.linuxtv.org/patch/21946/. I
> > can rebase it on top of this series, but I still wanted to let you know
> > about it in case you would like to integrate it.
> 
> Thank you for the pointer. A pity about the timing, this will mostly
> revert my indentation patch. I'd be glad if you could rebase on top of
> the merged series.
> 
> While we look at of_graph_get_next_endpoint(), could you explain the
> reason behind the extra reference count increase on the prev node:
>
> 	/*
> 	 * Avoid dropping prev node refcount to 0 when getting the next
> 	 * child below.
> 	 */
> 	of_node_get(prev);
>
> This unfortunately makes using the function in for_each style macros a
> hassle. If that part wasn't there and all users that want to keep using
> prev after the call were expected to increase refcount themselves,
> we could have a
>
> #define of_graph_for_each_endpoint(parent, endpoint) \
> 	for (endpoint = of_graph_get_next_endpoint(parent, NULL); \
> 	     endpoint != NULL; \
> 	     endpoint = of_graph_get_next_endpoint(parent, endpoint))

I don't know what the exact design decision was (Sylwester might know), but I 
suspect it's mostly about historical reasons. I see no reason that would 
prevent modifying the current behaviour to make a for-each loop easier to 
implement.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
