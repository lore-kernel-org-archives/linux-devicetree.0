From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 2/3] drm/mediatek: add support for Mediatek SoC MT2701
Date: Fri, 13 May 2016 11:59:16 +0800
Message-ID: <1463111956.12239.15.camel@mtksdaap41>
References: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
	 <1463053795-55455-3-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463053795-55455-3-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, YT:

On Thu, 2016-05-12 at 19:49 +0800, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This patch add support for the Mediatek MT2701 DISP subsystem.
> There is only one OVL engine in MT2701, and we have shadow
> register support here.
> 
> Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---

> @@ -385,12 +422,16 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  		mtk_crtc->event = state->base.event;
>  		state->base.event = NULL;
>  	}
> +
> +	if (priv->data->shadow_register)
> +		mtk_disp_mutex_acquire(mtk_crtc->mutex);
>  }
>  
> @@ -409,6 +450,11 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  	}
>  	if (pending_planes)
>  		mtk_crtc->pending_planes = true;
> +
> +	if (priv->data->shadow_register) {
> +		mtk_crtc_ddp_config(crtc);
> +		mtk_disp_mutex_release(mtk_crtc->mutex);
> +	}
>  }
>  

I think it's better to call mtk_disp_mutex_acquire() and
mtk_disp_mutex_release() as near as possible to prevent mutex locked for
a long time. All HW register access of this atomic setting is in
mtk_crtc_ddp_config(), so it's better to move mtk_disp_mutex_acquire()
just before mtk_crtc_ddp_config().

Regards,
CK

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
