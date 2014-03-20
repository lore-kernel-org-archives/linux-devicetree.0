From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH 0/3] Parse OF graph and create backlinks internally
Date: Thu, 20 Mar 2014 22:09:14 +0000
Message-ID: <20140320220914.EDAD7C412EA@trevor.secretlab.ca>
References: <1395241924-9675-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395241924-9675-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, kernel@pengutronix.de
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Mar 2014 16:12:01 +0100, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Hi,
> 
> while I'm eagerly awaiting the outcome of the current situation regarding the
> "Move device tree graph parsing helpers to drivers/of" series, here is a draft
> implementation that parses the whole device tree into a separate graph
> structure, creating the backlinks internally. This way it doesn't matter to
> the code in which direction the phandle links in the device tree are pointing.
> The current code assumes a static device tree and doesn't handle runtime
> changes at all.

Hi Philipp,

Nak on this approach. I still think each node has to be explicitly
processed by a driver that understands its parents compatible property.
Scanning the whole tree, hoping that it finds nodes that look like the
graph binding makes too many assumptions about what it will find in the
tree.

I think your other patch that has each driver register its own endpoints
is a better solution, and I think it is better suited for handling
runtime changes.

g.

> 
> I've also added two helpers to iterate over all ports of a device, and to
> obtain a specific port by its id (as contained in the 'reg' property).
> 
> These patches are based directly on top of the previous series, which still
> can be found at:
> 	git://git.pengutronix.de/git/pza/linux.git topic/of-graph
> 
> Philipp Zabel (3):
>   of: Parse OF graph into graph structure
>   of: Add OF graph helper to get a specific port by id
>   of: Add OF graph helpers to iterate over ports
> 
>  drivers/of/base.c        | 476 +++++++++++++++++++++++++++++++++++++++--------
>  include/linux/of_graph.h |  31 +++
>  2 files changed, 430 insertions(+), 77 deletions(-)
> 
> -- 
> 1.9.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
