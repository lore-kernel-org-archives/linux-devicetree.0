From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri, 4 Dec 2015 17:54:03 +0000
Message-ID: <20151204175403.GC8644@n2100.arm.linux.org.uk>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
 <1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
 <20151204162956.GA14978@rob-hp-laptop>
 <1449247305.8275.104.camel@pengutronix.de>
 <CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 11:33:22AM -0600, Rob Herring wrote:
> On Fri, Dec 4, 2015 at 10:41 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > I'm aware of that, but I don't see much value in kicking this discussion
> > around for every DRM driver submission. This is the binding that has
> > emerged from a lengthy discussion at KS 2013 in Edinburgh and at least
> > allows us to standardize on _something_. Also ALSA does a similar thing
> > to bind codecs and CPU interfaces together.
> 
> This case is quite different though I think. The ALSA case and other
> DRM cases are ones that have inter-dependencies between the blocks
> (e.g. some sort of h/w connection). What is the inter-dependency here?

Different GPU cores, where each GPU core is a separate device.  On iMX6,
we have three different GPU cores, two of which need to do cross-GPU
synchronisation for accesses to the buffers.

Sure, we could have decided to publish three entirely different DRM
devices, but that has serious implications: we would be highly non-
standard on the DRI and XF86 cases, to the point where it'd probably
be beyond any hope in getting it to work sanely.  DRI2 requires the
DRM device to be used by MESA to be passed across the X protocol to
authorise the MESA side.

It's already icky enough with the separate DRM device for KMS - which
having poked about with DRI3, I can't see really working at the moment.

> > Same as above really. Parts of the identification registers are
> > different for each SoC integration, even if it's the same IP core, so we
> > can just derive any needed driver behavior differences from that.
> 
> The h/w designers must have had a clue about s/w. First time for
> everything... ;)
> 
> Ok, please just add a note to the binding why a more specific
> compatible is not needed in this case.

If we did want to be safe, we _could_ require something like:

	compatible = "vivante,gc320", "vivante,gc";

but I don't see much value to that, because, from what I can see if the
way the GPU numbering/versioning scheme works, the revision number is
the more important bit of information: I believe this started at 1 which
has been incremented ever since.

This can be seen as the GC600 is a much older core than the GC320.

The GC numbering tells you nothing (as far as can be worked out yet)
about what features, what kind of GPU, or anything like that.

Another example: the iMX6 S/DL has a GC880 instead of a GC2000.  While
both are a 3D GPU, they're not really "compatible" with each other -
GC880 has one pixel pipe which requires userspace buffers to be tiled
one way, vs GC2000 which has a different form of tiling to allow two
pixel pipes to operate efficiently.

The number of pixel pipes (and other features) comes from the feature/
specification registers embedded in the device - there's currently 6
32-bit registers, each containing 32 feature flags, describing what
features are present, and including what bugs are present and/or have
been fixed.

There have been one "slip-up" along the way, where the Vivante software
folk have comments in the code along the lines of "Hardware people should
talk to us!!!" which tends to suggest that they've hit the communication
problem, and as it's for very early stuff, and nothing later, it suggests
that they've learnt that lesson themselves already. :)

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
