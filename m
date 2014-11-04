From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/3] usb: phy: add device-tree support for gpio-vbus
Date: Tue, 4 Nov 2014 09:28:48 +0100
Message-ID: <CA+gwMcc0FUcUvUd-52uM070+ASL-pUZYZ4BUy6=f6OrhKPeH5g@mail.gmail.com>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
	<1414951910-16075-3-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414951910-16075-3-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Sun, Nov 2, 2014 at 7:11 PM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
> Add device-tree support for the generic gpio-vbus driver.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/usb/phy/phy-gpio-vbus-usb.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
> index d302ab2..6194728 100644
> --- a/drivers/usb/phy/phy-gpio-vbus-usb.c
> +++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/module.h>
> +#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/usb.h>
> @@ -254,6 +255,12 @@ static int gpio_vbus_probe(struct platform_device *pdev)
>                 }
>                 gpiod = gpio_to_desc(gpio);
>                 wakeup = pdata->wakeup;
> +       } else {
> +               gpiod = devm_gpiod_get_index(&pdev->dev, NULL, 0, GPIOD_IN);
> +               if (pdev->dev.of_node &&
> +                   of_get_property(pdev->dev.of_node,
> +                                   "wakeup", NULL))
> +                       wakeup = 1;
>         }
>         if (!gpiod)
>                 return -EINVAL;
> @@ -309,6 +316,8 @@ static int gpio_vbus_probe(struct platform_device *pdev)
>                         gpiod = gpio_to_desc(gpio);
>                         gpiod_direction_output(gpiod, 0);
>                 }
> +       } else {
> +               gpiod = devm_gpiod_get_index(&pdev->dev, NULL, 1, 0);

The pdata path has gpiod_direction_output(gpiod, 0), so should't the flag here
be GPIOD_OUT_LOW?

>         }
>         if (!IS_ERR(gpiod))
>                 gpio_vbus->gpiod_pullup = gpiod;
> @@ -382,12 +391,18 @@ static const struct dev_pm_ops gpio_vbus_dev_pm_ops = {
>  };
>  #endif
>
> +static struct of_device_id gpio_vbus_dt_ids[] = {
> +       { .compatible = "generic,phy-gpio-vbus" },

See my reply to the binding docs, I think the "generic," might have to go.

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
