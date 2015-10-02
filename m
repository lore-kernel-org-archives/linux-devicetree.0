From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Fri, 02 Oct 2015 09:18:39 +0200
Message-ID: <1443770319.3445.20.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
	 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
	 <1442823067.3277.35.camel@pengutronix.de>
	 <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
	 <1443689957.3272.18.camel@pengutronix.de>
	 <CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 01.10.2015, 07:58 -0500 schrieb Rob Herring:
> On Thu, Oct 1, 2015 at 3:59 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Am Mittwoch, den 30.09.2015, 12:13 -0500 schrieb Rob Herring:
> >> On Mon, Sep 21, 2015 at 3:11 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> >> > Note how the display-subsystem node overlaps the larb node. Is that
> >> > acceptable?
> >>
> >> Given what the graph looks like, perhaps. However, do you really need
> >> a container node? It only serves to provide a list of nodes (e.g. all
> >> the children) to include as components. There are other ways to
> >> determine this list. You could find all nodes just searching
> >> compatible strings for each component. You just need to bind the drm
> >> driver to some other DT node. Is there no node you can pick as the
> >> master component?
> >
> > There is the mmsys clock-controller node at the top of the MMSYS address
> > space (0x14000000-0x14ffffff):
> >
> >         mmsys: clock-controller@14000000 {
> >                 compatible = "mediatek,mt8173-mmsys", "syscon";
> >                 reg = <0 0x14000000 0 0x1000>;
> >                 #clock-cells = <1>;
> >         };
> >
> > Its register space also contains the MMSYS_CONFIG region that controls
> > the multiplexers between the display function blocks, so that would be a
> > good candidate.
> > No driver binds to this node yet, the clocks are registered with
> > CLK_OF_DECLARE.
> >
> > I'll try to bind to this node and have the driver find sibling nodes
> > using their compatible strings.
> 
> That doesn't seem like a good choice since there are other functions
> in the block. I was thinking one of the display related blocks like
> whatever block provides the main crtc functions.

Why exactly isn't this a good choice? Since all display function blocks
are spread throughout the MMSYS address space, using the mmsys driver to
create the DRM/component master platform driver that collects its
subdevices sounded logical.

Another candidate would be the mutex node, which can synchronize the
configuration updates to the function blocks in the MMSYS region to
frame borders.

The hardware blocks that most closely correspond to crtc functionality
are the two OVL blocks, as Daniel points out. They provide DMA and plane
composition. But they are equivalent, and there is no single central
node, same as with the two IPUs on i.MX6.
Also, I'd like to keep the possibility of not tying OVL blocks to crtc
functionality too closely, because there are three more separate RDMA
units, at least one of which could be used to implement a third pipe in
the future.

Either way, if we go this path (one driver scanning DT for known
component driver compatible values), whichever node the master driver
binds to is a Linux implementation detail, and it should be completely
hidden from the device tree and binding specs.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
