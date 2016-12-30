From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] bus: add driver for the Technologic Systems NBUS
Date: Fri, 30 Dec 2016 08:58:53 +0100
Message-ID: <CACRpkdYHHrYY-fAPnNmV94ejFJ36rhSF0SqSVHkTNq+YCRNNZw@mail.gmail.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com> <20161214231237.17496-5-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214231237.17496-5-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel <kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2016 at 12:12 AM, Sebastien Bourdelin
<sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org> wrote:

> This driver implements a GPIOs bit-banged bus, called the NBUS by
> Technologic Systems. It is used to communicate with the peripherals in
> the FPGA on the TS-4600 SoM.
>
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
(...)

> +#include <linux/gpio.h>

Use:
#include <linux/gpio/consumer.h>
instead, and deal with the fallout.

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>

Don't use this.

> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +
> +static DEFINE_MUTEX(ts_nbus_lock);
> +static bool ts_nbus_ready;

Why not move this to the struct ts_nbus state container?

It seems to be per-bus not per-system.

> +#define TS_NBUS_READ_MODE  0
> +#define TS_NBUS_WRITE_MODE 1
> +#define TS_NBUS_DIRECTION_IN  0
> +#define TS_NBUS_DIRECTION_OUT 1
> +#define TS_NBUS_WRITE_ADR 0
> +#define TS_NBUS_WRITE_VAL 1
> +
> +struct ts_nbus {
> +       struct pwm_device *pwm;
> +       int num_data;
> +       int *data;
> +       int csn;
> +       int txrx;
> +       int strobe;
> +       int ale;
> +       int rdy;
> +};
> +
> +static struct ts_nbus *ts_nbus;

Nopes. No singletons please.

Use the state container pattern:
Documentation/driver-model/design-patterns.txt

> +/*
> + * request all gpios required by the bus.
> + */
> +static int ts_nbus_init(struct platform_device *pdev)
> +{
> +       int err;
> +       int i;
> +
> +       for (i = 0; i < ts_nbus->num_data; i++) {
> +               err = devm_gpio_request_one(&pdev->dev, ts_nbus->data[i],
> +                                           GPIOF_OUT_INIT_HIGH,
> +                                           "TS NBUS data");
> +               if (err)
> +                       return err;
> +       }

DO not use the legacy GPIO API anywhere.

Reference the device and use gpiod_get() simple, fair and square.

Store struct gpio_desc * pointers in your state container instead.

> +static int ts_nbus_get_of_pdata(struct device *dev, struct device_node *np)
> +{
> +       int num_data;
> +       int *data;
> +       int ret;
> +       int i;
> +
> +       ret = of_gpio_named_count(np, "data-gpios");
> +       if (ret < 0) {
> +               dev_err(dev,
> +                       "failed to count GPIOs in DT property data-gpios\n");
> +               return ret;
> +       }

Do not reinvent the wheel.

Use devm_gpiod_get_array().


> +       ret = of_get_named_gpio(np, "csn-gpios", 0);

And again use devm_gpiod_get(), and gpiod_* accessors.
Applies everywhere.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
