From: Eric Engestrom <eric.engestrom-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add entry for Mali-DP driver
Date: Wed, 15 Jun 2016 16:35:24 +0100
Message-ID: <20160615153524.GA21140@imgtec.com>
References: <1466002295-24813-1-git-send-email-Liviu.Dudau@arm.com>
 <1466002295-24813-4-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466002295-24813-4-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15, 2016 at 03:51:35PM +0100, Liviu Dudau wrote:
> Add MAINTAINERS entry for ARM Mali-DP driver and update the
> HDLCD file matching pattern to cover only HDLCD rather than
> the whole drivers/gpu/drm/arm directory.
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> ---
>  MAINTAINERS | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0bf119c..16deb07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -865,9 +865,17 @@ F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
>  ARM HDLCD DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
>  S:	Supported
> -F:	drivers/gpu/drm/arm/
> +F:	drivers/gpu/drm/arm/hdlcd_*
>  F:	Documentation/devicetree/bindings/display/arm,hdlcd.txt
>  
> +ARM MALI-DP DRM DRIVER
> +M:	Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> +M:	Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> +M:	Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>
> +S:	Supported
> +F:	drivers/gpu/drm/arm/

IIUC this will also catch `drivers/gpu/drm/arm/hdlcd_*`.
Did you mean `drivers/gpu/drm/arm/malidp_*` ?

> +F:	Documentation/devicetree/bindings/display/arm,malidp.txt
> +
>  ARM MFM AND FLOPPY DRIVERS
>  M:	Ian Molton <spyro-pTmfFsKkaRw@public.gmane.org>
>  S:	Maintained
> -- 
> 2.8.2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
