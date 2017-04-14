From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 1/9] drm/cma: Update DEFINE_DRM_GEM_CMA_FOPS to add
 get_unmapped_area
Date: Fri, 14 Apr 2017 14:49:19 +0200
Message-ID: <f9c28c29-a681-0157-a6a8-e7cf244d8775@baylibre.com>
References: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
 <1492164819-10513-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492164819-10513-2-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/14/2017 12:13 PM, Yannick Fertre wrote:
> Missing field get_unmapped_area which is necessary with device without MMU
> 
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  include/drm/drm_gem_cma_helper.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index f962d33..7320b14 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -50,6 +50,7 @@ struct drm_gem_cma_object {
>  		.read		= drm_read,\
>  		.llseek		= noop_llseek,\
>  		.mmap		= drm_gem_cma_mmap,\
> +		.get_unmapped_area	= drm_gem_cma_get_unmapped_area,\
>  	}
>  
>  /* free GEM object */
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
