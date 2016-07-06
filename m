From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v10 2/4] power: reset: add reboot mode driver
Date: Wed, 06 Jul 2016 15:40:47 +0200
Message-ID: <577D0A5F.8060907@samsung.com>
References: <1467811081-20700-1-git-send-email-andy.yan@rock-chips.com>
 <1467811646-20823-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1467811646-20823-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2016 03:27 PM, Andy Yan wrote:
> This driver parses the reboot commands like "reboot bootloader"
> and "reboot recovery" to get a boot mode described in the
> device tree , then call the write interfae to store the boot
> mode in some place like special register or sram, which can
> be read by the bootloader after system reboot, then the bootloader
> can take different action according to the mode stored.
> 
> This is commonly used on Android based devices, in order to
> reboot the device into fastboot or recovery mode.
> 
> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> Tested-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>


Argh, I responded to old email so again here:

One minor whitespace issue at the end but beside that:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

(...)

> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
> new file mode 100644
> index 0000000..22e0685
> --- /dev/null
> +++ b/drivers/power/reset/syscon-reboot-mode.c
> @@ -0,0 +1,100 @@
> +/*
> + * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include "reboot-mode.h"
> +
> +struct syscon_reboot_mode {
> +	struct regmap *map;
> +	struct reboot_mode_driver reboot;
> +	u32 offset;
> +	u32 mask;
> +};
> +
> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
> +				    unsigned int magic)
> +{
> +	struct syscon_reboot_mode *syscon_rbm;
> +	int ret;
> +
> +	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
> +
> +	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> +				 syscon_rbm->mask, magic);
> +	if (ret < 0)
> +		dev_err(reboot->dev, "update reboot mode bits failed\n");
> +
> +	return ret;
> +}
> +
> +static int syscon_reboot_mode_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct syscon_reboot_mode *syscon_rbm;
> +
> +	syscon_rbm = devm_kzalloc(&pdev->dev, sizeof(*syscon_rbm), GFP_KERNEL);
> +	if (!syscon_rbm)
> +		return -ENOMEM;
> +
> +	syscon_rbm->reboot.dev = &pdev->dev;
> +	syscon_rbm->reboot.write = syscon_reboot_mode_write;
> +	syscon_rbm->mask = 0xffffffff;
> +
> +	dev_set_drvdata(&pdev->dev, syscon_rbm);
> +
> +	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(syscon_rbm->map))
> +		return PTR_ERR(syscon_rbm->map);
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "offset",
> +	    &syscon_rbm->offset))
> +		return -EINVAL;
> +
> +	of_property_read_u32(pdev->dev.of_node, "mask", &syscon_rbm->mask);
> +
> +

Just one new line.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
