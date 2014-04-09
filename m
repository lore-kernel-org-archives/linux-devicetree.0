From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 14/15] mtd: st_spi_fsm: Provide mask to obtain correct
 boot device pins
Date: Wed, 9 Apr 2014 00:11:05 -0700
Message-ID: <20140409071105.GE3131@norris-Latitude-E6410>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
 <1395851969-13520-15-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395851969-13520-15-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, angus.clark-qxv4g6HH51o@public.gmane.org, Christophe Kerello <christophe.kerello-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ DT list

On Wed, Mar 26, 2014 at 04:39:28PM +0000, Lee Jones wrote:
> From: Christophe Kerello <christophe.kerello-qxv4g6HH51o@public.gmane.org>
> 
> This patch adds a mask to be able to get the right boot device selection.
> 
> For example:
>     for STiH415, value = SYSTEM_STATUS398[4:0]
>     for STiH416, value = SYSTEM_STATUS2598[4:0]
>     for STiH407, value = SYSTEM_STATUS5561[6:2]
> 
> Signed-off-by: Christophe Kerello <christophe.kerello-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mtd/devices/st_spi_fsm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> index 9e00173..3ab27c8 100644
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -2159,6 +2159,7 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	uint32_t boot_device_reg;
>  	uint32_t boot_device_spi;
> +	uint32_t boot_device_msk;
>  	uint32_t boot_device;     /* Value we read from *boot_device_reg */
>  	int ret;
>  
> @@ -2183,10 +2184,17 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
>  	if (ret)
>  		goto boot_device_fail;
>  
> +	/* Mask to apply on boot_device_reg */
> +	ret = of_property_read_u32(np, "st,boot-device-msk", &boot_device_msk);

You need to document this binding in Documentation/devicetree/bindings/,
and CC the devicetree list.

> +	if (ret)
> +		goto boot_device_fail;
> +
>  	ret = regmap_read(regmap, boot_device_reg, &boot_device);
>  	if (ret)
>  		goto boot_device_fail;
>  
> +	boot_device &= boot_device_msk;
> +
>  	if (boot_device != boot_device_spi)
>  		fsm->booted_from_spi = false;
>  

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
