From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Fri, 02 Oct 2015 16:33:42 +0200
Message-ID: <1443796422.3445.102.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
	 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
	 <1442823067.3277.35.camel@pengutronix.de>
	 <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
	 <1443689957.3272.18.camel@pengutronix.de>
	 <CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg@mail.gmail.com>
	 <CAGS+omAs4Jvu7tKEMoNL9BSMQMwW=9UHzXW8_jS=5MbajaJzOg@mail.gmail.com>
	 <1443771628.3445.33.camel@pengutronix.de>
	 <CAGS+omC3M71q8XMRevnM-_aocZXryK7NFDnVnJCdiG6tM-PjUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omC3M71q8XMRevnM-_aocZXryK7NFDnVnJCdiG6tM-PjUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Freitag, den 02.10.2015, 21:47 +0800 schrieb Daniel Kurtz:
> On Fri, Oct 2, 2015 at 3:40 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Am Donnerstag, den 01.10.2015, 22:29 +0800 schrieb Daniel Kurtz:
> >> On Thu, Oct 1, 2015 at 8:58 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >> > I was thinking one of the display related blocks like
> >> > whatever block provides the main crtc functions.
> >>
> >> The two "OVL" nodes correspond to the "crtc" functions of the two
> >> display pipes in this SoC, we would setup the display-subsystem node
> >> like this:
> >>
> >> display-subsystem {
> >>   compatible = "mediatek,display-subsystem";
> >
> > Yes, the problem with the ovl nodes is that there are two equivalent
> > ones. Having two equivalent ipu nodes on i.MX6 was the reason to
> > introduce the display-subsystem node in the first place, but I'd very
> > much prefer to avoid it, if possible.
> 
> Oh, interesting. How is it a problem that there are two equivalent ovl nodes?

Which one of the two should create the drm device?

> Why do you prefer to avoid the display-subsystem node?

Because then we don't have to argue about what it should look like ;)

Mostly because nodes like this don't describe an actual hardware
devices, but rather how the hardware designers intended other, actually
existing hardware devices to work together (in the best case), or just
how the Linux driver developers wanted to use the components together
(in the worst case).

If the display-subsystem node is necessary or useful, I won't argue
against it. If we can do without, I'll be happier.

> BTW, what I really meant was for my example was that the
> 'display-subsystem' 'ports' node lists phandles representing the
> 'root' nodes for the for the display-subsystem graph.
> This matches what we did for rk3288.dtsi:
>
> display-subsystem {
>   compatible = "mediatek,display-subsystem";
>   ports = <&ovl0_out>, <&ovl1_out>;
> };

Oh, ok then. I'm worried again that we would be describing what the
driver should load, not what the hardware looks like. Note that the
ovl_out ports have no significance outside of the display subsystem. In
the RK3288 and i.MX6 cases, the 'external' ports of the display core are
listed, to which the encoders are connected. On MT8173 this would
correspond to:

display-subsystem {
    compatible = "mediatek,display-subsystem";
    ports = <&dsi0_out>, <&dsi1_out>, <&dpi0_out>;
};

[...]
> > I think the ovl node has no business linking to mmsys_config.
> > It's the drm driver code that sets up the pipeline, including the crtc
> > -> encoder connections
> 
> My original thinking is that the "ovl" node should link to the
> mmsys_config since the mmsys_config has the ovl output select
> registers.

I see. If each function block takes care of the attached SEL input
selectors and SOUT/MOUT output selectors, wouldn't all of them have to
link to the mmsys_config node, then?
That's certainly a possibility, but in this case I feel like having a
single, central instance to handle building the paths and arbitrating
register access with help of the disp_mutex would be easier to
understand.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
