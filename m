From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] of: introduce of_graph_get_remote_node
Date: Sat, 4 Feb 2017 18:10:14 +0200
Message-ID: <6efd793f-944d-53e6-9b4b-1a78ea835cf5@mentor.com>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 02/04/2017 05:36 AM, Rob Herring wrote:
> The OF graph API leaves too much of the graph walking to clients when
> in many cases the driver doesn't care about accessing the port or
> endpoint nodes. The drivers typically just want the device connected via
> a particular graph connection. of_graph_get_remote_node provides this
> functionality.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/base.c        | 28 ++++++++++++++++++++++++++++
>  include/linux/of_graph.h |  8 ++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d4bea3c797d6..ea18ab16b92c 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2469,3 +2469,31 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
>  	return of_get_next_parent(np);
>  }
>  EXPORT_SYMBOL(of_graph_get_remote_port);
> +
> +struct device_node *of_graph_get_remote_node(const struct device_node *node,
> +					     int port, int endpoint)

it would be nice to add a short comment that a returned device
node is expected to be dereferenced with of_node_put().

> +{
> +	struct device_node *endpoint_node, *remote;
> +
> +	endpoint_node = of_graph_get_endpoint_by_regs(node, port, endpoint);
> +	if (!endpoint_node) {
> +		pr_debug("no valid endpoint (%d, %d) for node %s\n",
> +			 port, endpoint, node->full_name);
> +		return NULL;
> +	}
> +
> +	remote = of_graph_get_remote_port_parent(endpoint_node);
> +	of_node_put(endpoint);

Typo, here it should be of_node_put(endpoint_node);

> +	if (!remote) {
> +		pr_debug("no valid remote node\n");
> +		return NULL;
> +	}
> +
> +	if (!of_device_is_available(remote)) {
> +		pr_debug("not available for remote node\n");
> +		return NULL;
> +	}
> +
> +	return remote;
> +}
> +EXPORT_SYMBOL(of_graph_get_remote_node);

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
