From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/2] gpio: xilinx: Add clock support
Date: Tue, 8 Nov 2016 06:52:31 -0800
Message-ID: <20161108145231.GR14444@xsjsorenbubuntu>
References: <1478581990-28276-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1478581990-28276-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478581990-28276-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, michal.simek@xilinx.com
List-Id: devicetree@vger.kernel.org

On Tue, 2016-11-08 at 10:43:10 +0530, Shubhrajyoti Datta wrote:
> Add basic clock support for xilinx gpio.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
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
> +	if (IS_ERR(chip->clk)) {
> +		if (PTR_ERR(chip->clk) == -ENOENT) {
> +			dev_info(&pdev->dev, "No clocks found for clk\n");
> +			chip->clk = NULL;
> +		} else {
> +			dev_err(&pdev->dev, "axi clock error\n");
> +			return PTR_ERR(chip->clk);
> +		}
> +	}

In the bindings you document 'clocks' as required, but it's handled as
optional here. Things should be consistent and given that the existing
binding doesn't require clocks, we're probably stuck with having the
clock optional.

	Sören
