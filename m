From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 4/8] of: Reduce indentation in
 of_graph_get_next_endpoint
Date: Tue, 11 Mar 2014 12:06:30 +0100
Message-ID: <1394535990.3772.2.camel@paszta.hi.pengutronix.de>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de>
	 <31687163.hgTkcLrn0Z@avalon>
	 <1394214054.16309.45.camel@paszta.hi.pengutronix.de>
	 <1688746.6CaQoSDOni@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1688746.6CaQoSDOni@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Grant Likely <grant.likely@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Am Montag, den 10.03.2014, 20:19 +0100 schrieb Laurent Pinchart:
> On Friday 07 March 2014 18:40:54 Philipp Zabel wrote:
> > While we look at of_graph_get_next_endpoint(), could you explain the
> > reason behind the extra reference count increase on the prev node:
> >
> > 	/*
> > 	 * Avoid dropping prev node refcount to 0 when getting the next
> > 	 * child below.
> > 	 */
> > 	of_node_get(prev);
> >
> > This unfortunately makes using the function in for_each style macros a
> > hassle. If that part wasn't there and all users that want to keep using
> > prev after the call were expected to increase refcount themselves,
> > we could have a
> >
> > #define of_graph_for_each_endpoint(parent, endpoint) \
> > 	for (endpoint = of_graph_get_next_endpoint(parent, NULL); \
> > 	     endpoint != NULL; \
> > 	     endpoint = of_graph_get_next_endpoint(parent, endpoint))
> 
> I don't know what the exact design decision was (Sylwester might know), but I 
> suspect it's mostly about historical reasons. I see no reason that would 
> prevent modifying the current behaviour to make a for-each loop easier to 
> implement.

Thanks, I'll include a patch to change this in the next round, then.

regards
Philipp
