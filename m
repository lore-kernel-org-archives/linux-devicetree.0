From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/17] of: add dma-mask binding
Date: Tue, 13 Nov 2012 21:55:56 -0600
Message-ID: <50A3164C.3070301@gmail.com>
References: <1352710357-3265-1-git-send-email-wenyou.yang@atmel.com>
 <1352710357-3265-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352710357-3265-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
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
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: JM.Lin-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/12/2012 02:52 AM, Wenyou Yang wrote:
> From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> 
> This will allow each device to specify its dma-mask for this we use the
> coherent_dma_mask as pointer. By default the dma-mask will be set to
> DMA_BIT_MASK(32).

Do you really have a use case this is not DMA_BIT_MASK(32)?

> The microblaze architecture hook is drop
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
>  drivers/of/platform.c |   23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b80891b..31ed405 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -130,6 +130,21 @@ void of_device_make_bus_id(struct device *dev)
>  	dev_set_name(dev, "%s.%d", node->name, magic - 1);
>  }
>  
> +static void of_get_dma_mask(struct device *dev, struct device_node *np)
> +{
> +	const __be32 *prop;
> +	int len;
> +
> +	prop = of_get_property(np, "dma-mask", &len);

dma-ranges may work for this purpose.

> +
> +	dev->dma_mask = &dev->coherent_dma_mask;

I don't really know, but I suspect this is wrong.

> +
> +	if (!prop)
> +		dev->coherent_dma_mask = DMA_BIT_MASK(32);
> +	else
> +		dev->coherent_dma_mask = of_read_number(prop, len / 4);
> +}
> +
>  /**
>   * of_device_alloc - Allocate and initialize an of_device
>   * @np: device node to assign to device
> @@ -171,10 +186,8 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  		WARN_ON(of_irq_to_resource_table(np, res, num_irq) != num_irq);
>  	}
>  
> +	of_get_dma_mask(&dev->dev, np);
>  	dev->dev.of_node = of_node_get(np);
> -#if defined(CONFIG_MICROBLAZE)
> -	dev->dev.dma_mask = &dev->archdata.dma_mask;
> -#endif
>  	dev->dev.parent = parent;
>  
>  	if (bus_id)
> @@ -211,10 +224,6 @@ struct platform_device *of_platform_device_create_pdata(
>  	if (!dev)
>  		return NULL;
>  
> -#if defined(CONFIG_MICROBLAZE)
> -	dev->archdata.dma_mask = 0xffffffffUL;
> -#endif
> -	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>  	dev->dev.bus = &platform_bus_type;
>  	dev->dev.platform_data = platform_data;
>  
> 
