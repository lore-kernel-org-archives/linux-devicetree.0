From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6 07/13] drm/sun4i: add a Kconfig option
 for sun4i-backend
Date: Fri, 5 May 2017 11:14:25 +0800
Message-ID: <CAGb2v64GYR=S1eTBzvG3jzJBa8EDO9ZupChkfo05JCxP73d6Cw@mail.gmail.com>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-8-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKO4V7EAKGQE56KLBFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170504114858.9008-8-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 4, 2017 at 7:48 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> As sun4i-backend is now a dedicated module, add an Kconfig option for
> it to make it optional, since some build may only use other engines.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Splited out patch.
>
>  drivers/gpu/drm/sun4i/Kconfig  | 10 ++++++++++
>  drivers/gpu/drm/sun4i/Makefile |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index a4b357db8856..5a8227f37cc4 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -12,3 +12,13 @@ config DRM_SUN4I
>           Choose this option if you have an Allwinner SoC with a
>           Display Engine. If M is selected the module will be called
>           sun4i-drm.
> +
> +config DRM_SUN4I_BACKEND
> +       tristate "Support for Allwinner A10 Display Engine Backend"
> +       depends on DRM_SUN4I
> +       default DRM_SUN4I
> +       help
> +         Choose this option if you have an Allwinner SoC with the
> +         original Allwinner Display Engine, which has a backend to
> +         do some alpha blending and feed graphics to TCON. If M is
> +         selected the module will be called sun4i-backend.
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
> index a251fb36c951..a08df56759e3 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -9,6 +9,6 @@ sun4i-tcon-y += sun4i_crtc.o
>  sun4i-backend-y += sun4i_backend.o sun4i_layer.o
>
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i-drm.o sun4i-tcon.o
> -obj-$(CONFIG_DRM_SUN4I)                += sun4i-backend.o
> +obj-$(CONFIG_DRM_SUN4I_BACKEND)                += sun4i-backend.o
>  obj-$(CONFIG_DRM_SUN4I)                += sun6i_drc.o
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i_tv.o

Can you move sun4i-backend to the bottom in a separate section? The idea
is to have a bunch of core or common stuff, then platform specific modules.

Thanks
ChenYu
