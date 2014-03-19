From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC PATCH 0/3] Parse OF graph and create backlinks internally
Date: Wed, 19 Mar 2014 16:12:01 +0100
Message-ID: <1395241924-9675-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

while I'm eagerly awaiting the outcome of the current situation regarding the
"Move device tree graph parsing helpers to drivers/of" series, here is a draft
implementation that parses the whole device tree into a separate graph
structure, creating the backlinks internally. This way it doesn't matter to
the code in which direction the phandle links in the device tree are pointing.
The current code assumes a static device tree and doesn't handle runtime
changes at all.

I've also added two helpers to iterate over all ports of a device, and to
obtain a specific port by its id (as contained in the 'reg' property).

These patches are based directly on top of the previous series, which still
can be found at:
	git://git.pengutronix.de/git/pza/linux.git topic/of-graph

Philipp Zabel (3):
  of: Parse OF graph into graph structure
  of: Add OF graph helper to get a specific port by id
  of: Add OF graph helpers to iterate over ports

 drivers/of/base.c        | 476 +++++++++++++++++++++++++++++++++++++++--------
 include/linux/of_graph.h |  31 +++
 2 files changed, 430 insertions(+), 77 deletions(-)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
