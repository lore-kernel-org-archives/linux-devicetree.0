From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] devres: Add devm_of_iomap()
Date: Fri, 22 Jun 2018 14:13:15 +1000
Message-ID: <5a28adfe74dcea35d704d98e54b2bbb72bcd6b8f.camel@kernel.crashing.org>
References: <acf43685e55ff104ed3bf59d91264fdeec029cf2.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <acf43685e55ff104ed3bf59d91264fdeec029cf2.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-06-14 at 13:31 +1000, Benjamin Herrenschmidt wrote:
> There are still quite a few cases where a device might want
> to get to a different node of the device-tree, obtain the
> resources and map them.
> 
> This is generally open coded in drivers which is quite error prone
> 
> We have of_iomap() and of_io_request_and_map() but they both
> have shortcomings, such as not returning the size of the
> resource found (which can be useful) and not being "managed".
> 
> This adds a devm_of_iomap() that provides all of these and
> should probably replace uses of the above in most drivers.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Greg, which tree should this go through ? Rob, ack pls ? :-)

I have dependencies on this coming up... I can put it in the FSI tree
if you want, it will be part of my next pull request.

Cheers,
Ben.


>  include/linux/device.h |  4 ++++
>  lib/devres.c           | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index beabdbc08420..1529775ecb36 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -686,6 +686,10 @@ extern void devm_free_pages(struct device *dev, unsigned long addr);
>  
>  void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res);
>  
> +void __iomem *devm_of_iomap(struct device *dev,
> +			    struct device_node *node, int index,
> +			    resource_size_t *size);
> +
>  /* allows to add/remove a custom action to devres stack */
>  int devm_add_action(struct device *dev, void (*action)(void *), void *data);
>  void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
> diff --git a/lib/devres.c b/lib/devres.c
> index 78eca713b1d9..e320f80c1c4e 100644
> --- a/lib/devres.c
> +++ b/lib/devres.c
> @@ -3,6 +3,7 @@
>  #include <linux/io.h>
>  #include <linux/gfp.h>
>  #include <linux/export.h>
> +#include <linux/of_address.h>
>  
>  void devm_ioremap_release(struct device *dev, void *res)
>  {
> @@ -163,6 +164,41 @@ void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res)
>  }
>  EXPORT_SYMBOL(devm_ioremap_resource);
>  
> +/*
> + * devm_of_iomap - Requests a resource and maps the memory mapped IO
> + *		   for a given device_node managed by a given device
> + *
> + * Checks that a resource is a valid memory region, requests the memory
> + * region and ioremaps it. All operations are managed and will be undone
> + * on driver detach of the device.
> + *
> + * This is to be used when a device requests/maps resources described
> + * by other device tree nodes (children or otherwise).
> + *
> + * @dev:	The device "managing" the resource
> + * @node:       The device-tree node where the resource resides
> + * @index:	index of the MMIO range in the "reg" property
> + * @size:	Returns the size of the resource (pass NULL if not needed)
> + * Returns a pointer to the requested and mapped memory or an ERR_PTR() encoded
> + * error code on failure. Usage example:
> + *
> + *	base = devm_of_iomap(&pdev->dev, node, 0, NULL);
> + *	if (IS_ERR(base))
> + *		return PTR_ERR(base);
> + */
> +void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int index,
> +			    resource_size_t *size)
> +{
> +	struct resource res;
> +
> +	if (of_address_to_resource(node, index, &res))
> +		return IOMEM_ERR_PTR(-EINVAL);
> +	if (size)
> +		*size = resource_size(&res);
> +	return devm_ioremap_resource(dev, &res);
> +}
> +EXPORT_SYMBOL(devm_of_iomap);
> +
>  #ifdef CONFIG_HAS_IOPORT_MAP
>  /*
>   * Generic iomap devres
