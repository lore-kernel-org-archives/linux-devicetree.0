From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/5] of: introduce of_graph_get_remote_node
Date: Mon, 06 Feb 2017 11:32:47 +0100
Message-ID: <1486377167.3005.30.camel@pengutronix.de>
References: <20170204033635.10250-1-robh@kernel.org>
         <20170204033635.10250-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

Hi Rob,

thanks for this clean-up series! I was not aware how far the duplication
has spread over time.

On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
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

I think this should have a documentation comment, similar to the
of_graph_get_endpoint_by_regs one, as it is not really clear from the
function name that the returned device node is the parent (or
grandparent) device node containing the remote port to the specified
node & port & endpoint.
Also it might be interesting to the user that -1 is a wildcard value for
port / endpoint.

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

Vladimir pointed this out already. With that fixed and the missing doc
comment added,
Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

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
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index bb3a5a2cd570..7b71d3e09209 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -51,6 +51,8 @@ struct device_node *of_graph_get_endpoint_by_regs(
>  struct device_node *of_graph_get_remote_port_parent(
>  					const struct device_node *node);
>  struct device_node *of_graph_get_remote_port(const struct device_node *node);
> +struct device_node *of_graph_get_remote_node(const struct device_node *node,
> +					     int port, int endpoint);
>  #else
>  
>  static inline int of_graph_parse_endpoint(const struct device_node *node,
> @@ -89,6 +91,12 @@ static inline struct device_node *of_graph_get_remote_port(
>  {
>  	return NULL;
>  }
> +static inline struct device_node *of_graph_get_remote_node(
> +					const struct device_node *node,
> +					int port, int endpoint)
> +{
> +	return NULL;
> +}
>  
>  #endif /* CONFIG_OF */

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
