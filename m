From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure resolve
 at platform_drv_probe
Date: Wed, 29 May 2013 23:48:14 +0100
Message-ID: <20130529224814.3F8F53E16F4@localhost>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <1369753729-12997-1-git-send-email-plagnioj@jcrosoft.com>
 <1369753729-12997-3-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369753729-12997-3-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 28 May 2013 17:08:49 +0200, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> Today in the current of implementation we populate all the ressources
> at of_platform_populate time. But this leed to a chicken-egg dilemat
> some the irq present in DT are from platform_device too. And you can
> not resolve them as of_platform_populate. So delay the populate of irq
> at platform_drv_probe.
> 
> And if the irq_domain is not yet present just defer the probe (GPIO as example)

Hi Jean-Christophe,

Thanks for looking at this.

Hmmm, this is an interesting idea. I had been thinking about taping into
the platform_get_irq() call to lookup irq numbers at probe time, but
that assumes that all platform drivers use that call (which they clearly
do not). This approach should work for all drivers as is.

However care needs to be taken to not waste too much time processing
irqs every time probe is called. Mapping irqs over and over will get
expensive, especially with the current code. It would be better to
rework the mapping function to iterate once over the interrupts property
and map all the IRQs at once instead of calling of_irq_to_resource()
over and over again. (I would however accept the argument that this is a
bug fix and the refactoring should be a separate patch)

> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/base/platform.c     |    5 +++++
>  drivers/of/platform.c       |   29 +++++++++++++++++++++++++++--
>  include/linux/of_platform.h |    7 +++++++
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 9eda842..c0f7906 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -13,6 +13,7 @@
>  #include <linux/string.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/dma-mapping.h>
> @@ -484,6 +485,10 @@ static int platform_drv_probe(struct device *_dev)
>  	struct platform_device *dev = to_platform_device(_dev);
>  	int ret;
>  
> +	ret = of_device_init_irq(dev);
> +	if (ret)
> +		return ret;
> +
>  	if (ACPI_HANDLE(_dev))
>  		acpi_dev_pm_attach(_dev, true);
>  
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 00a0971..c290943 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -131,6 +131,32 @@ void of_device_make_bus_id(struct device *dev)
>  }
>  
>  /**
> + * of_device_alloc_irq - initialize irq of an platfrom_device
> + * @dev: plaform_device to work on
> + */
> +int of_device_init_irq(struct platform_device *dev)
> +{
> +	struct device_node *np = dev->dev.of_node;
> +	int num_irq;
> +	int ret;
> +	struct resource *res = dev->resource;
> +
> +	if (!np)
> +		return 0;
> +
> +	num_irq = of_irq_count(np);
> +	if (!num_irq)
> +		return 0;
> +
> +	res += dev->num_resources - num_irq;

This is a little fragile. Instead of statically calculating the offset,
scan the table and make *absolutely* sure that there is a free block of
irq resources.

Also, if the table has already been populated successfully, then that
should be checked for. That would prevent the same table from being
parsed over and over in the case of a device that keeps getting
deferred.

Finally, if it fails, make sure any entries that have been filled in get
cleared out again before exiting.

Cheers,
g.

> +	ret = of_irq_to_resource_table(np, res, num_irq);
> +	if (ret != num_irq)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
> +/**
>   * of_device_alloc - Allocate and initialize an of_device
>   * @np: device node to assign to device
>   * @bus_id: Name to assign to the device.  May be null to use default name.
> @@ -152,7 +178,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  	if (of_can_translate_address(np))
>  		while (of_address_to_resource(np, num_reg, &temp_res) == 0)
>  			num_reg++;
> -	num_irq = of_irq_valid_count(np);
> +	num_irq = of_irq_count(np);
>  
>  	/* Populate the resource table */
>  	if (num_irq || num_reg) {
> @@ -168,7 +194,6 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  			rc = of_address_to_resource(np, i, res);
>  			WARN_ON(rc);
>  		}
> -		WARN_ON(of_irq_to_resource_table(np, res, num_irq) != num_irq);
>  	}
>  
>  	dev->dev.of_node = of_node_get(np);
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index 3863a4d..b5f9bb6 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -79,6 +79,7 @@ extern const struct of_device_id of_default_bus_match_table[];
>  extern struct platform_device *of_device_alloc(struct device_node *np,
>  					 const char *bus_id,
>  					 struct device *parent);
> +extern int of_device_init_irq(struct platform_device *dev);
>  extern struct platform_device *of_find_device_by_node(struct device_node *np);
>  
>  #ifdef CONFIG_OF_ADDRESS /* device reg helpers depend on OF_ADDRESS */
> @@ -101,6 +102,7 @@ extern int of_platform_populate(struct device_node *root,
>  #if !defined(CONFIG_OF_ADDRESS)
>  struct of_dev_auxdata;
>  struct device;
> +struct platform_device;
>  static inline int of_platform_populate(struct device_node *root,
>  					const struct of_device_id *matches,
>  					const struct of_dev_auxdata *lookup,
> @@ -108,6 +110,11 @@ static inline int of_platform_populate(struct device_node *root,
>  {
>  	return -ENODEV;
>  }
> +
> +static inline int of_device_init_irq(struct platform_device *dev)
> +{
> +	return 0;
> +}
>  #endif /* !CONFIG_OF_ADDRESS */
>  
>  #endif	/* _LINUX_OF_PLATFORM_H */
> -- 
> 1.7.10.4
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
