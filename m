From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/5] dt: add of_platform_populate() for creating device
	from the device tree
Date: Wed, 08 Jun 2011 09:20:05 -0500
Message-ID: <4DEF8515.5060004@gmail.com>
References: <20110316083046.1154.89723.stgit@localhost6.localdomain6>
	<20110316083348.1154.4764.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110316083348.1154.4764.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant,

This is a bit old, but my testing has uncovered a few issues.

On 03/16/2011 03:33 AM, Grant Likely wrote:
> of_platform_populate() is similar to of_platform_bus_probe() except
> that it strictly enforces that all device nodes must have a compatible
> property, and it can be used to register devices (not buses) which are
> children of the root node.
>
> This patch also modifies MPC5200 support to use the new function.
>
> Signed-off-by: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>   arch/powerpc/platforms/52xx/mpc52xx_common.c |   10 ++---
>   drivers/of/platform.c                        |   54 ++++++++++++++++++++++++--
>   include/linux/of_platform.h                  |    3 +
>   3 files changed, 57 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
> index 41f3a7e..5767a8a 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
> @@ -97,13 +97,11 @@ struct mpc52xx_gpio_wkup __iomem *wkup_gpio;
>    *					of the localplus bus to the of_platform
>    *					bus.
>    */
> -void __init
> -mpc52xx_declare_of_platform_devices(void)
> +void __init mpc52xx_declare_of_platform_devices(void)
>   {
> -	/* Find every child of the SOC node and add it to of_platform */
> -	if (of_platform_bus_probe(NULL, mpc52xx_bus_ids, NULL))
> -		printk(KERN_ERR __FILE__ ": "
> -			"Error while probing of_platform bus\n");
> +	/* Find all the 'platform' devices and register them. */
> +	if (of_platform_populate(NULL, mpc52xx_bus_ids, NULL))
> +		pr_err(__FILE__ ": Error while populating devices from DT\n");
>   }
>
>   /*
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 63d3cb7..9b785be 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -221,19 +221,26 @@ EXPORT_SYMBOL(of_platform_device_create);
>    */
>   static int of_platform_bus_create(struct device_node *bus,
>   				  const struct of_device_id *matches,
> -				  struct device *parent)
> +				  struct device *parent, bool strict)
>   {
>   	struct device_node *child;
>   	struct platform_device *dev;
>   	int rc = 0;
>
> +	/* Make sure it has a compatible property */
> +	if (strict&&  (!of_get_property(bus, "compatible", NULL))) {
> +		pr_debug("%s() - skipping %s, no compatible prop\n",
> +			 __func__, bus->full_name);
> +		return 0;
> +	}
> +
>   	dev = of_platform_device_create(bus, NULL, parent);
>   	if (!dev || !of_match_node(matches, bus))
>   		return 0;
>
>   	for_each_child_of_node(bus, child) {
>   		pr_debug("   create child: %s\n", child->full_name);
> -		rc = of_platform_bus_create(child, matches,&dev->dev);
> +		rc = of_platform_bus_create(child, matches,&dev->dev, strict);
>   		if (rc) {
>   			of_node_put(child);
>   			break;
> @@ -267,11 +274,11 @@ int of_platform_bus_probe(struct device_node *root,
>
>   	/* Do a self check of bus type, if there's a match, create children */
>   	if (of_match_node(matches, root)) {
> -		rc = of_platform_bus_create(root, matches, parent);
> +		rc = of_platform_bus_create(root, matches, parent, false);
>   	} else for_each_child_of_node(root, child) {
>   		if (!of_match_node(matches, child))
>   			continue;
> -		rc = of_platform_bus_create(child, matches, parent);
> +		rc = of_platform_bus_create(child, matches, parent, false);
>   		if (rc)
>   			break;
>   	}
> @@ -280,4 +287,43 @@ int of_platform_bus_probe(struct device_node *root,
>   	return rc;
>   }
>   EXPORT_SYMBOL(of_platform_bus_probe);
> +
> +/**
> + * of_platform_populate() - Populate platform_devices from device tree data
> + * @root: parent of the first level to probe or NULL for the root of the tree
> + * @matches: match table, NULL to use the default
> + * @parent: parent to hook devices from, NULL for toplevel
> + *
> + * Similar to of_platform_bus_probe(), this function walks the device tree
> + * and creates devices from nodes.  It differs in that it follows the modern
> + * convention of requiring all device nodes to have a 'compatible' property,
> + * and it is suitable for creating devices which are children of the root
> + * node (of_platform_bus_probe will only create children of the root which
> + * are selected by the @matches argument).
> + *
> + * New board support should be using this function instead of
> + * of_platform_bus_probe().
> + *
> + * Returns 0 on success,<  0 on failure.
> + */
> +int of_platform_populate(struct device_node *root,
> +			const struct of_device_id *matches,
> +			struct device *parent)
> +{
> +	struct device_node *child;
> +	int rc = 0;
> +
> +	root = root ? of_node_get(root) : of_find_node_by_path("/");
> +	if (!root)
> +		return -EINVAL;
> +
> +	for_each_child_of_node(root, child) {

This needs a check of of_match_node. Otherwise, a device is created for 
all top level nodes, not just the matching node.

		if (!of_match_node(matches, child))
			continue;

> +		rc = of_platform_bus_create(child, matches, parent, true);
> +		if (rc)
> +			break;
> +	}
> +
> +	of_node_put(root);
> +	return rc;
> +}

Missing EXPORT_SYMBOL.

Since this is only in next, do you want to fix it or I can submit a patch.

Rob
