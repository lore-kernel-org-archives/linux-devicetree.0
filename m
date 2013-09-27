From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 2/3] pincntrl: add support for AMS AS3722 pin control driver
Date: Fri, 27 Sep 2013 14:40:07 +0200
Message-ID: <CACRpkdZc2SGhUJUjVqen3tX5sqfm=PthK42ustAmoWwBsWzHPQ@mail.gmail.com>
References: <1380044845-7734-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380044845-7734-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2013 at 7:47 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> The AS3722 is a compact system PMU suitable for mobile phones, tablets etc.
>
> Add a driver to support accessing the GPIO, pinmux and pin configuration
> of 8 GPIO pins found on the AMS AS3722 through pin control driver and
> gpiolib.
>
> The driver will register itself as the pincontrol driver and gpio driver.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Nit cleanups in driver and use module_platform_driver.
>
> Changes from V2:
> - Move the gpio driver from gpio folder to pinctnrl driver and register
>   driver as pincontrol driver.
> - Provide pin configuration through pincntrl framework.
>
> Changes from V3:
> - Added gpio ranges and pinctrl_gpio calls.
> - Used pinctrl_gpio_* calls on gpio chips callback.
> - Remove dummy function which just return not supported.
> - Nit cleanups.

This is getting a lot better quickly.

I'd like someone from devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org to say
something about the DT bindings, can you convince one of
the DT custodians to ACK this?

Remaining issues though:

> +This binding uses the following generic properties as defined in
> +pinctrl-bindings.txt:
> +
> +Required: pins

You're not explaining what this property does.

Normally the set of pins are defined by the driver, not by the
device tree, since it's a property of the hardware, i.e. the
driver defines what hardware we have, and the DT defines
only how to set it up to do what we want to do.

> +Example:
> +       as3722: as3722 {
> +               ....
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&as3722_default>;
> +
> +               as3722_default: pinmux {
> +                       gpio0 {
> +                               pins = "gpio0";
> +                               function = "gpio";
> +                               bias-pull-down;
> +                       };
> +
> +                       gpio1_2_4_7 {
> +                               pins = "gpio1", "gpio2", "gpio4", "gpio7";
> +                               function = "gpio";
> +                               bias-pull-up;
> +                       };
> +
> +                       gpio5 {
> +                               pins = "gpio5";
> +                               function = "clk32k_out";
> +                       };
> +               };


As you see the name "gpio0" thru "gpio5" is quite confusing
here, as it is referring to pins, not GPIO lines (which is something
else in Linux).

I guess you know for sure whatever it is, and if the hardware
manual names the pins like this then there is not much we can
do. On most chips the actual pins have better names, like
chessboard coordinates, "D1" etc on BGAs or other good names.

Can you just inspect your HW docs and verify that your pins
really have these confusing names?

So it's this:

> +#define AS3722_PIN_GPIO0               0
> +#define AS3722_PIN_GPIO1               1
> +#define AS3722_PIN_GPIO2               2
> +#define AS3722_PIN_GPIO3               3
> +#define AS3722_PIN_GPIO4               4
> +#define AS3722_PIN_GPIO5               5
> +#define AS3722_PIN_GPIO6               6
> +#define AS3722_PIN_GPIO7               7
> +#define AS3722_PIN_NUM                 (AS3722_PIN_GPIO7 + 1)
(...)
> +static const struct pinctrl_pin_desc as3722_pins_desc[] = {
> +       PINCTRL_PIN(AS3722_PIN_GPIO0, "gpio0"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO1, "gpio1"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO2, "gpio2"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO3, "gpio3"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO4, "gpio4"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO5, "gpio5"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO6, "gpio6"),
> +       PINCTRL_PIN(AS3722_PIN_GPIO7, "gpio7"),
> +};
> +
> +static const char * const gpio_groups[] = {
> +       "gpio0",
> +       "gpio1",
> +       "gpio2",
> +       "gpio3",
> +       "gpio4",
> +       "gpio5",
> +       "gpio6",
> +       "gpio7",
> +};

That is really, really confusing.

And this one-pin-per-group:

> +static const struct as3722_pingroup as3722_pingroups[] = {
> +       AS3722_PINGROUP(gpio0,  GPIO0),
> +       AS3722_PINGROUP(gpio1,  GPIO1),
> +       AS3722_PINGROUP(gpio2,  GPIO2),
> +       AS3722_PINGROUP(gpio3,  GPIO3),
> +       AS3722_PINGROUP(gpio4,  GPIO4),
> +       AS3722_PINGROUP(gpio5,  GPIO5),
> +       AS3722_PINGROUP(gpio6,  GPIO6),
> +       AS3722_PINGROUP(gpio7,  GPIO7),
> +};

Also makes my head twist.

But as I said, if they are named like this, then there is
not much we can do. But maybe we can put in something
clarifying....

> +static int as3722_gpio_direction_output(struct gpio_chip *chip,
> +               unsigned offset, int value)
> +{
> +       as3722_gpio_set(chip, offset, value);
> +       return pinctrl_gpio_direction_output(chip->base + offset);
> +}

Son't you want to set the direction first, then output the value?
This order is OK with some hardware, I'm just asking...

Overall this is looking very good.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
