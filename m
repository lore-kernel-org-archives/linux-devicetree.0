From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 11/12] drm/panel: Add Feiyang
 FY07024DI26A30-D MIPI-DSI LCD panel
Date: Mon, 10 Dec 2018 21:42:38 +0530
Message-ID: <CAMty3ZBNJ07v7jWq9s8KyvitGaJ5e_igPoP=9X9wN=PAyfOU0A@mail.gmail.com>
References: <20181116163916.29621-1-jagan@amarulasolutions.com> <20181116163916.29621-12-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBA5BXLQAKGQEPYPBS2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181116163916.29621-12-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thierry and David,

On Fri, Nov 16, 2018 at 10:10 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> Feiyang FY07024DI26A30-D is 1024x600, 4-lane MIPI-DSI LCD panel.
>
> Add panel driver for it.
>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-feiyang-fy07024di26a30d.c | 286 ++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3dac08d0b3cb..40c8bfc974f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4620,6 +4620,12 @@ T:       git git://anongit.freedesktop.org/drm/drm-misc
>  S:     Maintained
>  F:     drivers/gpu/drm/tve200/
>
> +DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
> +M:     Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> +S:     Maintained
> +F:     drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> +F:     Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> +
>  DRM DRIVER FOR ILITEK ILI9225 PANELS
>  M:     David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>  S:     Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d0d4e60f5153..bc70896fe43c 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -47,6 +47,15 @@ config DRM_PANEL_SIMPLE
>           that it can be automatically turned off when the panel goes into a
>           low power state.
>
> +config DRM_PANEL_FEIYANG_FY07024DI26A30D
> +       tristate "Feiyang FY07024DI26A30-D MIPI-DSI LCD panel"
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       help
> +         Say Y if you want to enable support for panels based on the
> +         Feiyang FY07024DI26A30-D MIPI-DSI interface.
> +

Any comments on this?
