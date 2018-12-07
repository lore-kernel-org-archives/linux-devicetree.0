From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] coresight: Use of_node_name_eq for node name comparisons
Date: Fri, 7 Dec 2018 10:36:13 -0700
Message-ID: <20181207173613.GA27493@xps15>
References: <20181205195050.4759-34-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181205195050.4759-34-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 01:50:50PM -0600, Rob Herring wrote:
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/hwtracing/coresight/of_coresight.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
> index 89092f83567e..7045930fc958 100644
> --- a/drivers/hwtracing/coresight/of_coresight.c
> +++ b/drivers/hwtracing/coresight/of_coresight.c
> @@ -80,8 +80,8 @@ static struct device_node *of_coresight_get_port_parent(struct device_node *ep)
>  	 * Skip one-level up to the real device node, if we
>  	 * are using the new bindings.
>  	 */
> -	if (!of_node_cmp(parent->name, "in-ports") ||
> -	    !of_node_cmp(parent->name, "out-ports"))
> +	if (of_node_name_eq(parent, "in-ports") ||
> +	    of_node_name_eq(parent, "out-ports"))
>  		parent = of_get_next_parent(parent);

Applied - thanks.

>  
>  	return parent;
> -- 
> 2.19.1
> 
