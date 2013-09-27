From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/3] pincntrl: add support for AMS AS3722 pin control
 driver
Date: Fri, 27 Sep 2013 18:50:49 +0530
Message-ID: <52458631.7030401@nvidia.com>
References: <1380044845-7734-1-git-send-email-ldewangan@nvidia.com> <CACRpkdZc2SGhUJUjVqen3tX5sqfm=PthK42ustAmoWwBsWzHPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZc2SGhUJUjVqen3tX5sqfm=PthK42ustAmoWwBsWzHPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 27 September 2013 06:10 PM, Linus Walleij wrote:
> On Tue, Sep 24, 2013 at 7:47 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> function which just return not supported.
>> - Nit cleanups.
> This is getting a lot better quickly.
>
> I'd like someone from devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org to say
> something about the DT bindings, can you convince one of
> the DT custodians to ACK this?

I will request Stephen to review this.

> Remaining issues though:
>
>> +This binding uses the following generic properties as defined in
>> +pinctrl-bindings.txt:
>> +
>> +Required: pins
> You're not explaining what this property does.
>
> Normally the set of pins are defined by the driver, not by the
> device tree, since it's a property of the hardware, i.e. the
> driver defines what hardware we have, and the DT defines
> only how to set it up to do what we want to do.

pins are defined in the pinctrl-bindings and hence not duplicated here.

But some where we need to document that what are valid pin names which 
driver entertain.
I have referred the other dt document and I derived this from there.


>
>> +Example:
>> +       as3722: as3722 {
>> +               ....
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&as3722_default>;
>> +
>> +               as3722_default: pinmux {
>> +                       gpio0 {
>> +                               pins = "gpio0";
>> +                               function = "gpio";
>> +                               bias-pull-down;
>> +                       };
>> +
>> +                       gpio1_2_4_7 {
>> +                               pins = "gpio1", "gpio2", "gpio4", "gpio7";
>> +                               function = "gpio";
>> +                               bias-pull-up;
>> +                       };
>> +
>> +                       gpio5 {
>> +                               pins = "gpio5";
>> +                               function = "clk32k_out";
>> +                       };
>> +               };
>
> As you see the name "gpio0" thru "gpio5" is quite confusing
> here, as it is referring to pins, not GPIO lines (which is something
> else in Linux).
>
> I guess you know for sure whatever it is, and if the hardware
> manual names the pins like this then there is not much we can
> do. On most chips the actual pins have better names, like
> chessboard coordinates, "D1" etc on BGAs or other good names.
>
> Can you just inspect your HW docs and verify that your pins
> really have these confusing names?
>
> So it's this:


The pin diagram in datasheet of the device names these pins as GPIO0..GPIO7.
So hardly we can do here.
For GPIO3 on BGA124, it is E4 but CSP108, it is C9 so the other names 
defined on package.
But both places, it is said as GPIO3.

>
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
> That is really, really confusing.
>
> And this one-pin-per-group:

Yaah, typical device, all io function available on all GPIO pins.

>> +static int as3722_gpio_direction_output(struct gpio_chip *chip,
>> +               unsigned offset, int value)
>> +{
>> +       as3722_gpio_set(chip, offset, value);
>> +       return pinctrl_gpio_direction_output(chip->base + offset);
>> +}
> Son't you want to set the direction first, then output the value?
> This order is OK with some hardware, I'm just asking...

Avoid glitches, we need to set output value first and the output mode.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
