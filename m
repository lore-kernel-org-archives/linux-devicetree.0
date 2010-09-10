From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] x86: of: remove references to NO_IRQ in
	drivers/of/platform.c
Date: Fri, 10 Sep 2010 11:24:31 -0600
Message-ID: <20100910172431.GB11284@angua.secretlab.ca>
References: <20100910060101.26c7e61c@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100910060101.26c7e61c@debxo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitch Bradley <wmb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 10, 2010 at 06:01:01AM -0700, Andres Salomon wrote:
> 
> Instead of referencing NO_IRQ in platform.c, define some helper functions
> in irq.c to call instead from platform.c.  Keep NO_IRQ usage local to
> irq.c, and define NO_IRQ if not defined in headers.
> 
> Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/irq.c       |   39 +++++++++++++++++++++++++++++++++++++++
>  drivers/of/platform.c  |   10 +++-------
>  include/linux/of_irq.h |    3 +++
>  3 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 6e595e5..75b0d3c 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -24,6 +24,11 @@
>  #include <linux/of_irq.h>
>  #include <linux/string.h>
>  
> +/* For archs that don't support NO_IRQ (such as x86), provide a dummy value */
> +#ifndef NO_IRQ
> +#define NO_IRQ 0
> +#endif
> +
>  /**
>   * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
>   * @device: Device node of the device whose interrupt is to be mapped
> @@ -347,3 +352,37 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
>  	return irq;
>  }
>  EXPORT_SYMBOL_GPL(of_irq_to_resource);
> +
> +/**
> + * of_irq_count - Count the number of IRQs a node uses
> + * @dev: pointer to device tree node
> + */
> +int of_irq_count(struct device_node *dev)
> +{
> +	int nr = 0;
> +
> +	while (of_irq_to_resource(dev, nr, NULL) != NO_IRQ)
> +		nr++;
> +
> +	return nr;
> +}
> +
> +/**
> + * of_irq_to_resource_table - Fill in resource table with node's IRQ info
> + * @dev: pointer to device tree node
> + * @res: array of resources to fill in
> + * @nr_irqs: the number of IRQs (and upper bound for num of @res elements)
> + *
> + * Returns the size of the filled in table (up to @nr_irqs).
> + */
> +int of_irq_to_resource_table(struct device_node *dev, struct resource *res,
> +		int nr_irqs)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_irqs; i++, res++)
> +		if (of_irq_to_resource(dev, i, res) == NO_IRQ)
> +			break;
> +
> +	return i;
> +}
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index bb72223..30726c8 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -584,14 +584,13 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  				  struct device *parent)
>  {
>  	struct platform_device *dev;
> -	int rc, i, num_reg = 0, num_irq = 0;
> +	int rc, i, num_reg = 0, num_irq;
>  	struct resource *res, temp_res;
>  
>  	/* First count how many resources are needed */
>  	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
>  		num_reg++;
> -	while (of_irq_to_resource(np, num_irq, &temp_res) != NO_IRQ)
> -		num_irq++;
> +	num_irq = of_irq_count(np);
>  
>  	/* Allocate memory for both the struct device and the resource table */
>  	dev = kzalloc(sizeof(*dev) + (sizeof(*res) * (num_reg + num_irq)),
> @@ -608,10 +607,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  			rc = of_address_to_resource(np, i, res);
>  			WARN_ON(rc);
>  		}
> -		for (i = 0; i < num_irq; i++, res++) {
> -			rc = of_irq_to_resource(np, i, res);
> -			WARN_ON(rc == NO_IRQ);
> -		}
> +		WARN_ON(of_irq_to_resource_table(np, res, num_irq) != num_irq);
>  	}
>  
>  	dev->dev.of_node = of_node_get(np);
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 5929781..090cbaa 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -64,6 +64,9 @@ extern unsigned int irq_create_of_mapping(struct device_node *controller,
>  					  unsigned int intsize);
>  extern int of_irq_to_resource(struct device_node *dev, int index,
>  			      struct resource *r);
> +extern int of_irq_count(struct device_node *dev);
> +extern int of_irq_to_resource_table(struct device_node *dev,
> +		struct resource *res, int nr_irqs);
>  
>  #endif /* CONFIG_OF_IRQ */
>  #endif /* CONFIG_OF */
> -- 
> 1.5.6.5
> 
