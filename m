From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri, 4 Dec 2015 15:42:47 -0500
Message-ID: <CAKb7UviPhoiY-YP2aBHm0BHbeEjSF2wTguQScVXMBve-kZc16Q@mail.gmail.com>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
	<1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
	<20151204162956.GA14978@rob-hp-laptop>
	<1449247305.8275.104.camel@pengutronix.de>
	<CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
	<1449251760.8275.116.camel@pengutronix.de>
	<CAL_Jsq+oaJxD3vbDWzn_4ghpqi=RZ1o+8nOcepWYjzcu5Hwpjg@mail.gmail.com>
	<20151204203101.GD8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151204203101.GD8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 4, 2015 at 3:31 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> Moreover, DRI3 is not yet available for Gallium, so if we're talking
> about Xorg, then functional DRI2 is a requirement, and that _needs_
> to have a single device for the rendering instances.  Xorg has no way
> to pass multiple render nodes to client over DRI2.

Just to correct... DRI3 has been available on gallium [at least in the
context of st/mesa] basically since DRI3 was introduced. Not sure what
issue you're fighting with, but it's definitely not a gallium
limitation... could be something related to platform devices.

It is also possible to use DRI_PRIME=<udev idpath> to select which
device to use. Not sure whether that has been available since the
beginning or not.

That said e.g. st/vdpau still doesn't deal with DRI3 which is a bit
annoying. And your other points all still stand (buffer sharing =
pain, tiling = not figured out, etc).

  -ilia
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
