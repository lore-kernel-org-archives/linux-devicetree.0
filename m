From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v8 9/9] gpio: madera: Support Cirrus Logic Madera class
 codecs
Date: Mon, 26 Feb 2018 17:19:34 +0000
Message-ID: <8e61dc88-e66a-f853-0ae0-b293a6e3bfc9@opensource.cirrus.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com>
 <20180226130558.7634-10-rf@opensource.cirrus.com>
 <CAHp75VebWArW6p4HbvnBYEsBqg5WJkn3Afh+cBNKCDS_W71LBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VebWArW6p4HbvnBYEsBqg5WJkn3Afh+cBNKCDS_W71LBg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26/02/18 14:16, Andy Shevchenko wrote:
> On Mon, Feb 26, 2018 at 3:05 PM, Richard Fitzgerald
> <rf@opensource.cirrus.com> wrote:
>> This adds support for the GPIOs on Cirrus Logic Madera class codecs.
>> Any pins not used for special functions (see the pinctrl driver) can be
>> used as general single-bit input or output lines. The number of available
>> GPIOs varies between codecs.
>>
>> Note that this is part of a composite MFD for these codecs and can only
>> be used with the corresponding MFD and other child drivers on those
>> silicon. The GPIO block on these codecs does not exist indepedently of
>> the rest of the MFD.
> 
>> +struct madera_gpio {
>> +       struct madera *madera;
>> +       struct gpio_chip gpio_chip;
>> +};
> 
> Why do you need this? I suppose one embeds or refers to the other.
> 

The gpio_chip is storage for the struct gpio_chip that we're using.
It allow us to create dynamically constructed struct gpio_chip based
on the template in madera_gpio_chip. See the code in madera_gpio_probe.

There are slight differences between the codecs (currently what we
care about is that they have different numbers of gpios.) and as we
still want to support pdata we also might have to change .base at
runtime.

It's possible to have multiple codecs of different type in one system
so patching the static madera_gpio_chip is not viable, we would need
different content for each codec.

As almost all members are the same, what we do is use madera_gpio_chip
as a template and copy it into the gpio_chip member of
struct madera_gpio for this codec. That becomes the struct gpio_chip
that we're actually using for this instance of this codec.
