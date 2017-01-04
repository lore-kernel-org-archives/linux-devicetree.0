From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Wed, 4 Jan 2017 12:20:40 +0200
Message-ID: <7bfce806-7670-0bf3-bdf2-00aaf68b5b11@mentor.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
 <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
 <CAHp75VeCKPy4B51P_N9Bp03zPUbRodKzitc-n16ZRKJWcEF4fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VeCKPy4B51P_N9Bp03zPUbRodKzitc-n16ZRKJWcEF4fA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/04/2017 01:37 AM, Andy Shevchenko wrote:
> On Mon, Jan 2, 2017 at 11:07 PM, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Add optional reset-gpios pin control. If present, de-assert the
>> specified reset gpio pin to bring the chip out of reset.
> 
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/of_platform.h>
>>  #include <linux/acpi.h>
>>  #include <linux/regulator/consumer.h>
> 
>> +#include <linux/gpio/consumer.h>
> 
> Please, try to put it somehow alphabetically ordered (yes, I see it's
> not in general, but try to squeeze it into longest part which is
> ordered).
> 
>>
>>  #define PCA953X_INPUT          0
>>  #define PCA953X_OUTPUT         1
>> @@ -754,8 +755,18 @@ static int pca953x_probe(struct i2c_client *client,
>>                 invert = pdata->invert;
>>                 chip->names = pdata->names;
>>         } else {
>> +               struct gpio_desc *reset_gpio;
>> +
>>                 chip->gpio_start = -1;
>>                 irq_base = 0;
>> +
>> +               /* see if we need to de-assert a reset pin */
> 
> see -> See
> 
>> +               reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>> +                                                    GPIOD_OUT_LOW);
> 
> Shouldn't be _optional_exclusive?
> See this recent discussion https://patchwork.ozlabs.org/patch/706002/

There is no devm_gpiod_get_optional_exclusive(), probably you confuse
the function with devm_reset_control_get_optional_exclusive().

>> +               if (IS_ERR(reset_gpio)) {
>> +                       dev_err(&client->dev, "request for reset pin failed\n");
>> +                       return PTR_ERR(reset_gpio);
>> +               }
>>         }
> 

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
