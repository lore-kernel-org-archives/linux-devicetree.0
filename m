From: Jon Nettleton <jon.nettleton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri, 4 Dec 2015 19:02:17 +0100
Message-ID: <CALHpu36m_dfYZrQRvhFYW7-s6nXs_xGr2dz3YvSPr7JYiPEYXA@mail.gmail.com>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
	<1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
	<20151204162956.GA14978@rob-hp-laptop>
	<1449247305.8275.104.camel@pengutronix.de>
	<CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
	<1449251760.8275.116.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449251760.8275.116.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 4, 2015 at 6:56 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Freitag, den 04.12.2015, 11:33 -0600 schrieb Rob Herring:
>> On Fri, Dec 4, 2015 at 10:41 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> > Am Freitag, den 04.12.2015, 10:29 -0600 schrieb Rob Herring:
>> >> On Fri, Dec 04, 2015 at 02:59:54PM +0100, Lucas Stach wrote:
>> >> > Etnaviv follows the same priciple as imx-drm to have a virtual
>> >> > master device node to bind all the individual GPU cores together
>> >> > into one DRM device.
>> >> >
>> >> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> >> > ---
>> >> >  .../bindings/display/etnaviv/etnaviv-drm.txt       | 46 ++++++++++++++++++++++
>> >> >  1 file changed, 46 insertions(+)
>> >> >  create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>> >> >
>> >> > diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>> >> > new file mode 100644
>> >> > index 000000000000..19fde29dc1d7
>> >> > --- /dev/null
>> >> > +++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>> >> > @@ -0,0 +1,46 @@
>> >> > +Etnaviv DRM master device
>> >> > +================================
>> >> > +
>> >> > +The Etnaviv DRM master device is a virtual device needed to list all
>> >> > +Vivante GPU cores that comprise the GPU subsystem.
>> >> > +
>> >> > +Required properties:
>> >> > +- compatible: Should be one of
>> >> > +    "fsl,imx-gpu-subsystem"
>> >> > +    "marvell,dove-gpu-subsystem"
>> >> > +- cores: Should contain a list of phandles pointing to Vivante GPU devices
>> >> > +
>> >> > +example:
>> >> > +
>> >> > +gpu-subsystem {
>> >> > +   compatible = "fsl,imx-gpu-subsystem";
>> >> > +   cores = <&gpu_2d>, <&gpu_3d>;
>> >> > +};
>> >>
>> >> Yeah, I'm not really a fan of doing this simply because DRM wants 1
>> >> driver.
>> >>
>> > I'm aware of that, but I don't see much value in kicking this discussion
>> > around for every DRM driver submission. This is the binding that has
>> > emerged from a lengthy discussion at KS 2013 in Edinburgh and at least
>> > allows us to standardize on _something_. Also ALSA does a similar thing
>> > to bind codecs and CPU interfaces together.
>>
>> This case is quite different though I think. The ALSA case and other
>> DRM cases are ones that have inter-dependencies between the blocks
>> (e.g. some sort of h/w connection). What is the inter-dependency here?
>>
>> Doing this way has also been found to be completely unnecessary and
>> removed in recent DRM driver reviews. Admittedly, those are cases
>> where one device can be the master of the others. For 2 parallel
>> devices, I don't have an alternative other than question why they need
>> to be a single driver.
>>
> If you insist on doing things differently for this driver, we could add
> a pass at driver registration that scans through the DT, looking for
> nodes matching the GPU core compatible.
>
> I'm not sure if that makes things cleaner though and might bite us later
> on. Also I'm not sure if moving away from the binding scheme already
> established for other DRM drivers makes things better from a DT
> perspective. Personally I would prefer DT binding consistency over
> perfection for single drivers, segmenting the DT binding space.
>

We should also keep in mind that Vivante is working on newer chipsets
that also include multiple independent 3d cores.  I am not even sure
how userspace would deal with this using the suggested changes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
