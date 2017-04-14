From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 2/9] drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()
Date: Fri, 14 Apr 2017 14:54:19 +0200
Message-ID: <e6c4ee8e-ea26-2c87-0f9f-5436c1e26a70@baylibre.com>
References: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
 <1492164819-10513-3-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492164819-10513-3-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/14/2017 12:13 PM, Yannick Fertre wrote:
> Add function drm_fb_cma_get_gem_addr() which return the physical address
> of framebuffer (1st pixel). This function will usually be called by plane
> callback (atomic_update).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_fb_cma_helper.c | 27 +++++++++++++++++++++++++++
>  include/drm/drm_fb_cma_helper.h     |  4 ++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
> index 50abd1f..d2b77b0 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> @@ -260,6 +260,33 @@ struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
>  EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_obj);
>  
>  /**
> + * drm_fb_cma_get_gem_addr() - Get physical address for framebuffer
> + * @fb: The framebuffer
> + * @state: Which state of drm plane
> + * @plane: Which plane
> + * Return the CMA GEM address for given framebuffer.
> + *
> + * This function will usually be called from the PLANE callback functions.
> + */
> +dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
> +				   struct drm_plane_state *state,
> +				   unsigned int plane)
> +{
> +	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
> +	dma_addr_t paddr;
> +
> +	if (plane >= 4)
> +		return 0;

Nitpick, but why not using drm_fb_cma_get_gem_obj(fb, plane) here ?

=====
struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, plane);

if (!gem)
	return 0;

paddr = gem->paddr + fb->offsets[plane];
======
> +
> +	paddr = fb_cma->obj[plane]->paddr + fb->offsets[plane];
> +	paddr += fb->format->cpp[plane] * (state->src_x >> 16);
> +	paddr += fb->pitches[plane] * (state->src_y >> 16);
> +
> +	return paddr;
> +}
> +EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
> +
> +/**
>   * drm_fb_cma_prepare_fb() - Prepare CMA framebuffer
>   * @plane: Which plane
>   * @state: Plane state attach fence to
> diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_helper.h
> index a5ecc0a..199a63f 100644
> --- a/include/drm/drm_fb_cma_helper.h
> +++ b/include/drm/drm_fb_cma_helper.h
> @@ -41,6 +41,10 @@ struct drm_framebuffer *drm_fb_cma_create(struct drm_device *dev,
>  struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
>  	unsigned int plane);
>  
> +dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
> +				   struct drm_plane_state *state,
> +				   unsigned int plane);
> +
>  int drm_fb_cma_prepare_fb(struct drm_plane *plane,
>  			  struct drm_plane_state *state);
>  
> 

Anyway it's still ok,

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
