From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri, 4 Dec 2015 22:05:33 +0000
Message-ID: <20151204220533.GE8644@n2100.arm.linux.org.uk>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
 <1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
 <20151204162956.GA14978@rob-hp-laptop>
 <1449247305.8275.104.camel@pengutronix.de>
 <CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
 <1449251760.8275.116.camel@pengutronix.de>
 <CAL_Jsq+oaJxD3vbDWzn_4ghpqi=RZ1o+8nOcepWYjzcu5Hwpjg@mail.gmail.com>
 <20151204203101.GD8644@n2100.arm.linux.org.uk>
 <CAKb7UviPhoiY-YP2aBHm0BHbeEjSF2wTguQScVXMBve-kZc16Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UviPhoiY-YP2aBHm0BHbeEjSF2wTguQScVXMBve-kZc16Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 03:42:47PM -0500, Ilia Mirkin wrote:
> On Fri, Dec 4, 2015 at 3:31 PM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > Moreover, DRI3 is not yet available for Gallium, so if we're talking
> > about Xorg, then functional DRI2 is a requirement, and that _needs_
> > to have a single device for the rendering instances.  Xorg has no way
> > to pass multiple render nodes to client over DRI2.
> 
> Just to correct... DRI3 has been available on gallium [at least in the
> context of st/mesa] basically since DRI3 was introduced. Not sure what
> issue you're fighting with, but it's definitely not a gallium
> limitation... could be something related to platform devices.

Well, my statement is based on the fact that there's nothing in
src/gallium/state-tracker/dri which hints at being DRI3.  Maybe it's
implemented differently, I don't know.  I never wanted to hack MESA -
I'm supposed to be the ARM kernel maintainer - and I'm still very new
to MESA.

I think it's a DRI3 limitation.  The issue with the DRI3 design is that:

* The client has access to the GPU render nodes only, but not the
  corresponding KMS node.
* Buffers in DRI3 are allocated from the GPU render nodes.
* The Xorg Present protocol is then used to manage the vblank
  synchonisation and page flips.

Now, the KMS scanout hardware typically does not support any kind of
scatter-gather: the buffers it has must be contiguous.  These can be
allocated from the KMS DRM device.

However, the DRI3 client has no access to the KMS DRM device to allocate
linear buffers from, and GPUs typically don't have dumb buffer support.
Hence, the client can't pass a suitable buffer to the present layer.

Hence, I can see no way for the resource_create() to be able to allocate
any kind of scanout capable buffer.

That's a separate issue though: you've pointed out that you can select
which render node to use: what if we want to use multiple render nodes
simultaneously - eg, because we want to use multiple 3D GPU cores
together?  How does that work with stuff?

I think the idea that individual GPU cores should be exposed as
separate DRM devices is fundamentally flawed, and adds a hell of a
lot of complexity.

In any case, I've spent _way_ too much time on etnaviv during November -
quite literally almost every day (I worked out that I was producing 4.5
patches a day during November for Etnaviv MESA.)  I'm afraid that it's
now time that I switch my attention elsewhere, so if this means that
Etnaviv is rejected for merging, I'm afraid it'll be a few months before
I can get back to it.

It would have been nice if these issues had been brought up much earlier,
during the RFC posting of the patches.  These are nothing new, and I now
feel that this whole thing has been a total waste of time.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
