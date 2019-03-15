From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/6] drm/bridge: Export drm_bridge_detach
Date: Fri, 15 Mar 2019 14:27:57 +0100
Message-ID: <c52be751ac1bc7b1ee21e3e2a30d5b494bf95faa.camel@bootlin.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
	 <20190315130825.9005-2-jagan@amarulasolutions.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBZOQV3SAKGQEUOQWCEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190315130825.9005-2-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jakan,

On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
> Export drm_bridge_detach from drm bridge core so-that it
> can use on respective interface or bridge driver while
> detaching the bridge.

I don't see why this change is required based on the commit log. The
DRM bridge code clearly indicates that drm_bridge_attach should *not*
be balanced with a drm_bridge_detach call in the driver, so this seems
quite wrong.

The DRM core itself should handle detaching the bridge, not the driver.
Is there any reason why you need to do things differently for DSI?

Cheers,

Paul

> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 1 +
>  include/drm/drm_bridge.h     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 138b2711d389..569d4f345429 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -159,6 +159,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  
>  	bridge->dev = NULL;
>  }
> +EXPORT_SYMBOL(drm_bridge_detach);
>  
>  /**
>   * DOC: bridge callbacks
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 9da8c93f7976..4955e3e50fa4 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -301,6 +301,7 @@ void drm_bridge_remove(struct drm_bridge *bridge);
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous);
> +void drm_bridge_detach(struct drm_bridge *bridge);
>  
>  bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
>  			   const struct drm_display_mode *mode,
> -- 
> 2.18.0.321.gffc6fa0e3
> 
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
