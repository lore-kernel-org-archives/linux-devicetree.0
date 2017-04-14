From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 5/9] MAINTAINERS: add maintainers for DRM STM driver
Date: Fri, 14 Apr 2017 14:59:50 +0200
Message-ID: <b86376fd-1f73-7cec-8f4b-9a4cb4dd3f15@baylibre.com>
References: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
 <1492164819-10513-6-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492164819-10513-6-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/14/2017 12:13 PM, Yannick Fertre wrote:
> Add Philippe Cornu and myself as maintainers.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c36dfae..84cf73f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4424,6 +4424,15 @@ S:	Maintained
>  F:	drivers/gpu/drm/sti
>  F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
>  
> +DRM DRIVERS FOR STM
> +M:	Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> +M:	Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> +L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +S:	Maintained
> +F:	drivers/gpu/drm/stm
> +F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> +
>  DRM DRIVER FOR TDFX VIDEO CARDS
>  S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/tdfx/
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
