From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/3] Documentation: of: Document graph bindings
Date: Fri, 07 Mar 2014 18:11:32 +0000
Message-ID: <20140307181132.B2D71C40A88@trevor.secretlab.ca>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de>	 < 1393340304-19005-4-git-send-email-p.zabel@pengutronix.de>	 <530DE8A9. 9050809@ti.com> <1393426623.3248.70.camel@paszta.hi.pengutronix.de> < 530DFF4C.8080807@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530DFF4C.8080807-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Feb 2014 16:50:52 +0200, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> On 26/02/14 16:57, Philipp Zabel wrote:
> > Hi Tomi,
> > 
> > Am Mittwoch, den 26.02.2014, 15:14 +0200 schrieb Tomi Valkeinen:
> >> On 25/02/14 16:58, Philipp Zabel wrote:
> >>
> >>> +Optional endpoint properties
> >>> +----------------------------
> >>> +
> >>> +- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
> >>
> >> Why is that optional? What use is an endpoint, if it's not connected to
> >> something?
> > 
> > This allows to include the an empty endpoint template in a SoC dtsi for
> > the convenience of board dts writers. Also, the same property is
> > currently listed as optional in video-interfaces.txt.
> > 
> >   soc.dtsi:
> > 	display-controller {
> > 		port {
> > 			disp0: endpoint { };
> > 		};
> > 	};
> > 
> >   board.dts:
> > 	#include "soc.dtsi"
> > 	&disp0 {
> > 		remote-endpoint = <&panel_input>;
> > 	};
> > 	panel {
> > 		port {
> > 			panel_in: endpoint {
> > 				remote-endpoint = <&disp0>;
> > 			};
> > 		};
> > 	};
> > 
> > Any board not using that port can just leave the endpoint disconnected.
> 
> Hmm I see. I'm against that.
> 
> I think the SoC dtsi should not contain endpoint node, or even port node
> (at least usually). It doesn't know how many endpoints, if any, a
> particular board has. That part should be up to the board dts.

Why? We have established precedence for unused devices still being in
the tree. I really see no issue with it.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
