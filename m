From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Fri, 02 Oct 2015 09:40:28 +0200
Message-ID: <1443771628.3445.33.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
	 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
	 <1442823067.3277.35.camel@pengutronix.de>
	 <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
	 <1443689957.3272.18.camel@pengutronix.de>
	 <CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg@mail.gmail.com>
	 <CAGS+omAs4Jvu7tKEMoNL9BSMQMwW=9UHzXW8_jS=5MbajaJzOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omAs4Jvu7tKEMoNL9BSMQMwW=9UHzXW8_jS=5MbajaJzOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 01.10.2015, 22:29 +0800 schrieb Daniel Kurtz:
> On Thu, Oct 1, 2015 at 8:58 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > I was thinking one of the display related blocks like
> > whatever block provides the main crtc functions.
>
> The two "OVL" nodes correspond to the "crtc" functions of the two
> display pipes in this SoC, we would setup the display-subsystem node
> like this:
>
> display-subsystem {
>   compatible = "mediatek,display-subsystem";

Yes, the problem with the ovl nodes is that there are two equivalent
ones. Having two equivalent ipu nodes on i.MX6 was the reason to
introduce the display-subsystem node in the first place, but I'd very
much prefer to avoid it, if possible.

[...]
> And, any node that needs to poke around in the mmsys_config area, like
> an ovl, could access it using a phandle <&mmsys> to the common
> "mediatek,mt8173-mmsys" device, like this:
> 
> ovl0: ovl@1400c000 {
>        compatible = "mediatek,mt8173-ovl";
>        reg = <0 0x1400c000 0 0x1000>;
>        interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
>        clocks = <&mmsys CLK_MM_DISP_OVL0>;
>        iommus = <&iommu M4U_LARB0_ID M4U_PORT_DISP_OVL0>;
>        mediatek,mmsys = <&mmsys>;
>        status = "disabled";
> };

I think the ovl node has no business linking to mmsys_config.
It's the drm driver code that sets up the pipeline, including the crtc
-> encoder connections

> One idea to reduce the size of the of_graph would be to just model the
> entrance/exit points from the MM subsystem in dt.  So, instead of:
>   ovl0 -> color0 -> aal -> od -> ufoe -> dsi0 -> dsi-edp-bridge
>   ovl1 -> color1 -> gamma0 -> dpi0 -> hdmi
> 
> We can do something like this:
>   ovl0 -> dsi0 -> dsi-edp-bridge
>   ovl1 -> dpi0 -> hdmi
> 
> But ... this might be too limiting for some applications.

I'm already worried about having left out the DISP_PATH0 and DISP_PATH1
multiplexers from my DT graph example. There are so many ways to do this
slightly wrong and then having to live with the stable bindings, that
I'd rather not put an approximation of the real hardware into the device
tree.
Now that I've heard it is acceptable for one driver to look for its
components by their compatible value, I'm leaning towards not describing
the graph in the DT.

> So, I think we should just live with the big graph.
> I would, however, recommend that you move the graph to its own
> mt8173-display-graph.dtsi file which would be #included into a board
> specific .dts file.

Separating the graph out into its own include file would help to make
the main dtsi more readable, though.

> If you let the board .dts include the graph, then we can possibly
> shrink the resulting board specific device tree -
> At first we would make the full graph in one .dtsi as above
> "mt8173-display-graph.dtsi".
> This is the full reference graph that will always work.
>
> Then, if a particular board used a fixed configuration, the system
> integrator could create a smaller graph with just the graph nodes that
> they care about.
> 
> For example, if mt8173-evb only supports a single HDMI output, then
> perhaps you would just
> set up the endpoints for this single fixed function display pipe in
> mt8173-evb-display-graph.dtsi:
[...]

Especially for development boards I'd rather keep all possibilites.
Sure, if nothing is connected to the DSIs, disable them and drop thier
possible connections, but I'd still keep ovl0 for example, because it
could be connected to hdmi, even though the driver doesn't support it.
I realize this was probably just an example, so yes, I think this is a
valid method of reducing device tree size for a given board if
necessary.

regards
Philipp


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
