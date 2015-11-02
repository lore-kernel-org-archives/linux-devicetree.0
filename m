From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 11/19] drm: sun4i: Add composite output
Date: Mon, 2 Nov 2015 13:53:20 +1100
Message-ID: <CANwerB0tva90mj7Anits0gfecQuLcDZ-BEctc0VNAY+Oq0dLbA@mail.gmail.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
	<1446214865-3972-12-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCVMZKEXYEFBBIFA3OYQKGQEPENOHBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1446214865-3972-12-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 October 2015 at 01:20, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Some Allwinner SoCs have an IP called the TV encoder that is used to output
> composite and VGA signals. In such a case, we need to use the second TCON
> channel.
>
> Add support for that TV encoder.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/Makefile    |   1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c |  10 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c  | 532 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tv.h  |  18 ++
>  4 files changed, 560 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sun4i_tv.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun4i_tv.h
>
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
> index 4d230b658a05..fc0dc8be82d9 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -6,5 +6,6 @@ sun4i-drm-y += sun4i_layer.o
>  sun4i-drm-y += sun4i_tcon.o
>
>  sun4i-drm-y += sun4i_rgb.o
> +sun4i-drm-y += sun4i_tv.o
>
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i-drm.o
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index f2c9c8a2eb75..3cf7a9e89afa 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -22,6 +22,7 @@
>  #include "sun4i_layer.h"
>  #include "sun4i_rgb.h"
>  #include "sun4i_tcon.h"
> +#include "sun4i_tv.h"
>
>  static void sun4i_drv_preclose(struct drm_device *drm,
>                                struct drm_file *file_priv)
> @@ -134,12 +135,18 @@ static int sun4i_drv_load(struct drm_device *drm, unsigned long flags)
>                 goto err_free_crtc;
>         }
>
> +       ret = sun4i_tv_init(drm);
> +       if (ret) {
> +               dev_err(drm->dev, "Couldn't create our RGB output\n");

RGB should be composite. Seems like a copy-paste error.

> +               goto err_free_rgb;
> +       }
> +
>         /* Create our framebuffer */
>         drv->fbdev = sun4i_framebuffer_init(drm);
>         if (IS_ERR(drv->fbdev)) {
>                 dev_err(drm->dev, "Couldn't create our framebuffer\n");
>                 ret = PTR_ERR(drv->fbdev);
> -               goto err_free_rgb;
> +               goto err_free_tv;
>         }
>
>         /* Enable connectors polling */

Regards,
Jonathan
