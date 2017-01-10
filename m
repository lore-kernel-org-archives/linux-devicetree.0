From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Tue, 10 Jan 2017 11:10:23 -0800
Message-ID: <84d21f6d-7d6b-dd05-98a1-739c1e4d8d58@gmail.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
 <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
 <CAHp75VeCKPy4B51P_N9Bp03zPUbRodKzitc-n16ZRKJWcEF4fA@mail.gmail.com>
 <7bfce806-7670-0bf3-bdf2-00aaf68b5b11@mentor.com>
 <CAHp75Vey4R8o+7h3DuBJ9FiciGSHfvRWjs_0d3ZWeTm+cB4WrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vey4R8o+7h3DuBJ9FiciGSHfvRWjs_0d3ZWeTm+cB4WrA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org



On 01/04/2017 02:31 AM, Andy Shevchenko wrote:
>
>>>> +               reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>>>> +                                                    GPIOD_OUT_LOW);
>>> Shouldn't be _optional_exclusive?
>>> See this recent discussion https://patchwork.ozlabs.org/patch/706002/
>> There is no devm_gpiod_get_optional_exclusive(), probably you confuse
>> the function with devm_reset_control_get_optional_exclusive().
> Perhaps it's time to add
> drivers/reset/reset-gpio.c ?

Yeah, looks like a GPIO based reset controller driver would need to be
implemented in order to go this route. The max7310 nodes in
imx6qdl-sabreauto.dtsi could then refer to that reset controller by the
'resets' phandle.

There are many many devices that would benefit from a GPIO reset
controller, I count 143 nodes under arch/arm/boot/dts that specify a
'reset-gpios' property.

But I don't have the time to write such a driver. So I would propose just
keeping the devm_gpiod_get_optional() call here. When such a gpio reset
controller is written, the work can begin to convert all the gpio reset 
users
to make use of it.

Steve
