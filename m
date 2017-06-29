From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 1/3] drm: rcar-du: use of_graph_get_remote_endpoint()
Date: Thu, 29 Jun 2017 13:44:42 +0300
Message-ID: <2246315.6ZutvAkGUK@avalon>
References: <87mv8tez69.wl%kuninori.morimoto.gx@renesas.com> <87lgodez3z.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87lgodez3z.wl%kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Wednesday 28 Jun 2017 00:32:17 Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> 
> Now, we can use of_graph_get_remote_endpoint(). Let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
> based on 4c9c3d595f1bad021cc126d20879df4016801736
> ("of_graph: add of_graph_get_remote_endpoint()")

This commit isn't upstream yet. I've taken the patch in my tree and will 
rebase it on top of v4.13-rc1 before submitting it for v4.14.

>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 82b978a..66d8cc3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -309,7 +309,7 @@ static int rcar_du_encoders_init_one(struct
> rcar_du_device *rcdu, return -ENODEV;
>  	}
> 
> -	entity_ep_node = of_parse_phandle(ep->local_node, "remote-endpoint", 
0);
> +	entity_ep_node = of_graph_get_remote_endpoint(ep->local_node);
> 
>  	for_each_endpoint_of_node(entity, ep_node) {
>  		if (ep_node == entity_ep_node)

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
