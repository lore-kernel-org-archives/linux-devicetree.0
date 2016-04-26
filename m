From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: of: make it possible to name GPIO lines
Date: Tue, 26 Apr 2016 13:03:45 +0200
Message-ID: <CACRpkdYZuRGvFf1kjy3E4=1hSfVaqFTk6qENyaJjEdTgZ8uVGQ@mail.gmail.com>
References: <1461236901-28626-1-git-send-email-linus.walleij@linaro.org>
	<20160421170615.GA25466@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160421170615.GA25466@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, David Mandala <david.mandala@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 7:06 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Apr 21, 2016 at 01:08:21PM +0200, Linus Walleij wrote:
>>  /**
>> + * of_gpiochip_set_names() - set up the names of the lines
>> + * @chip: GPIO chip whose lines should be named, if possible
>> + */
>> +static void of_gpiochip_set_names(struct gpio_chip *gc)
>> +{
>> +     struct gpio_device *gdev = gc->gpiodev;
>> +     struct device_node *np = gc->of_node;
>> +     int i;
>> +     int nstrings;
>> +
>> +     /* Do we even have the "gpio-line-names" property */
>> +     if (!of_property_read_bool(np, "gpio-line-names"))
>> +             return;
>> +
>> +     nstrings = of_property_count_strings(np, "gpio-line-names");
>> +     /*
>> +      * Make sure to not index beyond either the end of the
>> +      * "gpio-names" array nor the number of descriptors of
>> +      * the GPIO device.
>> +      */
>
> I know you mentioned that it already been discussed much, but I am not
> sure why we need to count the string (and validate that strings are
> present by treating the property as boolean?),

I validate the property to be present to bail out quickly on controllers
that have no names set (i.e. all currently deployed device trees).
I can skip that part if you think it's too much optimization.

However:

> I am not
> sure why we need to count the string
> when we could do
> something like this (relying on the fact that
> of_property_read_string_index() returns 0 or negative error, no positive
> return codes):
>
>         for (i = 0; i < gdev->ngpio; i++) {
>                 const char *name;
>                 int error;
>
>                 error = of_property_read_string_index(np,
>                                                       "gpio-line-names",
>                                                       i,
>                                                       &name);
>                 if (error) {
>                         if (error != -ENODATA)
>                                 dev_err(&gdev->dev,
>                                         "unable to name line %d: %d\n",
>                                         i, error);
>                         /*
>                          * Either no more strings (-ENODATA), or
>                          * other error, in any case we are done naming.
>                          */
>                         break;
>                 }
>
>                 gdev->descs[i].name = name;
>         }

Yeah I can do that, thanks I didn't look close enough at the semantics.

The big question whether the DT people are OK with naming producer
names like this remains however.

Yours,
Linus Walleij
