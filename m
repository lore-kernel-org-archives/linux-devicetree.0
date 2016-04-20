From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: of: make it possible to name GPIO lines
Date: Wed, 20 Apr 2016 10:10:43 +0900
Message-ID: <CAAVeFuLt6PSLqUUROGKnpEdVjN55-L-HKzTcgCwfJD0NvuFYWA@mail.gmail.com>
References: <1461073157-26574-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461073157-26574-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bamvor Jian Zhang <bamvor.zhangjian-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2016 at 10:39 PM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Make it possible to name the producer side of a GPIO line using
> a "gpio-names" property array, modeled on the "clock-names"
> property from the clock bindings.
>
> This naming is especially useful for:
>
> - Debugging: lines are named after function, not just opaque
>   offset numbers.
>
> - Exploration: systems where some or all GPIO lines are available
>   to end users, such as prototyping, one-off's "makerspace usecases"
>   users are helped by the names of the GPIO lines when tinkering.
>   This usecase has been surfacing recently.
>
> The gpio-names attribute is completely optional.

Been a little bit late on this discussion, but I like the idea.

Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

One nit below...

>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This has been discussed at some length now.
>
> Why we are not using hogs: these are consumer side, not producer
> side. The gpio-controller in DT (gpio_chip in Linux) is a
> producer, not a consumer.
>
> This patch is not about assigning initial values to GPIO lines.
> That is an orthogonal usecase. This is just about naming lines.
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 19 +++++++++++
>  drivers/gpio/gpiolib-of.c                       | 43 +++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index c88d2ccb05ca..6b371ab6098e 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -152,6 +152,21 @@ additional bitmask is needed to specify which GPIOs are actually in use,
>  and which are dummies. The bindings for this case has not yet been
>  specified, but should be specified if/when such hardware appears.
>
> +Optionally, a GPIO controller may have a "gpio-names" property. This is
> +an array of strings defining the names of the GPIO lines going out of the
> +GPIO controller. This name should be the most meaningful producer name
> +for the system, such as a rail name indicating the usage. Package names
> +such as pin name are discouraged: such lines have opaque names (since they
> +are by definition generic purpose) and such names are usually not very
> +helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are
> +reasonable line names as they describe what the line is used for. "GPIO0"
> +is not a good name to give to a GPIO line. Placeholders are discouraged:
> +rather use the "" (blank string) if the use of the GPIO line is undefined
> +in your design. The names are assigned starting from line offset 0 from
> +left to right from the passed array. An incomplete array (where the number
> +of passed named are less than ngpios) will still be used up until the last
> +provided valid line index.
> +
>  Example:
>
>  gpio-controller@00000000 {
> @@ -160,6 +175,10 @@ gpio-controller@00000000 {
>         gpio-controller;
>         #gpio-cells = <2>;
>         ngpios = <18>;
> +       gpio-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
> +               "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
> +               "Row A", "Row B", "Row C", "Row D", "NMI button",
> +               "poweroff", "reset";
>  }
>
>  The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index d81dbd8e90d9..b4e3a42e7aae 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -196,6 +196,42 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
>  }
>
>  /**
> + * of_gpiochip_set_names() - set up the names of the lines
> + * @chip: GPIO chip whose lines should be named, if possible
> + */
> +static int of_gpiochip_set_names(struct gpio_chip *gc)
> +{
> +       struct gpio_device *gdev = gc->gpiodev;
> +       struct device_node *np = gc->of_node;
> +       int i;
> +       int nstrings;
> +
> +       /* Do we even have the "gpio-names" property */
> +       if (!of_property_read_bool(np, "gpio-names"))
> +               return 0;
> +
> +       nstrings = of_property_count_strings(np, "gpio-names");
> +       for (i = 0; i < nstrings; i++) {
> +               const char *name;
> +               int ret;
> +
> +               ret = of_property_read_string_index(np,
> +                                                   "gpio-names",
> +                                                   i,
> +                                                   &name);
> +               if (!ret)
> +                       gdev->descs[i].name = name;

Shouldn't we check for name collision (by calling gpio_name_to_desc()
as gpiochip_set_desc_names() does) here?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
