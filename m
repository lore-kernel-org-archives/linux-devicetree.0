From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v6 1/7] drm/stm: ltdc: Fix leak of px clk enable in some
 error paths
Date: Sat, 29 Jul 2017 20:02:50 +0530
Message-ID: <bd6aeb5d-8f39-3e5e-0f72-a1d50e4438ef@codeaurora.org>
References: <1500277223-29553-1-git-send-email-philippe.cornu@st.com>
 <1500277223-29553-2-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500277223-29553-2-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao@rock-chip>
Cc: Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philippe,

On 07/17/2017 01:10 PM, Philippe CORNU wrote:
> The pixel clock gets enabled early during init, since it's required
> in order to read registers. This pixel clock must be disabled if
> errors during this init phase.
> 

This patch was pulled in to drm-misc-next, but it lacks your Sign-off.
It looks like the Ack and the Sign-off got accidentally mixed up

Can you please reply to this mail with your "Signed-off-by" so that
we have proof of it on dri-devel?

Thanks,
Archit

> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Acked-by: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5331760..7f64d5a 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1045,13 +1045,15 @@ int ltdc_load(struct drm_device *ddev)
>   
>   	if (of_address_to_resource(np, 0, &res)) {
>   		DRM_ERROR("Unable to get resource\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err;
>   	}
>   
>   	ldev->regs = devm_ioremap_resource(dev, &res);
>   	if (IS_ERR(ldev->regs)) {
>   		DRM_ERROR("Unable to get ltdc registers\n");
> -		return PTR_ERR(ldev->regs);
> +		ret = PTR_ERR(ldev->regs);
> +		goto err;
>   	}
>   
>   	for (i = 0; i < MAX_IRQ; i++) {
> @@ -1064,7 +1066,7 @@ int ltdc_load(struct drm_device *ddev)
>   						dev_name(dev), ddev);
>   		if (ret) {
>   			DRM_ERROR("Failed to register LTDC interrupt\n");
> -			return ret;
> +			goto err;
>   		}
>   	}
>   
> @@ -1079,7 +1081,7 @@ int ltdc_load(struct drm_device *ddev)
>   	if (ret) {
>   		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
>   			  ldev->caps.hw_version);
> -		return ret;
> +		goto err;
>   	}
>   
>   	DRM_INFO("ltdc hw version 0x%08x - ready\n", ldev->caps.hw_version);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
