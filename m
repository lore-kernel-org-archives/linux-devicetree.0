From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Fri, 16 Jun 2017 11:13:01 +0530
Message-ID: <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
References: <20170615204130.19255-1-eric@anholt.net>
 <20170615204130.19255-2-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615204130.19255-2-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/16/2017 02:11 AM, Eric Anholt wrote:
> If the panel-bridge is being set up after the drm_mode_config_reset(),
> then the connector's state would never get initialized, and we'd
> dereference the NULL in the hotplug path.  We also need to register
> the connector, so that userspace can get at it.
> 

Shouldn't the KMS driver make sure the panel-bridge is set up before
drm_mode_config_reset? Is it the case when we're inserting the
panel-bridge driver as a module?


All the connectors that have been added are registered automatically
when drm_dev_register() is called by the KMS driver. Registering a
connector in the middle of setting up our driver is prone to race
conditions if the userspace decides to use them immediately.

Thanks,
Archit

> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>   drivers/gpu/drm/bridge/panel.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 67fe19e5a9c6..8ed8a70799c7 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -82,11 +82,14 @@ static int panel_bridge_attach(struct drm_bridge *bridge)
>   
>   	drm_mode_connector_attach_encoder(&panel_bridge->connector,
>   					  bridge->encoder);
> +	drm_atomic_helper_connector_reset(&panel_bridge->connector);
>   
>   	ret = drm_panel_attach(panel_bridge->panel, &panel_bridge->connector);
>   	if (ret < 0)
>   		return ret;
>   
> +	drm_connector_register(&panel_bridge->connector);
> +
>   	return 0;
>   }
>   
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
