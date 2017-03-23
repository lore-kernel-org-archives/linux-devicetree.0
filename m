From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 2/3] gpio: wm831x: Add basic device tree support
Date: Thu, 23 Mar 2017 11:47:27 +0000
Message-ID: <20170323114727.g7huthlsuh7tplxk@dell>
References: <1489745120-2918-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1489745120-2918-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489745120-2918-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 17 Mar 2017, Charles Keepax wrote:

> Now the wm831x-core has basic DT support we can update this driver to
> allow use of the GPIOs within a device tree system.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> 
> No changes since v4, still should go through Lee's tree.
> 
> Thanks,
> Charles
> 
>  drivers/gpio/gpio-wm831x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
> index 00e3839..938bbe3 100644
> --- a/drivers/gpio/gpio-wm831x.c
> +++ b/drivers/gpio/gpio-wm831x.c
> @@ -263,7 +263,7 @@ static const struct gpio_chip template_chip = {
>  static int wm831x_gpio_probe(struct platform_device *pdev)
>  {
>  	struct wm831x *wm831x = dev_get_drvdata(pdev->dev.parent);
> -	struct wm831x_pdata *pdata = dev_get_platdata(wm831x->dev);
> +	struct wm831x_pdata *pdata = &wm831x->pdata;
>  	struct wm831x_gpio *wm831x_gpio;
>  	int ret;
>  
> @@ -280,6 +280,9 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
>  		wm831x_gpio->gpio_chip.base = pdata->gpio_base;
>  	else
>  		wm831x_gpio->gpio_chip.base = -1;
> +#ifdef CONFIG_OF_GPIO
> +	wm831x_gpio->gpio_chip.of_node = wm831x->dev->of_node;
> +#endif
>  
>  	ret = devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip,
>  				     wm831x_gpio);

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
