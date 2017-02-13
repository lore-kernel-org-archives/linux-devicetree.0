From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: wm831x: Add basic device tree binding
Date: Mon, 13 Feb 2017 09:16:03 +0000
Message-ID: <20170213091603.njdtz43mllwpu6qc@dell>
References: <1486734800-10141-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486734800-10141-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 10 Feb 2017, Charles Keepax wrote:

> Add the basic ability to register the device through device tree, more
> work is needed to get each individual sub-driver functioning correctly
> but this is enough to get the device to probe from device tree.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  MAINTAINERS                     |  1 +

Irrelevant change.

Either submit it with patch that introduces the file or on its own.

>  drivers/mfd/wm831x-core.c       | 32 +++++++++++++++++++++++++++++++-
>  drivers/mfd/wm831x-i2c.c        |  9 ++++++++-
>  drivers/mfd/wm831x-irq.c        |  6 +++---
>  drivers/mfd/wm831x-spi.c        |  6 +++++-
>  include/linux/mfd/wm831x/core.h | 15 +++++++++++++++
>  6 files changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2d8ca28..48fdc82 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13363,6 +13363,7 @@ F:	Documentation/hwmon/wm83??
>  F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>  F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
>  F:	Documentation/devicetree/bindings/mfd/arizona.txt
> +F:	Documentation/devicetree/bindings/mfd/wm831x.txt
>  F:	arch/arm/mach-s3c64xx/mach-crag6410*
>  F:	drivers/clk/clk-wm83*.c
>  F:	drivers/extcon/extcon-arizona.c
> diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
> index 3e0e99e..57ff456 100644
> --- a/drivers/mfd/wm831x-core.c
> +++ b/drivers/mfd/wm831x-core.c
> @@ -19,6 +19,8 @@
>  #include <linux/mfd/core.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  
>  #include <linux/mfd/wm831x/core.h>
>  #include <linux/mfd/wm831x/pdata.h>
> @@ -1613,6 +1615,31 @@ struct regmap_config wm831x_regmap_config = {
>  };
>  EXPORT_SYMBOL_GPL(wm831x_regmap_config);
>  
> +#ifdef CONFIG_OF
> +const struct of_device_id wm831x_of_match[] = {
> +	{ .compatible = "wlf,wm8310", .data = (void *)WM8310 },
> +	{ .compatible = "wlf,wm8311", .data = (void *)WM8311 },
> +	{ .compatible = "wlf,wm8312", .data = (void *)WM8312 },
> +	{ .compatible = "wlf,wm8320", .data = (void *)WM8320 },
> +	{ .compatible = "wlf,wm8321", .data = (void *)WM8321 },
> +	{ .compatible = "wlf,wm8325", .data = (void *)WM8325 },
> +	{ .compatible = "wlf,wm8326", .data = (void *)WM8326 },
> +	{ },
> +};
> +EXPORT_SYMBOL_GPL(wm831x_of_match);
> +
> +int wm831x_of_get_type(struct device *dev)
> +{
> +	const struct of_device_id *id = of_match_device(wm831x_of_match, dev);
> +
> +	if (id)
> +		return (int)id->data;

I've seen a warning about this.

Please fix.

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
