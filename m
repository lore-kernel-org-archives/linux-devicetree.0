From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL] Move device tree graph parsing helpers to drivers/of
Date: Mon, 10 Mar 2014 14:37:58 +0000
Message-ID: <20140310143758.3734FC405FA@trevor.secretlab.ca>
References: <1394126000.3622.66.camel@paszta.hi.pengutronix.de> < 20140307182330.75168C40AE3@trevor.secretlab.ca> <20140310102630.3cb1bcd7@ samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140310102630.3cb1bcd7-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Mar 2014 10:26:30 -0300, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Em Fri, 07 Mar 2014 18:23:30 +0000
> Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> escreveu:
> 
> > On Thu, 06 Mar 2014 18:13:20 +0100, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > Hi Mauro, Russell,
> > > 
> > > I have temporarily removed the simplified bindings at Sylwester's
> > > request and updated the branch with the acks. The following changes
> > > since commit 0414855fdc4a40da05221fc6062cccbc0c30f169:
> > > 
> > >   Linux 3.14-rc5 (2014-03-02 18:56:16 -0800)
> > > 
> > > are available in the git repository at:
> > > 
> > >   git://git.pengutronix.de/git/pza/linux.git topic/of-graph
> > > 
> > > for you to fetch changes up to d484700a36952c6675aa47dec4d7a536929aa922:
> > > 
> > >   of: Warn if of_graph_parse_endpoint is called with the root node (2014-03-06 17:41:54 +0100)
> > 
> > Nak. I made comments that haven't been resolved yet. I've replied with
> > more detail tonight. The big issues are how drivers handle the optional
> > 'ports' node and I do not agree to the double-linkage in the binding
> > description.
> 
> If I understood well, you're requesting to revert all those six patches
> that were imported via git pull from my tree (and from Greg and Russell),
> right?
> 
> E. g. reverting those changesets:
> 	d484700a3695 f2a575f67695 4329b93b283c 6ff60d397b17 4d56ed5a009b fd9fdb78a9bf
> 
> as it seems that there's no easy way to revert a git pull.

All trees containing the branch would need to be reverted.

> I suspect that this will likely cause some harm when merging from our
> trees upstream.

It means any tree containing that branch *must* be rewound. See my reply
to rmk. I've made a proposal on how I could be happy with leaving the
branches alone. I'm not particularly happy, but there is a way to
resolve things without reverts or rewinds.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
