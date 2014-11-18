From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] of/platform: Move platform devices under
 /sys/devices/platform
Date: Tue, 18 Nov 2014 11:36:19 +0100
Message-ID: <546B2123.7060406@samsung.com>
References: <1415097920-30014-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1415097920-30014-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/04/2014 11:45 AM, Grant Likely wrote:
> Currently the devices created by drivers/of/platform.c get created at
> the root of /sys/devices. This goes against the typical pattern for
> sysfs where the top level /sys/devices structure contains categories of
> devices, and the structure of devices is placed below that. To fix this,
> make the code in drivers/of/platform.c follow the drivers/base/platform.c
> behaviour, and use &platform_bus as the default parent for all new
> platform_devices and amba_devices.
> 
> This change has been discussed for a long time, but nobody has actually
> acted on it. Userspace code that expects to find devices under a fixed
> /sys/devices/... path will be affected. It isn't /supposed/ to do that,
> but if anyone complains then I'll add a default-off workaround option to
> put them back into the root.

One of side effects of this change is that platform drivers registering
other platform drivers or devices in their probe callback can deadlock
due to double device_lock on platform device. This is for example case
of exynos_drm driver[1]. I guess it could/should be fixed in exynos_drm.
Anyway it can affect other drivers as well. At least grep shows few
possible candidates:

$ git grep -p platform_driver_register | grep -A1 -P '_probe\(struct
platform_device'

drivers/gpu/drm/exynos/exynos_drm_drv.c=static int
exynos_drm_platform_probe(struct platform_device *pdev)
drivers/gpu/drm/exynos/exynos_drm_drv.c:	ret =
platform_driver_register(&fimd_driver);
--
drivers/gpu/drm/sti/sti_drm_drv.c=static int
sti_drm_platform_probe(struct platform_device *pdev)
drivers/gpu/drm/sti/sti_drm_drv.c:
platform_driver_register(&sti_drm_master_driver);
--
drivers/mtd/nand/atmel_nand.c=static int atmel_nand_probe(struct
platform_device *pdev)
drivers/mtd/nand/atmel_nand.c:	res =
platform_driver_register(&atmel_nand_nfc_driver);


[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/117727

Regards
Andrzej


> 
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> ---
>  drivers/of/platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 3b64d0bf5bba..7c6771986c06 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -138,7 +138,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  	}
>  
>  	dev->dev.of_node = of_node_get(np);
> -	dev->dev.parent = parent;
> +	dev->dev.parent = parent ? : &platform_bus;
>  
>  	if (bus_id)
>  		dev_set_name(&dev->dev, "%s", bus_id);
> @@ -291,7 +291,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  
>  	/* setup generic device info */
>  	dev->dev.of_node = of_node_get(node);
> -	dev->dev.parent = parent;
> +	dev->dev.parent = parent ? : &platform_bus;
>  	dev->dev.platform_data = platform_data;
>  	if (bus_id)
>  		dev_set_name(&dev->dev, "%s", bus_id);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
