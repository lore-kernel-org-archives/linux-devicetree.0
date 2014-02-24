From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH RFC v8 5/5] dma: mpc512x: register for device tree
 channel lookup
Date: Mon, 24 Feb 2014 15:08:15 +0200
Message-ID: <1393247295.28803.10.camel@smile.fi.intel.com>
References: <1393240172-18769-1-git-send-email-a13xp0p0v88@gmail.com>
	 <1393240172-18769-6-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393240172-18769-6-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-02-24 at 15:09 +0400, Alexander Popov wrote:
> From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> 
> register the controller for device tree based lookup of DMA channels
> (non-fatal for backwards compatibility with older device trees) and
> provide the '#dma-cells' property in the shared mpc5121.dtsi file
> 
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> [ a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: resolve little patch conflict and put
>   MPC512x DMA controller bindings document to a separate patch ]
> ---
>  arch/powerpc/boot/dts/mpc5121.dtsi |  1 +
>  drivers/dma/mpc512x_dma.c          | 21 ++++++++++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
> index 2c0e155..7f9d14f 100644
> --- a/arch/powerpc/boot/dts/mpc5121.dtsi
> +++ b/arch/powerpc/boot/dts/mpc5121.dtsi
> @@ -498,6 +498,7 @@
>  			compatible = "fsl,mpc5121-dma";
>  			reg = <0x14000 0x1800>;
>  			interrupts = <65 0x8>;
> +			#dma-cells = <1>;
>  		};
>  	};
>  
> diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
> index 8f504cb..d9f8740 100644
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
> @@ -52,6 +52,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> +#include <linux/of_dma.h>
>  #include <linux/of_platform.h>
>  
>  #include <linux/random.h>
> @@ -1018,11 +1019,23 @@ static int mpc_dma_probe(struct platform_device *op)
>  	/* Register DMA engine */
>  	dev_set_drvdata(dev, mdma);
>  	retval = dma_async_device_register(dma);
> -	if (retval) {
> -		devm_free_irq(dev, mdma->irq, mdma);
> -		irq_dispose_mapping(mdma->irq);
> +	if (retval)
> +		goto out_irq;
> +
> +	/* register with OF helpers for DMA lookups (nonfatal) */
> +	if (dev->of_node) {
> +		retval = of_dma_controller_register(dev->of_node,
> +						    of_dma_xlate_by_chan_id,
> +						    mdma);
> +		if (retval)
> +			dev_warn(dev, "could not register for OF lookup\n");
>  	}
>  
> +	return 0;
> +
> +out_irq:
> +	devm_free_irq(dev, mdma->irq, mdma);

Something wrong either with devm_request_irq() or you don't need to call
devm_free_irq() explicitly. Once we already try to discuss this earlier
in this mailing list with Lars-Peter(?), though there were no solution
how to keep devm_*_irq usability.

> +	irq_dispose_mapping(mdma->irq);
>  	return retval;
>  }
>  
> @@ -1031,6 +1044,8 @@ static int mpc_dma_remove(struct platform_device *op)
>  	struct device *dev = &op->dev;
>  	struct mpc_dma *mdma = dev_get_drvdata(dev);
>  
> +	if (dev->of_node)
> +		of_dma_controller_free(dev->of_node);
>  	dma_async_device_unregister(&mdma->dma);
>  	devm_free_irq(dev, mdma->irq, mdma);
>  	irq_dispose_mapping(mdma->irq);


-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
