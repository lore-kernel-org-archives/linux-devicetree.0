From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [GIT PULL] Move device tree graph parsing helpers to drivers/of
Date: Tue, 18 Mar 2014 00:41:06 +0100
Message-ID: <4863677.8zxQKX1J0F@avalon>
References: <1394126000.3622.66.camel@paszta.hi.pengutronix.de> <6341585.ZqkoDDr3Wb@avalon> <1394799579.3710.24.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394799579.3710.24.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Friday 14 March 2014 13:19:39 Philipp Zabel wrote:
> Am Donnerstag, den 13.03.2014, 18:13 +0100 schrieb Laurent Pinchart:
> > On Thursday 13 March 2014 12:08:16 Philipp Zabel wrote:
> > > Am Montag, den 10.03.2014, 14:37 +0000 schrieb Grant Likely:
> > > > > > Nak. I made comments that haven't been resolved yet. I've replied
> > > > > > with more detail tonight. The big issues are how drivers handle
> > > > > > the optional 'ports' node and I do not agree to the double-linkage
> > > > > > in the binding description.
> > > 
> > > so as I understand it, nobody is against dropping the double-linkage
> > > *if* we can agree on a way to recreate the backlinks in the kernel.
> > 
> > I'm not sure about "nobody", but even though it might not be my favorite
> > option I'd be OK with that.
> 
> Ok, I make that assumption going by the discussion about link direction that
> ensued.
> 
> > > My current suggestion would be to parse the complete device tree into an
> > > internal graph structure once, at boot to achieve this. This code could
> > > look for the optional 'ports' node if and only if the parent device node
> > > contains #address-cells != <1> or #size-cells != <0> properties.
> > 
> > With backlinks in DT we can assume that, if a node is the target of a
> > link, it will be compatible with the of-graph bindings, and thus parse
> > the node to locate other ports and other links. This allows parsing the
> > full graph without help of individual drivers.
> 
> Yes.
> 
> > Without backlinks in DT we need to parse the full DT to reconstruct
> > backlinks in the kernel. One possible issue with that is that we can't
> > know whether a node implements the of-graph bindings. We can use the
> > heuristic you've described above, but I wonder if it could lead to
> > problems. Grant pointed out that the compatibility string defines what
> > binding a node uses, and that we can't thus look for properties randomly.
> > I don't think there's a risk to interpret an unrelated node as part of a
> > graph though.
> 
> False positives would just take up a bit of space in the endpoint lists, but
> otherwise should be no problem, as they would only be used when either a
> driver implementing the bindings is bound, or when they are connected to
> other endpoints. Whether or not we scan the whole tree, using this
> heuristic, is more a matter of principle.

That is my understanding as well, so we should be good there.

> > > People completely disagree about the direction the phandle links should
> > > point in. I am still of the opinion that the generic binding should
> > > describe just the topology, that the endpoint links in the kernel
> > > should represent an undirected graph and the direction of links should
> > > not matter at all for the generic graph bindings.
> > 
> > I would also not mandate a specific direction at the of-graph level and
> > leave it to subsystems (or possibly drivers) to specify the direction.
> 
> Thank you. Can everybody live with this?

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
