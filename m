From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2
 mixers and display engines
Date: Thu, 23 Feb 2017 17:44:54 +0000
Message-ID: <CACvgo5117BB+o429cH=X0t3xz_5=XZ65YCEdE=ro+895a9e=RA@mail.gmail.com>
References: <20170222151854.3280-1-icenowy@aosc.xyz> <20170222151854.3280-5-icenowy@aosc.xyz>
Reply-To: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2JJ4UO64LBBF57XTCQKGQEVRPAUMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170222151854.3280-5-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22 February 2017 at 15:18, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
> in a new "Display Engine" (mixers instead of old backends and
> frontends).
>
> Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/Kconfig       |   8 +
>  drivers/gpu/drm/sun4i/Makefile      |   1 +
>  drivers/gpu/drm/sun4i/sun4i_crtc.c  |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c   |  38 +++-
>  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
>  drivers/gpu/drm/sun4i/sun4i_layer.c |  92 ++++++--
>  drivers/gpu/drm/sun4i/sun4i_layer.h |   1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 417 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 133 ++++++++++++
>  9 files changed, 674 insertions(+), 23 deletions(-)
Silly question:

Does this series cover the same functionality/hardware as the separate
sun8i driver proposed a few months back ?
The diff stat looks quite different (~1.6k vs ~0.6k), although that
could be due to reusing the existing sun4i code.

Thanks
Emil
