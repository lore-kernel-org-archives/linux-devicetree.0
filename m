From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2
 mixers and display engines
Date: Fri, 24 Feb 2017 16:30:17 +0100
Message-ID: <1634001.dRmL8h9ofd@jernej-laptop>
References: <20170222152310.3719-5-icenowy@aosc.xyz> <20170222200947.3ikrhvv76ymfu5tv@lukather> <CAL_JsqKY1sXT9g9wHhQEt9-x32PaY0yQi8++bTajcEVk1x8E_w@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQNBWPU7YERBD5DYHCQKGQE2VXWABQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAL_JsqKY1sXT9g9wHhQEt9-x32PaY0yQi8++bTajcEVk1x8E_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Dne petek, 24. februar 2017 ob 14:30:36 CET je Rob Herring napisal(a):
> On Wed, Feb 22, 2017 at 2:09 PM, Maxime Ripard
> 
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> > 
> > On Wed, Feb 22, 2017 at 11:23:06PM +0800, Icenowy Zheng wrote:
> >> Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
> >> in a new "Display Engine" (mixers instead of old backends and
> >> frontends).
> >> 
> >> Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
> >> 
> >> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> ---
> 
> [...]
> 
> >> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >> b/drivers/gpu/drm/sun4i/sun8i_mixer.c new file mode 100644
> >> index 000000000000..9427b57240d3
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >> @@ -0,0 +1,417 @@
> >> +/*
> >> + * Copyright (C) 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> + *
> >> + * Based on sun4i_backend.c, which is:
> >> + *   Copyright (C) 2015 Free Electrons
> >> + *   Copyright (C) 2015 NextThing Co
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> >> + * modify it under the terms of the GNU General Public License as
> >> + * published by the Free Software Foundation; either version 2 of
> >> + * the License, or (at your option) any later version.
> >> + */
> >> +
> >> +#include <drm/drmP.h>
> >> +#include <drm/drm_atomic_helper.h>
> >> +#include <drm/drm_crtc.h>
> >> +#include <drm/drm_crtc_helper.h>
> >> +#include <drm/drm_fb_cma_helper.h>
> >> +#include <drm/drm_gem_cma_helper.h>
> >> +#include <drm/drm_plane_helper.h>
> >> +
> >> +#include <linux/component.h>
> >> +#include <linux/reset.h>
> >> +#include <linux/of_device.h>
> >> +
> >> +#include "sun8i_mixer.h"
> >> +#include "sun4i_drv.h"
> >> +
> >> +#define SUN8I_DRAM_OFFSET 0x40000000
> > 
> > PHYS_OFFSET?
> 
> PHYS_OFFSET is not portable. __pa(PAGE_OFFSET) instead.
> 
> If your DMA addresses are different from CPU addresses (i.e. have some
> offset), then use "dma-ranges" in DT.
> 
> Rob

That adjustment is not needed and should be removed. Such adjusment breaks DE 
on boards with 2 GiB of RAM.

Regards,
Jernej
