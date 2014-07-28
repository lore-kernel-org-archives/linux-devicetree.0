From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/4] drivers: of: initialize and assign
 reserved memory to newly created devices
Date: Mon, 28 Jul 2014 08:17:00 -0600
Message-ID: <20140728141700.55FC4C408EA@trevor.secretlab.ca>
References: <1405326487-15346-1-git-send-email-m.szyprowski@samsung.com>
	<1405326487-15346-3-git-send-email-m.szyprowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405326487-15346-3-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, "Aneesh Kumar K.V." <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Jul 2014 10:28:05 +0200, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Use recently introduced of_reserved_mem_device_init() function to
> automatically assign respective reserved memory region to the newly created
> platform and amba device.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

I'm still not okay with this patch. I don't think it is appropriate to
add the hook into the generic path that gets used for every platform
device. The devices that need reserved memory should explicitly request
it, and any setup be done at that time.

g.

> ---
>  drivers/of/platform.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 500436f9be7f..a9055d3da5c2 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -21,6 +21,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  
>  const struct of_device_id of_default_bus_match_table[] = {
> @@ -233,12 +234,15 @@ static struct platform_device *of_platform_device_create_pdata(
>  	dev->dev.bus = &platform_bus_type;
>  	dev->dev.platform_data = platform_data;
>  
> +	of_reserved_mem_device_init(&dev->dev);
> +
>  	/* We do not fill the DMA ops for platform devices by default.
>  	 * This is currently the responsibility of the platform code
>  	 * to do such, possibly using a device notifier
>  	 */
>  
>  	if (of_device_add(dev) != 0) {
> +		of_reserved_mem_device_release(&dev->dev);
>  		platform_device_put(dev);
>  		goto err_clear_flag;
>  	}
> @@ -300,6 +304,8 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  	else
>  		of_device_make_bus_id(&dev->dev);
>  
> +	of_reserved_mem_device_init(&dev->dev);
> +
>  	/* Allow the HW Peripheral ID to be overridden */
>  	prop = of_get_property(node, "arm,primecell-periphid", NULL);
>  	if (prop)
> @@ -326,6 +332,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  	return dev;
>  
>  err_free:
> +	of_reserved_mem_device_release(&dev->dev);
>  	amba_device_put(dev);
>  err_clear_flag:
>  	of_node_clear_flag(node, OF_POPULATED);
> -- 
> 1.9.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
