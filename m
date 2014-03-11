From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/3] Documentation: of: Document graph bindings
Date: Tue, 11 Mar 2014 14:47:14 +0100
Message-ID: <531F13E2.3040603@samsung.com>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de>
 <1393340304-19005-4-git-send-email-p.zabel@pengutronix.de>
 <530DE8A9.9050809@ti.com> <1393426623.3248.70.camel@paszta.hi.pengutronix.de>
 <530DFF4C.8080807@ti.com> <20140307181132.B2D71C40A88@trevor.secretlab.ca>
 <531AE46A.2060808@ti.com> <20140308122532.1AED9C40612@trevor.secretlab.ca>
 <531D6178.3070906@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <531D6178.3070906-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/03/14 07:53, Tomi Valkeinen wrote:
> On 08/03/14 14:25, Grant Likely wrote:
> 
>> Sure. If endpoints are logical, then only create the ones actually
>> hooked up. No problem there. But nor do I see any issue with having
>> empty connections if the board author things it makes sense to have them
>> in the dtsi.
> 
> I don't think they are usually logical, although they probably might be
> in some cases.

The endpoint nodes are supposed to be logical, they just group properties
describing a port's configuration.

> As I see it, a "port" is a group of pins in a hardware component, and
> two endpoints define a connection between two ports, which on the HW
> level are the wires between the ports.
> 
> So a port with two endpoints is a group of pins, with wires that go from
> the same pins to two different components.

It could be approximated like this, but I don't think it is needed.
I would rather stay with only port nodes mapped to hardware and the
endpoint nodes logical.

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
