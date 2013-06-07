From: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure resolve
 at platform_drv_probe
Date: Fri, 07 Jun 2013 15:41:15 +0200
Message-ID: <51B1E2FB.3070708@nsn.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On 05/28/2013 05:08 PM, ext Jean-Christophe PLAGNIOL-VILLARD wrote:
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -131,6 +131,32 @@ void of_device_make_bus_id(struct device *dev)
>  }
>  
>  /**
> + * of_device_alloc_irq - initialize irq of an platfrom_device
      ^^^^^^^^^^^^^^^^^^^
> + * @dev: plaform_device to work on
> + */
> +int of_device_init_irq(struct platform_device *dev)
       ^^^^^^^^^^^^^^^^^^

I think, mismatch in function names in the comment and function itself wasn't yet reported...

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

I was trying to get attention to this problem already on the list in January-February time frame, but
without success... I will give your code a try... We have exactly these chained interrupt controllers dependencies
and irq_create_of_mapping() was failing... I'll inform you on the test results...

-- 
Best regards,
Alexander Sverdlin.
