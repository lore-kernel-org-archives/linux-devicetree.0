Return-Path: <SRS0=/7vY=RF=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
References: <1551402256-7815-1-git-send-email-jun.li@nxp.com> <1551402256-7815-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1551402256-7815-2-git-send-email-jun.li@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Mar 2019 18:27:11 +0200
Message-ID: <CAHp75VfT7YY7EZNmAA18wyrxxp2vZrAsdEC-b2q7Sm+mL-1Srg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb: typec: add typec switch via GPIO control
Content-Type: text/plain; charset="UTF-8"
To: Jun Li <jun.li@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 1, 2019 at 3:25 AM Jun Li <jun.li@nxp.com> wrote:
>
> This patch adds a simple typec switch driver which only needs
> a GPIO to switch the super speed active channel according to
> typec orientation.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

One minor below.

>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>
> Changes for v2:
> - Use the correct head files for gpio api and of_device_id:
>   #include <linux/gpio/consumer.h>
>   #include <linux/mod_devicetable.h>
> - Add driver dependency on GPIOLIB
>
>  drivers/usb/typec/mux/Kconfig       |   7 +++
>  drivers/usb/typec/mux/Makefile      |   1 +
>  drivers/usb/typec/mux/gpio-switch.c | 105 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 113 insertions(+)
>
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 01ed0d5..27120e6 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -9,4 +9,11 @@ config TYPEC_MUX_PI3USB30532
>           Say Y or M if your system has a Pericom PI3USB30532 Type-C cross
>           switch / mux chip found on some devices with a Type-C port.
>
> +config TYPEC_SWITCH_GPIO
> +       tristate "Simple Super Speed Active Switch via GPIO"
> +       depends on GPIOLIB
> +       help
> +         Say Y or M if your system has a typec super speed channel
> +         switch via a simple GPIO control.
> +
>  endmenu
> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> index 1332e46..e29377c 100644
> --- a/drivers/usb/typec/mux/Makefile
> +++ b/drivers/usb/typec/mux/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  obj-$(CONFIG_TYPEC_MUX_PI3USB30532)    += pi3usb30532.o
> +obj-$(CONFIG_TYPEC_SWITCH_GPIO)                += gpio-switch.o
> diff --git a/drivers/usb/typec/mux/gpio-switch.c b/drivers/usb/typec/mux/gpio-switch.c
> new file mode 100644
> index 0000000..b01844c
> --- /dev/null
> +++ b/drivers/usb/typec/mux/gpio-switch.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**

> + * gpio-switch.c - typec switch via a simple GPIO control.

If under any circumstances file will be renamed this become outdated.
So, better not to include file name in the file.

> + *
> + * Copyright 2019 NXP
> + * Author: Jun Li <jun.li@nxp.com>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/usb/typec_mux.h>
> +
> +struct gpio_typec_switch {
> +       struct typec_switch sw;
> +       struct mutex lock;
> +       struct gpio_desc *ss_sel;
> +};
> +
> +static int switch_gpio_set(struct typec_switch *sw,
> +                          enum typec_orientation orientation)
> +{
> +       struct gpio_typec_switch *gpio_sw = container_of(sw,
> +                               struct gpio_typec_switch, sw);
> +
> +       mutex_lock(&gpio_sw->lock);
> +
> +       switch (orientation) {
> +       case TYPEC_ORIENTATION_NORMAL:
> +               gpiod_set_value_cansleep(gpio_sw->ss_sel, 1);
> +               break;
> +       case TYPEC_ORIENTATION_REVERSE:
> +               gpiod_set_value_cansleep(gpio_sw->ss_sel, 0);
> +               break;
> +       case TYPEC_ORIENTATION_NONE:
> +               break;
> +       }
> +
> +       mutex_unlock(&gpio_sw->lock);
> +
> +       return 0;
> +}
> +
> +static int typec_switch_gpio_probe(struct platform_device *pdev)
> +{
> +       struct gpio_typec_switch        *gpio_sw;
> +       struct device                   *dev = &pdev->dev;
> +       int                             ret;
> +
> +       gpio_sw = devm_kzalloc(dev, sizeof(*gpio_sw), GFP_KERNEL);
> +       if (!gpio_sw)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, gpio_sw);
> +
> +       gpio_sw->sw.dev = dev;
> +       gpio_sw->sw.set = switch_gpio_set;
> +       mutex_init(&gpio_sw->lock);
> +
> +       /* Get the super speed active channel selection GPIO */
> +       gpio_sw->ss_sel = devm_gpiod_get(dev, NULL, GPIOD_OUT_LOW);
> +       if (IS_ERR(gpio_sw->ss_sel))
> +               return PTR_ERR(gpio_sw->ss_sel);
> +
> +       ret = typec_switch_register(&gpio_sw->sw);
> +       if (ret) {
> +               dev_err(dev, "Error registering typec switch: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int typec_switch_gpio_remove(struct platform_device *pdev)
> +{
> +       struct gpio_typec_switch *gpio_sw = platform_get_drvdata(pdev);
> +
> +       typec_switch_unregister(&gpio_sw->sw);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id of_typec_switch_gpio_match[] = {
> +       { .compatible = "nxp,ptn36043" },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_typec_switch_gpio_match);
> +
> +static struct platform_driver typec_switch_gpio_driver = {
> +       .probe          = typec_switch_gpio_probe,
> +       .remove         = typec_switch_gpio_remove,
> +       .driver         = {
> +               .name   = "typec-switch-gpio",
> +               .of_match_table = of_typec_switch_gpio_match,
> +       },
> +};
> +
> +module_platform_driver(typec_switch_gpio_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("TypeC Super Speed Switch GPIO driver");
> +MODULE_AUTHOR("Jun Li <jun.li@nxp.com>");
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
