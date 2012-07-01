From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Sun, 01 Jul 2012 14:36:22 -0500
Message-ID: <4FF0A6B6.8040902@gmail.com>
References: <1340924755-31447-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1340924755-31447-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/28/2012 06:05 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> An "enumerated" bus is one that is not memory-mapped, hence hence
> typically has #address-cells=1, and #size-cells=0. Such buses would be
> used to group related non-memory-mapped nodes together, often just under
> the top-level of the device tree. The ability to group nodes into a non-
> memory-mapped subnode of the root is important, since if nodes exist to
> describe multiple entities of the same type, the nodes will have the
> same name, and hence require a unit address to differentiate them. It
> doesn't make sense to assign bogus unit addresses from the CPU's own
> address space for this purpose. An example:
> 
> 	regulators {
> 		compatible = "enumerated-bus";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		regulator@0 {
> 			compatible = "regulator-fixed";
> 			reg = <0>;
> 		};
> 
> 		regulator@1 {
> 			compatible = "regulator-fixed";
> 			reg = <1>;
> 		};
> 	};
> 
> Finally, because such buses are not memory-mapped, we avoid creating
> any IO/memory resources for the device.

This seems like a work-around to use reg instead of using cell-index
(which is discouraged). reg in this case is really not a hardware
description. Do you have an intended use or just trying to fix the error
messages?

Rob


> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/platform.c     |   79 ++++++++++++++++++++++++++++++++++----------
>  include/linux/of_device.h |    2 +-
>  2 files changed, 62 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 3132ea0..3ebefa9 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -25,6 +25,7 @@
>  
>  const struct of_device_id of_default_bus_match_table[] = {
>  	{ .compatible = "simple-bus", },
> +	{ .compatible = "enumerated-bus", },
>  #ifdef CONFIG_ARM_AMBA
>  	{ .compatible = "arm,amba-bus", },
>  #endif /* CONFIG_ARM_AMBA */
> @@ -67,16 +68,25 @@ EXPORT_SYMBOL(of_find_device_by_node);
>  /**
>   * of_device_make_bus_id - Use the device node data to assign a unique name
>   * @dev: pointer to device structure that is linked to a device tree node
> + * @enumerated: Is the parent bus of the device an "enumerated" bus?
>   *
>   * This routine will first try using either the dcr-reg or the reg property
>   * value to derive a unique name.  As a last resort it will use the node
>   * name followed by a unique number.
> + *
> + * An "enumerated" bus is assumed to support #size-cells=0, and not be memory-
> + * mapped. This prevents of_translate_address() from being used on the
> + * device's reg property; performing address translation makes no logical
> + * sense, and fails if #size-cells=0. We use the first component of the reg
> + * property directly to form a unique name in this case; this value is only
> + * local to the bus, rather than typically globally unique.
>   */
> -void of_device_make_bus_id(struct device *dev)
> +void of_device_make_bus_id(struct device *dev, bool enumerated)
>  {
>  	static atomic_t bus_no_reg_magic;
>  	struct device_node *node = dev->of_node;
>  	const u32 *reg;
> +	const __be32 *addrp;
>  	u64 addr;
>  	int magic;
>  
> @@ -105,7 +115,15 @@ void of_device_make_bus_id(struct device *dev)
>  	 */
>  	reg = of_get_property(node, "reg", NULL);
>  	if (reg) {
> -		addr = of_translate_address(node, reg);
> +		if (enumerated) {
> +			addrp = of_get_address(node, 0, NULL, NULL);
> +			if (addrp)
> +				addr = of_read_number(addrp, 1);
> +			else
> +				addr = OF_BAD_ADDR;
> +		} else {
> +			addr = of_translate_address(node, reg);
> +		}
>  		if (addr != OF_BAD_ADDR) {
>  			dev_set_name(dev, "%llx.%s",
>  				     (unsigned long long)addr, node->name);
> @@ -126,10 +144,12 @@ void of_device_make_bus_id(struct device *dev)
>   * @np: device node to assign to device
>   * @bus_id: Name to assign to the device.  May be null to use default name.
>   * @parent: Parent device.
> + * @enumerated: Is the parent bus of the device an "enumerated" bus?
>   */
> -struct platform_device *of_device_alloc(struct device_node *np,
> -				  const char *bus_id,
> -				  struct device *parent)
> +struct platform_device *__of_device_alloc(struct device_node *np,
> +					  const char *bus_id,
> +					  struct device *parent,
> +					  bool enumerated)
>  {
>  	struct platform_device *dev;
>  	int rc, i, num_reg = 0, num_irq;
> @@ -140,8 +160,9 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  		return NULL;
>  
>  	/* count the io and irq resources */
> -	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
> -		num_reg++;
> +	if (!enumerated)
> +		while (of_address_to_resource(np, num_reg, &temp_res) == 0)
> +			num_reg++;
>  	num_irq = of_irq_count(np);
>  
>  	/* Populate the resource table */
> @@ -170,10 +191,23 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  	if (bus_id)
>  		dev_set_name(&dev->dev, "%s", bus_id);
>  	else
> -		of_device_make_bus_id(&dev->dev);
> +		of_device_make_bus_id(&dev->dev, enumerated);
>  
>  	return dev;
>  }
> +
> +/**
> + * of_device_alloc - Allocate and initialize an of_device
> + * @np: device node to assign to device
> + * @bus_id: Name to assign to the device.  May be null to use default name.
> + * @parent: Parent device.
> + */
> +struct platform_device *of_device_alloc(struct device_node *np,
> +				  const char *bus_id,
> +				  struct device *parent)
> +{
> +	return __of_device_alloc(np, bus_id, parent, false);
> +}
>  EXPORT_SYMBOL(of_device_alloc);
>  
>  /**
> @@ -190,14 +224,15 @@ struct platform_device *of_platform_device_create_pdata(
>  					struct device_node *np,
>  					const char *bus_id,
>  					void *platform_data,
> -					struct device *parent)
> +					struct device *parent,
> +					bool enumerated)
>  {
>  	struct platform_device *dev;
>  
>  	if (!of_device_is_available(np))
>  		return NULL;
>  
> -	dev = of_device_alloc(np, bus_id, parent);
> +	dev = __of_device_alloc(np, bus_id, parent, enumerated);
>  	if (!dev)
>  		return NULL;
>  
> @@ -234,7 +269,7 @@ struct platform_device *of_platform_device_create(struct device_node *np,
>  					    const char *bus_id,
>  					    struct device *parent)
>  {
> -	return of_platform_device_create_pdata(np, bus_id, NULL, parent);
> +	return of_platform_device_create_pdata(np, bus_id, NULL, parent, false);
>  }
>  EXPORT_SYMBOL(of_platform_device_create);
>  
> @@ -265,7 +300,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  	if (bus_id)
>  		dev_set_name(&dev->dev, "%s", bus_id);
>  	else
> -		of_device_make_bus_id(&dev->dev);
> +		of_device_make_bus_id(&dev->dev, false);
>  
>  	/* setup amba-specific device info */
>  	dev->dma_mask = ~0;
> @@ -342,7 +377,8 @@ static const struct of_dev_auxdata *of_dev_lookup(const struct of_dev_auxdata *l
>  static int of_platform_bus_create(struct device_node *bus,
>  				  const struct of_device_id *matches,
>  				  const struct of_dev_auxdata *lookup,
> -				  struct device *parent, bool strict)
> +				  struct device *parent, bool strict,
> +				  bool enumerated)
>  {
>  	const struct of_dev_auxdata *auxdata;
>  	struct device_node *child;
> @@ -369,13 +405,17 @@ static int of_platform_bus_create(struct device_node *bus,
>  		return 0;
>  	}
>  
> -	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
> +	dev = of_platform_device_create_pdata(bus, bus_id, platform_data,
> +					      parent, enumerated);
>  	if (!dev || !of_match_node(matches, bus))
>  		return 0;
>  
> +	enumerated = of_device_is_compatible(bus, "enumerated-bus");
> +
>  	for_each_child_of_node(bus, child) {
>  		pr_debug("   create child: %s\n", child->full_name);
> -		rc = of_platform_bus_create(child, matches, lookup, &dev->dev, strict);
> +		rc = of_platform_bus_create(child, matches, lookup, &dev->dev,
> +					    strict, enumerated);
>  		if (rc) {
>  			of_node_put(child);
>  			break;
> @@ -409,11 +449,13 @@ int of_platform_bus_probe(struct device_node *root,
>  
>  	/* Do a self check of bus type, if there's a match, create children */
>  	if (of_match_node(matches, root)) {
> -		rc = of_platform_bus_create(root, matches, NULL, parent, false);
> +		rc = of_platform_bus_create(root, matches, NULL, parent, false,
> +					    false);
>  	} else for_each_child_of_node(root, child) {
>  		if (!of_match_node(matches, child))
>  			continue;
> -		rc = of_platform_bus_create(child, matches, NULL, parent, false);
> +		rc = of_platform_bus_create(child, matches, NULL, parent, false,
> +					    false);
>  		if (rc)
>  			break;
>  	}
> @@ -454,7 +496,8 @@ int of_platform_populate(struct device_node *root,
>  		return -EINVAL;
>  
>  	for_each_child_of_node(root, child) {
> -		rc = of_platform_bus_create(child, matches, lookup, parent, true);
> +		rc = of_platform_bus_create(child, matches, lookup, parent,
> +					    true, false);
>  		if (rc)
>  			break;
>  	}
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index 901b743..630972e 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -12,7 +12,7 @@ struct device;
>  
>  extern const struct of_device_id *of_match_device(
>  	const struct of_device_id *matches, const struct device *dev);
> -extern void of_device_make_bus_id(struct device *dev);
> +extern void of_device_make_bus_id(struct device *dev, bool enumerated);
>  
>  /**
>   * of_driver_match_device - Tell if a driver's of_match_table matches a device.
> 
