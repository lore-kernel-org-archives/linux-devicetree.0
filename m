From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Thu, 6 Apr 2017 22:26:08 +0530
Message-ID: <58E67328.5040805@nvidia.com>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com> <CAHp75Ver7n=Xoer0YzA0sVVrcXKOB1bDz0ygSm0V0YoyYbe3pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ver7n=Xoer0YzA0sVVrcXKOB1bDz0ygSm0V0YoyYbe3pg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Thursday 06 April 2017 09:40 PM, Andy Shevchenko wrote:
> On Thu, Apr 6, 2017 at 4:35 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> Currently, the GPIO interface is said to Open Drain if it is Single
>> Ended and active LOW. Similarly, it is said as Open Source if it is
>> Single Ended and active HIGH.
>>
>> The active HIGH/LOW is used in the interface for setting the pin
>> state to HIGH or LOW when enabling/disabling the interface.
>>
>> In Open Drain interface, pin is set to HIGH by putting pin in
>> high impedance and LOW by driving to the LOW.
>>
>> In Open Source interface, pin is set to HIGH by driving pin to
>> HIGH and set to LOW by putting pin in high impedance.
>>
>> With above, the Open Drain/Source is unrelated to the active LOW/HIGH
>> in interface. There is interface where the enable/disable of interface
>> is ether active LOW or HIGH but it is Open Drain type.
>>
>> Hence decouple the Open Drain with Single Ended + Active LOW and
>> Open Source with Single Ended + Active HIGH.
>>
>> Adding different flag for the Open Drain/Open Source which is valid
>> only when Single ended flag is enabled.
>>          if (single_ended) {
>> -               if (active_low)
>> +               if (open_drain)
> This breaks ACPI case, right?
>

In acpi case, single_ended is not handled. It only handles the active LOW.

 From code:


        bool active_low = false;
         bool single_ended = false;
         int ret;

         if (!fwnode)
                 return ERR_PTR(-EINVAL);

         if (is_of_node(fwnode)) {
                 enum of_gpio_flags flags;

                 desc = of_get_named_gpiod_flags(to_of_node(fwnode), 
propname,
                                                 index, &flags);
                 if (!IS_ERR(desc)) {
                         active_low = flags & OF_GPIO_ACTIVE_LOW;
                         single_ended = flags & OF_GPIO_SINGLE_ENDED;
                 }
         } else if (is_acpi_node(fwnode)) {
                 struct acpi_gpio_info info;

                 desc = acpi_node_get_gpiod(fwnode, propname, index, &info);
                 if (!IS_ERR(desc))
                         active_low = info.polarity == GPIO_ACTIVE_LOW;
         }



