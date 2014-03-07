From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4 3/3] Documentation: of: Document graph bindings
Date: Sat, 08 Mar 2014 01:20:57 +0800
Message-ID: <20140307172057.34F02C40A64@trevor.secretlab.ca>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de> < 1393340304-19005-4-git-send-email-p.zabel@pengutronix.de> <530DE8A9.9050809 @ti.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <530DE8A9.9050809@ti.com>
Sender: linux-media-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Feb 2014 15:14:17 +0200, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 25/02/14 16:58, Philipp Zabel wrote:
> 
> > +Optional endpoint properties
> > +----------------------------
> > +
> > +- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
> 
> Why is that optional? What use is an endpoint, if it's not connected to
> something?
> 
> Also, if this is being worked on, I'd like to propose the addition of
> simpler single-endpoint cases which I've been using with OMAP DSS. So if
> there's just a single endpoint for the device, which is very common, you
> can have just:
> 
> device {
> 	...
> 	endpoint { ... };
> };
> 
> However, I guess that the patch just keeps growing and growing, so maybe
> it's better to add such things later =).

It's good to talk about it now while boiling down the core behaviour
into a useful pattern. That said, I think if the stuff I've commented on
already is addressed then it will probably be sufficient for me to ack
or merge the change.

g.
