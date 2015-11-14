From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: update DT binding doc locations
Date: Sat, 14 Nov 2015 19:17:54 +0100
Message-ID: <CA+M3ks44jf0gHjrK3qThNoiM+KfC+0Od5LnjZoM3o5ttYNArQA@mail.gmail.com>
References: <1446752475-2708-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446752475-2708-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-11-05 20:41 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> After the recent moving of DT binding documents, some maintainers entries
> are stale. Update them to the new locations.
>
> In bindings/fb/, there were only 2 files and I'm assuming the FB
> maintainers don't want to be copied on all of bindings/display/. So I've
> dropped them.
>
> Reported-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  MAINTAINERS | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f6685f..e2aa973 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3577,7 +3577,7 @@ S:        Maintained
>  F:     drivers/gpu/drm/drm_panel.c
>  F:     drivers/gpu/drm/panel/
>  F:     include/drm/drm_panel.h
> -F:     Documentation/devicetree/bindings/panel/
> +F:     Documentation/devicetree/bindings/display/panel/
>
>  INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
>  M:     Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> @@ -3609,15 +3609,15 @@ M:      Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>  L:     dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  S:     Supported
>  F:     drivers/gpu/drm/fsl-dcu/
> -F:     Documentation/devicetree/bindings/video/fsl,dcu.txt
> -F:     Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> +F:     Documentation/devicetree/bindings/display/fsl,dcu.txt
> +F:     Documentation/devicetree/bindings/display/panel/nec,nl4827hc19_05b.txt
>
>  DRM DRIVERS FOR FREESCALE IMX
>  M:     Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>  L:     dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  S:     Maintained
>  F:     drivers/gpu/drm/imx/
> -F:     Documentation/devicetree/bindings/drm/imx/
> +F:     Documentation/devicetree/bindings/display/imx/
>
>  DRM DRIVERS FOR NVIDIA TEGRA
>  M:     Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -3630,7 +3630,7 @@ F:        drivers/gpu/drm/tegra/
>  F:     drivers/gpu/host1x/
>  F:     include/linux/host1x.h
>  F:     include/uapi/drm/tegra_drm.h
> -F:     Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> +F:     Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>
>  DRM DRIVERS FOR RENESAS
>  M:     Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> @@ -3647,7 +3647,7 @@ M:        Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>  L:     dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  S:     Maintained
>  F:     drivers/gpu/drm/rockchip/
> -F:     Documentation/devicetree/bindings/video/rockchip*
> +F:     Documentation/devicetree/bindings/display/rockchip*
>
>  DRM DRIVERS FOR STI
>  M:     Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> @@ -3656,7 +3656,7 @@ L:        dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  T:     git http://git.linaro.org/people/benjamin.gaignard/kernel.git
>  S:     Maintained
>  F:     drivers/gpu/drm/sti
> -F:     Documentation/devicetree/bindings/gpu/st,stih4xx.txt
> +F:     Documentation/devicetree/bindings/display/st,stih4xx.txt
>
>  DSBR100 USB FM RADIO DRIVER
>  M:     Alexey Klimov <klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -4342,7 +4342,6 @@ Q:        http://patchwork.kernel.org/project/linux-fbdev/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/plagnioj/linux-fbdev.git
>  S:     Maintained
>  F:     Documentation/fb/
> -F:     Documentation/devicetree/bindings/fb/
>  F:     drivers/video/
>  F:     include/video/
>  F:     include/linux/fb.h
> @@ -6855,6 +6854,7 @@ S:        Supported
>  F:     arch/metag/
>  F:     Documentation/metag/
>  F:     Documentation/devicetree/bindings/metag/
> +F:     Documentation/devicetree/bindings/interrupt-controller/img,*
>  F:     drivers/clocksource/metag_generic.c
>  F:     drivers/irqchip/irq-metag.c
>  F:     drivers/irqchip/irq-metag-ext.c
> @@ -9443,7 +9443,7 @@ SIMPLEFB FB DRIVER
>  M:     Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  L:     linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/video/simple-framebuffer.txt
> +F:     Documentation/devicetree/bindings/display/simple-framebuffer.txt
>  F:     drivers/video/fbdev/simplefb.c
>  F:     include/linux/platform_data/simplefb.h
>
> @@ -10072,6 +10072,7 @@ M:      Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>  S:     Supported
>  F:     arch/arc/
>  F:     Documentation/devicetree/bindings/arc/*
> +F:     Documentation/devicetree/bindings/interrupt-controller/snps,arc*
>  F:     drivers/tty/serial/arc_uart.c
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
>
> --
> 2.5.0
>

Acked-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
