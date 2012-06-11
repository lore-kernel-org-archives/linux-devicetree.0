From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V3 5/6] Avoid duplicate probe for of platform devices
Date: Mon, 11 Jun 2012 10:33:05 -0500
Message-ID: <4FD60FB1.7050106@gmail.com>
References: <1339148585-16947-1-git-send-email-B38951@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339148585-16947-1-git-send-email-B38951@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jia Hongtao <B38951@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>
List-Id: devicetree@vger.kernel.org

[adding lkml and Greg KH]

On 06/08/2012 04:43 AM, Jia Hongtao wrote:
> We changed the pcie controller driver to platform driver so that the PCI
> of platform devices need to be created earlier in the arch_initcall stage
> according to the original timing of calling fsl_add_bridge(). So we do PCI
> probing separately from other devices. But probing more than once could
> cause duplication warning. We add check if the devices have already probed
> before probing any devices to avoid duplication warning.
> 
> Signed-off-by: Jia Hongtao <B38951@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>
> ---

Where's v1 and v2 history?

>  drivers/of/platform.c |   18 ++++++++++++------
>  1 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index a37330e..3aab01f 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -139,6 +139,18 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  	if (!dev)
>  		return NULL;
>  
> +	dev->dev.of_node = of_node_get(np);
> +	if (bus_id)
> +		dev_set_name(&dev->dev, "%s", bus_id);
> +	else
> +		of_device_make_bus_id(&dev->dev);
> +
> +	if (kset_find_obj(dev->dev.kobj.kset, kobject_name(&dev->dev.kobj))) {

Is this a fast operation? I worry that we'd be doing this for every
device creation. Looking at kobj's seems too low level as well.

Perhaps moving the warning up the call stack and making the relevant
functions __must_check would work.

Rob

> +		kfree(dev);
> +		of_node_put(np);
> +		return NULL;
> +	}
> +
>  	/* count the io and irq resources */
>  	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
>  		num_reg++;
> @@ -161,17 +173,11 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  		WARN_ON(of_irq_to_resource_table(np, res, num_irq) != num_irq);
>  	}
>  
> -	dev->dev.of_node = of_node_get(np);
>  #if defined(CONFIG_MICROBLAZE)
>  	dev->dev.dma_mask = &dev->archdata.dma_mask;
>  #endif
>  	dev->dev.parent = parent;
>  
> -	if (bus_id)
> -		dev_set_name(&dev->dev, "%s", bus_id);
> -	else
> -		of_device_make_bus_id(&dev->dev);
> -
>  	return dev;
>  }
>  EXPORT_SYMBOL(of_device_alloc);
