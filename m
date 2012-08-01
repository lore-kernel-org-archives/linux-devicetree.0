From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: Allow busses with #size-cells=0
Date: Wed, 01 Aug 2012 14:40:37 -0600
Message-ID: <50199445.6090101@wwwdotorg.org>
References: <1343259277-19037-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1343259277-19037-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/25/2012 05:34 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> It's quite legitimate for a DT node to specify #size-cells=0. One example
> is a node that's used to collect a number of non-memory-mapped devices.
> In that scenario, there may be multiple child nodes with the same name
> (type) thus necessitating the use of unit addresses in node names, and
> reg properties:

Does anyone have any comment on this patch?

> / {
> 	regulators {
> 		compatible = "simple-bus";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		regulator@0 {
> 			compatible = "regulator-fixed";
> 			reg = <0>;
> 			...
> 		};
> 
> 		regulator@1 {
> 			compatible = "regulator-fixed";
> 			reg = <1>;
> 			...
> 		};
> 
> 		...
> 	};
> };
> 
> However, #size-cells=0 prevents translation of reg property values into
> the parent node's address space. In turn, this triggers the kernel to
> emit error messages during boot, such as:
> 
>     prom_parse: Bad cell count for /regulators/regulator@0
> 
> To prevent printing these error messages for legitimate DT content, a
> number of changes are made:
> 
> 1) of_get_address()/of_get_pci_address() are modified only to validate
>    the value of #address-cells, and not #size-cells.
> 
> 2) of_can_translate_address() is added to indicate whether address
>    translation is possible.
> 
> 3) of_device_make_bus_id() is modified to name devices based on the
>    translated address only where possible, and otherwise fall back to
>    using the (first cell of the) raw untranslated address.
> 
> 4) of_device_alloc() is modified to create memory resources for a device
>    only if the address can be translated into the CPU's address space.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/address.c       |   27 +++++++++++++++++++++++----
>  drivers/of/platform.c      |   16 +++++++++++++---
>  include/linux/of_address.h |    1 +
>  3 files changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 7e262a6..7a07751 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -9,8 +9,8 @@
>  
>  /* Max address size we deal with */
>  #define OF_MAX_ADDR_CELLS	4
> -#define OF_CHECK_COUNTS(na, ns)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS && \
> -			(ns) > 0)
> +#define OF_CHECK_ADDR_COUNT(na)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
> +#define OF_CHECK_COUNTS(na, ns)	(OF_CHECK_ADDR_COUNT(na) && (ns) > 0)
>  
>  static struct of_bus *of_match_bus(struct device_node *np);
>  static int __of_address_to_resource(struct device_node *dev,
> @@ -182,7 +182,7 @@ const __be32 *of_get_pci_address(struct device_node *dev, int bar_no, u64 *size,
>  	}
>  	bus->count_cells(dev, &na, &ns);
>  	of_node_put(parent);
> -	if (!OF_CHECK_COUNTS(na, ns))
> +	if (!OF_CHECK_ADDR_COUNT(na))
>  		return NULL;
>  
>  	/* Get "reg" or "assigned-addresses" property */
> @@ -490,6 +490,25 @@ u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
>  }
>  EXPORT_SYMBOL(of_translate_dma_address);
>  
> +bool of_can_translate_address(struct device_node *dev)
> +{
> +	struct device_node *parent;
> +	struct of_bus *bus;
> +	int na, ns;
> +
> +	parent = of_get_parent(dev);
> +	if (parent == NULL)
> +		return false;
> +
> +	bus = of_match_bus(parent);
> +	bus->count_cells(dev, &na, &ns);
> +
> +	of_node_put(parent);
> +
> +	return OF_CHECK_COUNTS(na, ns);
> +}
> +EXPORT_SYMBOL(of_can_translate_address);
> +
>  const __be32 *of_get_address(struct device_node *dev, int index, u64 *size,
>  		    unsigned int *flags)
>  {
> @@ -506,7 +525,7 @@ const __be32 *of_get_address(struct device_node *dev, int index, u64 *size,
>  	bus = of_match_bus(parent);
>  	bus->count_cells(dev, &na, &ns);
>  	of_node_put(parent);
> -	if (!OF_CHECK_COUNTS(na, ns))
> +	if (!OF_CHECK_ADDR_COUNT(na))
>  		return NULL;
>  
>  	/* Get "reg" or "assigned-addresses" property */
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index e44f8c2..9bdeaf3 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -78,6 +78,7 @@ void of_device_make_bus_id(struct device *dev)
>  	struct device_node *node = dev->of_node;
>  	const u32 *reg;
>  	u64 addr;
> +	const __be32 *addrp;
>  	int magic;
>  
>  #ifdef CONFIG_PPC_DCR
> @@ -105,7 +106,15 @@ void of_device_make_bus_id(struct device *dev)
>  	 */
>  	reg = of_get_property(node, "reg", NULL);
>  	if (reg) {
> -		addr = of_translate_address(node, reg);
> +		if (of_can_translate_address(node)) {
> +			addr = of_translate_address(node, reg);
> +		} else {
> +			addrp = of_get_address(node, 0, NULL, NULL);
> +			if (addrp)
> +				addr = of_read_number(addrp, 1);
> +			else
> +				addr = OF_BAD_ADDR;
> +		}
>  		if (addr != OF_BAD_ADDR) {
>  			dev_set_name(dev, "%llx.%s",
>  				     (unsigned long long)addr, node->name);
> @@ -140,8 +149,9 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  		return NULL;
>  
>  	/* count the io and irq resources */
> -	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
> -		num_reg++;
> +	if (of_can_translate_address(np))
> +		while (of_address_to_resource(np, num_reg, &temp_res) == 0)
> +			num_reg++;
>  	num_irq = of_irq_count(np);
>  
>  	/* Populate the resource table */
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 01b925a..c3cdc10 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -6,6 +6,7 @@
>  
>  #ifdef CONFIG_OF_ADDRESS
>  extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
> +extern bool of_can_translate_address(struct device_node *dev);
>  extern int of_address_to_resource(struct device_node *dev, int index,
>  				  struct resource *r);
>  extern struct device_node *of_find_matching_node_by_address(
> 
