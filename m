From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Fri, 26 Aug 2016 07:36:18 -0500
Message-ID: <CAL_Jsq+1MeicZmr+7Q4K6FLnTfD4jBBAQR1KPHMSLfNNUe4ENw@mail.gmail.com>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160826000056.12806-1-dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 25, 2016 at 7:00 PM, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Provide a generic DRM helper that evicts all conflicting firmware
> framebuffers, devices, and drivers. The new helper is called
> drm_evict_firmware(), and takes a flagset controlling which firmware to
> kick out.
>
> This is meant to be used by drivers in their ->probe() callbacks of their
> parent bus, before calling into drm_dev_register().
>
> Signed-off-by: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Hey
>
> This is just compile-tested for now. I just want to get some comments on the
> design. I decided to drop the sysfb infrastructure and rather just use this
> generic helper. It keeps things simple and should work just fine for all
> reasonable use-cases.
>
> This will work with SimpleDRM out-of-the-box on x86.
>
> Architectures with dynamic simple-framebuffer devices are not supported yet. I
> actually have no idea what the strategy there is? Can the DeviceTree people come
> up with something? Am I supposed to call of_platform_depopulate()?

If of_platform_populate was used to create the device, then yes call
of_platform_depopulate. In this case, I think it wasn't. If
of_platform_device_create was used, then platform_device_del.

> Or
> of_detach_node()? Or what?

No. Only the struct device and its resources should need to be
destroyed. The node should remain.

> Looking at drivers/of/{platform,dynamic}.c, I cannot see how this is supposed to
> work at all. Who protects platform_device_del() from being called in parallel?

Not sure. In parallel to what? On most systems, nodes never go away
and on those that do it is only a few things that get hotplugged.
That's changing with DT overlays now, so there certainly could be some
issues.

> Also: Does any platform make use the of 'display:' entry in 'simple-framebuffer'
> DT nodes? If yes, how do I get access to it? And why don't vc4/sun4i make use of
> it, rather than falling back to remove_conflicting_framebuffers()?

No idea.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
