From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri, 4 Dec 2015 21:43:10 +0100
Message-ID: <20151204204310.GO10243@phenom.ffwll.local>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
 <1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
 <20151204162956.GA14978@rob-hp-laptop>
 <1449247305.8275.104.camel@pengutronix.de>
 <CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
 <1449251760.8275.116.camel@pengutronix.de>
 <CAL_Jsq+oaJxD3vbDWzn_4ghpqi=RZ1o+8nOcepWYjzcu5Hwpjg@mail.gmail.com>
 <20151204203101.GD8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151204203101.GD8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 08:31:01PM +0000, Russell King - ARM Linux wrote:
> On Fri, Dec 04, 2015 at 02:19:42PM -0600, Rob Herring wrote:
> > On Fri, Dec 4, 2015 at 11:56 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > Am Freitag, den 04.12.2015, 11:33 -0600 schrieb Rob Herring:
> > >> On Fri, Dec 4, 2015 at 10:41 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > >> > Am Freitag, den 04.12.2015, 10:29 -0600 schrieb Rob Herring:
> > >> >> On Fri, Dec 04, 2015 at 02:59:54PM +0100, Lucas Stach wrote:
> > >> >> > Etnaviv follows the same priciple as imx-drm to have a virtual
> > >> >> > master device node to bind all the individual GPU cores together
> > >> >> > into one DRM device.
> > >> >> >
> > >> >> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > >> >> > ---
> > >> >> >  .../bindings/display/etnaviv/etnaviv-drm.txt       | 46 ++++++++++++++++++++++
> > >> >> >  1 file changed, 46 insertions(+)
> > >> >> >  create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> > >> >> >
> > >> >> > diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> > >> >> > new file mode 100644
> > >> >> > index 000000000000..19fde29dc1d7
> > >> >> > --- /dev/null
> > >> >> > +++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
> > >> >> > @@ -0,0 +1,46 @@
> > >> >> > +Etnaviv DRM master device
> > >> >> > +================================
> > >> >> > +
> > >> >> > +The Etnaviv DRM master device is a virtual device needed to list all
> > >> >> > +Vivante GPU cores that comprise the GPU subsystem.
> > >> >> > +
> > >> >> > +Required properties:
> > >> >> > +- compatible: Should be one of
> > >> >> > +    "fsl,imx-gpu-subsystem"
> > >> >> > +    "marvell,dove-gpu-subsystem"
> > >> >> > +- cores: Should contain a list of phandles pointing to Vivante GPU devices
> > >> >> > +
> > >> >> > +example:
> > >> >> > +
> > >> >> > +gpu-subsystem {
> > >> >> > +   compatible = "fsl,imx-gpu-subsystem";
> > >> >> > +   cores = <&gpu_2d>, <&gpu_3d>;
> > >> >> > +};
> > >> >>
> > >> >> Yeah, I'm not really a fan of doing this simply because DRM wants 1
> > >> >> driver.
> > >> >>
> > >> > I'm aware of that, but I don't see much value in kicking this discussion
> > >> > around for every DRM driver submission. This is the binding that has
> > >> > emerged from a lengthy discussion at KS 2013 in Edinburgh and at least
> > >> > allows us to standardize on _something_. Also ALSA does a similar thing
> > >> > to bind codecs and CPU interfaces together.
> > >>
> > >> This case is quite different though I think. The ALSA case and other
> > >> DRM cases are ones that have inter-dependencies between the blocks
> > >> (e.g. some sort of h/w connection). What is the inter-dependency here?
> > >>
> > >> Doing this way has also been found to be completely unnecessary and
> > >> removed in recent DRM driver reviews. Admittedly, those are cases
> > >> where one device can be the master of the others. For 2 parallel
> > >> devices, I don't have an alternative other than question why they need
> > >> to be a single driver.
> > >>
> > > If you insist on doing things differently for this driver, we could add
> > > a pass at driver registration that scans through the DT, looking for
> > > nodes matching the GPU core compatible.
> > 
> > I've not insisted on anything. I'm only asking a question which didn't
> > get answered. I'll ask another way. Why can't you have 2 instances of
> > the same driver given they are only rendering nodes?
> 
> Sorry, but it _did_ get answered - I answered that in my reply to you.
> I'll repeat it again, but more briefly, and then expand on it: it's what
> userspace like Xorg DRI2 and MESA want.
> 
> Yes, there's DRI3, which is more modern and in theory allows multiple
> renderers to be opened by the client, but so far I fail to see how that
> can work with a separate KMS DRM driver.  It _may_ be intended to, but
> the problem I see here is that when you have the KMS hardware only
> capable of scanning out linear buffers, but the GPU hardware is only
> capable of rendering to tiled buffers, there needs to be some way to
> allocate KMS buffers in the client, and right now I don't see any way
> to know what the KMS DRM device being used is in the DRI3/Present Xorg
> extensions.
> 
> Moreover, DRI3 is not yet available for Gallium, so if we're talking
> about Xorg, then functional DRI2 is a requirement, and that _needs_
> to have a single device for the rendering instances.  Xorg has no way
> to pass multiple render nodes to client over DRI2.

The only thing that DRI2 needs is that both client and X use the same
device. But you can just dma-buf share stuff in the client (e.g. we had
some code at intel to decode videos in libva with some code chip, then
dma-buf share to i915.ko for post-proc, then dri2 flink to the X server).
Same on the X server, you're X driver could dma-buf share stuff between
the 3d core, 2d core and whatever kms driver is used for display and throw
a good party with all of them ;-) Of course for that sharing you need to
open everything as rendernodes, except for the one driver you use for
dri2, that needs to run in master mode in X to be able to open flink
names.

So drm doesn't want a single driver at all, it's purely a question of what
makes sense wrt code organisation and reusing of drivers (for same or
similar IP blocks) across different products. Personally I'm leaning
towards smashing related things together since then you can have some good
tailor-made infrastructure (like e.g. all the big drivers have with their
sometimes massive internal abstraction).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
