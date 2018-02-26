From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v8 3/9] mfd: madera: Add common support for Cirrus Logic
 Madera codecs
Date: Mon, 26 Feb 2018 17:06:40 +0000
Message-ID: <c59653aa-c55a-52ea-98f6-292f70f97b25@opensource.cirrus.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com>
 <20180226130558.7634-4-rf@opensource.cirrus.com>
 <CAHp75VdQtLKfSR5fhxxGJfa0j8h-vKT3YLDRTt0Khxe1UKzknw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdQtLKfSR5fhxxGJfa0j8h-vKT3YLDRTt0Khxe1UKzknw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26/02/18 14:11, Andy Shevchenko wrote:
> On Mon, Feb 26, 2018 at 3:05 PM, Richard Fitzgerald
> <rf@opensource.cirrus.com> wrote:
>> This adds the generic core support for Cirrus Logic "Madera" class codecs.
>> These are complex audio codec SoCs with a variety of digital and analogue
>> I/O, onboard audio processing and DSPs, and other features.
>>
>> These codecs are all based off a common set of hardware IP so can be
>> supported by a core of common code (with a few minor device-to-device
>> variations).
> 
> 
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by the
>> + * Free Software Foundation; version 2.
> 
> This is redundant.
> 

Ditto my other reply. Our legal team want these lines.

>> +static void madera_enable_hard_reset(struct madera *madera)
>> +{
>> +       if (madera->reset_gpio)
> 
> if (!...)
>   return
> 

Could do but why bother? For such a trivial function, in my opinion

static void madera_enable_hard_reset(struct madera *madera)
{
	if (madera->reset_gpio)
		gpiod_set_value_cansleep(madera->reset_gpio, 0);
}

is simpler and more readable than

static void madera_enable_hard_reset(struct madera *madera)
{
	if (!madera->reset_gpio)
		return;

	gpiod_set_value_cansleep(madera->reset_gpio, 0);
}

>> +               gpiod_set_value_cansleep(madera->reset_gpio, 0);
>> +}
>> +
>> +static void madera_disable_hard_reset(struct madera *madera)
>> +{
>> +       if (madera->reset_gpio) {
> 
> Ditto.
> 

As above, yes it would work the other way but I think for such a simple
implementation the way I have written it is more readable.

>> +               gpiod_set_value_cansleep(madera->reset_gpio, 1);
>> +               usleep_range(1000, 2000);
>> +       }
>> +}
>> +
> 
>> +#ifdef CONFIG_PM
> 
> __maybe_unused
> 
> 
>> +const struct dev_pm_ops madera_pm_ops = {
>> +       SET_RUNTIME_PM_OPS(madera_runtime_suspend,
>> +                          madera_runtime_resume,
>> +                          NULL)
>> +};
> 
> There is a macro helper for this I believe.

Not for a dev_pm_ops that only has runtime pm.
If you're thinking of UNIVERSAL_DEV_PM_OPS that would set the same
functions as handlers for system suspend, which we don't want to do
for the reasons given in the comment describing UNIVERSAL_DEV_PM_OPS.

> 
>> +const struct of_device_id madera_of_match[] = {
>> +       { .compatible = "cirrus,cs47l35", .data = (void *)CS47L35 },
>> +       { .compatible = "cirrus,cs47l85", .data = (void *)CS47L85 },
>> +       { .compatible = "cirrus,cs47l90", .data = (void *)CS47L90 },
>> +       { .compatible = "cirrus,cs47l91", .data = (void *)CS47L91 },
>> +       { .compatible = "cirrus,wm1840", .data = (void *)WM1840 },
> 
>> +       {},
> 
> No comma.
> 

Seems to be personal preference. Both ways are used in the kernel and
we've always used this style so I'll leave it to Lee to decide.

>> +};
> 
> 
>> +               ret = devm_gpio_request_one(madera->dev,
>> +                                           madera->pdata.reset,
>> +                                           GPIOF_DIR_OUT | GPIOF_INIT_LOW,
>> +                                           "madera reset");
>> +               if (!ret)
>> +                       madera->reset_gpio = gpio_to_desc(madera->pdata.reset);
> 
> Why? What's wrong with descriptors?
> 

This is what I mean by code going stale when it's acked but then never
gets merged. Some time ago there was a reason (which I forget).

>> +       dev_set_drvdata(madera->dev, madera);
> ...
>> +       if (dev_get_platdata(madera->dev))
> 
> What this dance for?
> 

Are you perhaps thinking the second line is dev_get_drvdata()?
dev_get_platdata() gets a pointer to any pdata, so not related
to dev_set_drvdata().

>> +       ret = mfd_add_devices(madera->dev, PLATFORM_DEVID_NONE,
>> +                             mfd_devs, n_devs,
>> +                             NULL, 0, NULL);
> 
> devm_?
> 

I can try it and see. It's scary because we can depend on our
children but maybe devm_mfd_add_devices() is safe.

>> +       if (i2c->dev.of_node) {
>> +               of_id = of_match_device(madera_of_match, &i2c->dev);
>> +               if (of_id)
>> +                       type = (unsigned long)of_id->data;
>> +       } else {
>> +               type = id->driver_data;
>> +       }
> 
>> +       if (spi->dev.of_node) {
>> +               of_id = of_match_device(madera_of_match, &spi->dev);
>> +               if (of_id)
>> +                       type = (unsigned long)of_id->data;
> 
> There is a helper to get match data.
> 
>> +       } else {
>> +               type = id->driver_data;
>> +       }
> 
>> +struct madera_irqchip_pdata;
>> +struct madera_codec_pdata;
> 
> 
> Why do you need platform data in new code?
> 

Answered in a comment in another patch. We care about allowing people
to use our chips with systems that don't use devicetree/acpi. There
are also many out-of-tree systems.

>> + * @reset:         GPIO controlling /RESET (0 = none)
> 
> Shouldn't be descriptor?
> 
