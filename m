From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH] of/gpio: Define OF_GPIO_OPEN_DRAIN flag for Open Drain
 outputs.
Date: Tue, 11 Feb 2014 10:51:51 -0800
Message-ID: <52FA7147.20607@caviumnetworks.com>
References: <1392069908-22017-1-git-send-email-ddaney.cavm@gmail.com> <CAAVeFu+_WKzLdhWcB_km3iDj419OhtMXEKzz_yWoL3WUm+7kQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+_WKzLdhWcB_km3iDj419OhtMXEKzz_yWoL3WUm+7kQQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: David Daney <ddaney.cavm@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On 02/10/2014 08:31 PM, Alexandre Courbot wrote:
> On Tue, Feb 11, 2014 at 7:05 AM, David Daney <ddaney.cavm@gmail.com> wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> When we have a GPIO pin connected to an open-drain network, we want a
>> standard way of specifying this in the device tree.  So we choose bit
>> 1 of the flag field to indicate open drain.
>>
>> A typical use case would be something like:
>>
>>          enum of_gpio_flags f;
>>          .
>>          .
>>          .
>>          reset_gpio = of_get_named_gpio_flags(node, "reset", 0, &f);
>>          .
>>          .
>>          .
>>          ret = gpio_request_one(reset_gpio,
>>                  (f & OF_GPIO_OPEN_DRAIN) ? GPIOF_OPEN_DRAIN : 0,
>>                   "reset");
>>          .
>>          .
>>          .
>>          gpio_direction_output(reset_gpio, 1);
>>          gpio_set_value(reset_gpio, 0);
>>          msleep(20);
>>          gpio_set_value(reset_gpio, 1);
>
> This is also useful for gpiod_get(). However, while you are at it,
> could you also add a flag for the OF_GPIO_OPEN_SOURCE property? My joy
> would be complete if you could also take the time to update
> of_find_gpio() to pass these new flags back to the caller as it
> already does for OF_GPIO_ACTIVE_LOW.
>
> Then you could even switch your use-case to the gpiod interface and
> not bother with passing these flags by yourself anymore. Just sayin'.
> ;)

Thanks for the suggestion.  I will send a revised patch set for your 
consideration.

David Daney
