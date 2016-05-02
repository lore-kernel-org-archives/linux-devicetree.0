From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V11 6/6] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Mon, 2 May 2016 11:47:44 +0530
Message-ID: <5726F108.2050805@nvidia.com>
References: <1461837540-17071-1-git-send-email-ldewangan@nvidia.com>	<1461837540-17071-7-git-send-email-ldewangan@nvidia.com> <CACRpkdZxVsGkC1U5Y9+M1fh6Z1T_ZBZC4eyH4ryzBijUq2hvCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZxVsGkC1U5Y9+M1fh6Z1T_ZBZC4eyH4ryzBijUq2hvCg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Saturday 30 April 2016 05:08 PM, Linus Walleij wrote:
> On Thu, Apr 28, 2016 at 11:59 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
>> pins. It also supports interrupts from these pins.
>>
>> Add GPIO driver for these pins to control via GPIO APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Gnah there is still a problem with this, I just saw it:
>
>> +config GPIO_MAX77620
>> +       bool "GPIO support for PMIC MAX77620 and MAX20024"
> bool == not a module

Yaah, looked the changes from Gortmaker.
The things are evolving faster.

I think we can change "bool" to "tristate" here.
Then there is no need to have code change. MFD driver is already said as 
tristate.


I will wait for Lee's comment on this series patch before recycling the 
patch. (Already on V11 :-(  ).

