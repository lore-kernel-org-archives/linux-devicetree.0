From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 00/11] drm: Add Allwinner A10 display engine support
Date: Mon, 25 Apr 2016 16:56:27 +0100
Message-ID: <CACvgo50CDGL1jdP4kkbnNtnLGrgSa-b74RJu6NnPuq1=Q9Zsmg@mail.gmail.com>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461590572-4027-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On 25 April 2016 at 14:22, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

>  Documentation/devicetree/bindings/clock/sunxi.txt  |   2 +
>  .../bindings/display/sunxi/sun4i-drm.txt           | 258 ++++++++
>  arch/arm/boot/dts/sun5i-a13.dtsi                   |  39 +-
>  arch/arm/boot/dts/sun5i-r8-chip.dts                |  12 +
>  arch/arm/boot/dts/sun5i-r8.dtsi                    | 142 ++++-
>  drivers/clk/sunxi/Makefile                         |   1 +
>  drivers/clk/sunxi/clk-sun4i-display.c              | 261 ++++++++
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   3 +-
>  drivers/gpu/drm/sun4i/Kconfig                      |  14 +
>  drivers/gpu/drm/sun4i/Makefile                     |  13 +
>  drivers/gpu/drm/sun4i/sun4i_backend.c              | 364 +++++++++++
>  drivers/gpu/drm/sun4i/sun4i_backend.h              | 165 +++++
>  drivers/gpu/drm/sun4i/sun4i_crtc.c                 | 120 ++++
>  drivers/gpu/drm/sun4i/sun4i_crtc.h                 |  30 +
>  drivers/gpu/drm/sun4i/sun4i_dotclock.c             | 160 +++++
>  drivers/gpu/drm/sun4i/sun4i_dotclock.h             |  21 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c                  | 357 +++++++++++
>  drivers/gpu/drm/sun4i/sun4i_drv.h                  |  30 +
>  drivers/gpu/drm/sun4i/sun4i_framebuffer.c          |  54 ++
>  drivers/gpu/drm/sun4i/sun4i_framebuffer.h          |  19 +
>  drivers/gpu/drm/sun4i/sun4i_layer.c                | 161 +++++
>  drivers/gpu/drm/sun4i/sun4i_layer.h                |  30 +
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 250 ++++++++
>  drivers/gpu/drm/sun4i/sun4i_rgb.h                  |  18 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 | 561 ++++++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h                 | 186 ++++++
>  drivers/gpu/drm/sun4i/sun4i_tv.c                   | 708 +++++++++++++++++++++
>  include/drm/drm_fb_cma_helper.h                    |   2 +

Having a look at the diff stat, can we please have an entry in
MAINTAINERS for this driver ? Don't bother re-spinning the whole
series just for that and add the patch on top [for the pull request].

Thank you !

-Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
