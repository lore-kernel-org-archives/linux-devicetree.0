From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] drm: of: introduce drm_of_find_panel_or_bridge
Date: Fri, 10 Feb 2017 11:42:55 -0800
Message-ID: <589E17BF.1060106@gmail.com>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>Philipp Zabel <p>
List-Id: devicetree@vger.kernel.org

On 02/03/17 19:36, Rob Herring wrote:
> Many drivers have a common pattern of searching the OF graph for either an
> attached panel or bridge and then finding the DRM struct for the panel
> or bridge. Also, most drivers need to handle deferred probing when the
> DRM device is not yet instantiated. Create a common function,
> drm_of_find_panel_or_bridge, to find the connected node and the
> associated DRM panel or bridge device.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_of.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_of.h     | 13 +++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 47848ed8ca48..b29ce2f52113 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -3,7 +3,9 @@
>  #include <linux/list.h>
>  #include <linux/of_graph.h>
>  #include <drm/drmP.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_of.h>
>  
>  static void drm_release_of(struct device *dev, void *data)
> @@ -207,3 +209,51 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
>  	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> +
> +/*
> + * drm_of_find_panel_or_bridge - return connected panel or bridge device
> + * @np: device tree node containing encoder input ports

      @port: ....
      @endpoint: ....


> + * @panel: pointer to hold returned drm_panel
> + * @bridge: pointer to hold returned drm_bridge
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return either the associated struct drm_panel or drm_bridge device.
> + *
> + * Returns zero if successful, or one of the standard error codes if it fails.
> + */
> +int drm_of_find_panel_or_bridge(const struct device_node *np,
> +				int port, int endpoint,
> +				struct drm_panel **panel,
> +				struct drm_bridge **bridge)
> +{

< snip >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
