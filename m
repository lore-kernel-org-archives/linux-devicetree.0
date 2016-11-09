From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 2/2] gpio: xilinx: Add clock support
Date: Tue, 8 Nov 2016 22:27:34 -0800
Message-ID: <20161109062734.GX14444@xsjsorenbubuntu>
References: <1478668191-26322-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1478668191-26322-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478668191-26322-2-git-send-email-shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-09 at 10:39:51 +0530, Shubhrajyoti Datta wrote:
> Add basic clock support for xilinx gpio.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> v2 :
> no change
> 
>  drivers/gpio/gpio-xilinx.c |   22 ++++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 14b2a62..923cab8 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/init.h>
>  #include <linux/errno.h>
>  #include <linux/module.h>
> @@ -45,6 +46,7 @@
>   * @gpio_state: GPIO state shadow register
>   * @gpio_dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
> + * @clk: Clock resource for this controller
>   */
>  struct xgpio_instance {
>  	struct of_mm_gpio_chip mmchip;
> @@ -52,6 +54,7 @@ struct xgpio_instance {
>  	u32 gpio_state[2];
>  	u32 gpio_dir[2];
>  	spinlock_t gpio_lock[2];
> +	struct clk *clk;
>  };
>  
>  static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
> @@ -282,6 +285,7 @@ static int xgpio_remove(struct platform_device *pdev)
>  	struct xgpio_instance *chip = platform_get_drvdata(pdev);
>  
>  	of_mm_gpiochip_remove(&chip->mmchip);
> +	clk_disable_unprepare(chip->clk);
>  
>  	return 0;
>  }
> @@ -307,6 +311,23 @@ static int xgpio_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, chip);
>  
> +	/* Retrieve GPIO clock */
> +	chip->clk = devm_clk_get(&pdev->dev, NULL);

The driver should use the clock-name documented in the binding to do the
clock lookup.

> +	if (IS_ERR(chip->clk)) {
> +		if (PTR_ERR(chip->clk) == -ENOENT) {
> +			dev_info(&pdev->dev, "No clocks found for clk\n");

This is pretty much just noise. The clocks property is optional. No need
to be too verbose about that. It would be quite a lot of printing if
every driver would report absent optional DT properties.

	Sören
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
