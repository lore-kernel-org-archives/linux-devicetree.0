From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/5] of: introduce of_graph_get_remote_node
Date: Mon, 6 Feb 2017 09:50:23 +0100
Message-ID: <20170206085023.onmsh5dcmn6ofpp5@phenom.ffwll.local>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170204033635.10250-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Frank Rowand <frowand.list@gmail.com>, Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Kukjin Kim <kgene@kernel.org>, Mali DP Maintainers <malidp@foss.arm.com>, devicetree@vger.kernel.org, Chen Feng <puck.chen@hisilicon.com>, Jyri Sarha <jsarha@ti.com>, Carlo
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 09:36:31PM -0600, Rob Herring wrote:
> The OF graph API leaves too much of the graph walking to clients when
> in many cases the driver doesn't care about accessing the port or
> endpoint nodes. The drivers typically just want the device connected via
> a particular graph connection. of_graph_get_remote_node provides this
> functionality.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Just a quick procedural comment: drm-misc for 4.11 is closed already, but
if we can get this core patch into 4.11 still then that would avoid
cross-tree sync pains in 4.12 ...
-Daniel

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
>  
> -- 
> 2.10.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
