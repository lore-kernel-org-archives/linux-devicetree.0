From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/etnaviv: remove the need for a gpu-subsystem
 DT node
Date: Thu, 25 Jan 2018 10:43:36 +0100
Message-ID: <1516873416.6411.21.camel@pengutronix.de>
References: <20180124153711.22049-1-l.stach@pengutronix.de>
         <20180124153711.22049-2-l.stach@pengutronix.de>
         <CAL_JsqJYfX3ngPns4TcTbaCWQwwZQHq=VtvZ3KTpBNyVVMH-mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJYfX3ngPns4TcTbaCWQwwZQHq=VtvZ3KTpBNyVVMH-mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 24.01.2018, 14:49 -0600 schrieb Rob Herring:
> On Wed, Jan 24, 2018 at 9:37 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> wrote:
> > The module autoloading can be triggered through the GPU core nodes
> > and the necessary platform device for the DRM toplevel device will
> > be instantiated on module init.
> > 
> > Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  .../bindings/display/etnaviv/etnaviv-drm.txt       | 20 ----------
> > --
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c              | 36
> > ++++++++++++----------
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  1 +
> >  3 files changed, 20 insertions(+), 37 deletions(-)
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Are you going to update dts files to remove the node?

Sure. I'll send DT update patches for this once this patch has landed
in my etnaviv/next tree.

Regards,
Lucas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
