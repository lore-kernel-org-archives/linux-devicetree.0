From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 03/20] coresight: Fix remote endpoint parsing
Date: Fri, 8 Jun 2018 14:05:03 -0600
Message-ID: <20180608200503.GC30587@xps15>
References: <1528235011-30691-1-git-send-email-suzuki.poulose@arm.com>
 <1528235011-30691-4-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1528235011-30691-4-git-send-email-suzuki.poulose@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, coresight@lists.linaro.org, john.horley@arm.com, linux-kernel@vger.kernel.org, arm@kernel.org, sudeep.holla@arm.com, matt.sealey@arm.com, mike.leach@linaro.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, charles.garcia-tobin@arm.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2018 at 10:43:14PM +0100, Suzuki K Poulose wrote:
> When parsing the remote endpoint of an output port, we do :
>      rport = of_graph_get_remote_port(ep);
>      rparent = of_graph_get_remote_port_parent(ep);
> 
> and then parse the "remote_port" as if it was the remote endpoint,
> which is wrong. The code worked fine because we used endpoint number
> as the port number. Let us fix it and optimise a bit as:
> 
>      remote_ep = of_graph_get_remote_endpoint(ep);
>      if (remote_ep)
>         remote_parent = of_graph_get_port_parent(remote_ep);
> 
> and then, parse the remote_ep for the port/endpoint details.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/of_coresight.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
> index 8a23c63..ada4f07 100644
> --- a/drivers/hwtracing/coresight/of_coresight.c
> +++ b/drivers/hwtracing/coresight/of_coresight.c
> @@ -129,7 +129,7 @@ static int of_coresight_parse_endpoint(struct device_node *ep,
>  	int ret = 0;
>  	struct of_endpoint endpoint, rendpoint;
>  	struct device_node *rparent = NULL;
> -	struct device_node *rport = NULL;
> +	struct device_node *rep = NULL;
>  	struct device *rdev = NULL;
>  
>  	do {
> @@ -144,16 +144,16 @@ static int of_coresight_parse_endpoint(struct device_node *ep,
>  		if (of_graph_parse_endpoint(ep, &endpoint))
>  			break;
>  		/*
> -		 * Get a handle on the remote port and parent
> -		 * attached to it.
> +		 * Get a handle on the remote endpoint and the device it is
> +		 * attached to.
>  		 */
> -		rparent = of_graph_get_remote_port_parent(ep);
> +		rep = of_graph_get_remote_endpoint(ep);
> +		if (!rep)
> +			break;
> +		rparent = of_graph_get_port_parent(rep);
>  		if (!rparent)
>  			break;
> -		rport = of_graph_get_remote_port(ep);
> -		if (!rport)
> -			break;
> -		if (of_graph_parse_endpoint(rport, &rendpoint))
> +		if (of_graph_parse_endpoint(rep, &rendpoint))
>  			break;
>  
>  		/* If the remote device is not available, defer probing */
> @@ -165,15 +165,15 @@ static int of_coresight_parse_endpoint(struct device_node *ep,
>  
>  		pdata->outports[*i] = endpoint.port;
>  		pdata->child_names[*i] = dev_name(rdev);
> -		pdata->child_ports[*i] = rendpoint.id;
> +		pdata->child_ports[*i] = rendpoint.port;
>  		/* Move the index */
>  		(*i)++;
>  	} while (0);
>  
>  	if (rparent)
>  		of_node_put(rparent);
> -	if (rport)
> -		of_node_put(rport);
> +	if (rep)
> +		of_node_put(rep);
>  
>  	return ret;
>  }

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

(Please add to the next iteration so that I don't have to review again)

> -- 
> 2.7.4
> 
