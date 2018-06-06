From: "H. Nikolaus Schaller" <hns@computer.org>
Subject: Re: [PATCH v7 3/3] gpio: pca953x: fix address calculation for pcal6524
Date: Wed, 6 Jun 2018 07:33:32 +0200
Message-ID: <A639885E-0E5D-4FB0-BE51-AFF35BF4F76B@computer.org>
References: <cover.1526533188.git.hns@goldelico.com> <e70e83f07aebaf702fef90a9fac61e41d8b558b0.1526533188.git.hns@goldelico.com> <20180523140635.GB27215@amd> <CAHp75VfxN1RZBFRK6oJ5AzCe_2ej9eYdwt96X+fJZgFy65eaFg@mail.gmail.com> <20180605203941.GA28143@amd>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605203941.GA28143@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

Hi,

> Am 05.06.2018 um 22:39 schrieb Pavel Machek <pavel@ucw.cz>:
> 
> On Tue 2018-06-05 18:37:21, Andy Shevchenko wrote:
>> On Wed, May 23, 2018 at 5:06 PM, Pavel Machek <pavel@ucw.cz> wrote:
>>> On Thu 2018-05-17 06:59:49, H. Nikolaus Schaller wrote:
>>>> The register constants are so far defined in a way that they fit
>>>> for the pcal9555a when shifted by the number of banks, i.e. are
>>>> multiplied by 2 in the accessor function.
>>>> 
>>>> Now, the pcal6524 has 3 banks which means the relative offset
>>>> is multiplied by 4 for the standard registers.
>>>> 
>>>> Simply applying the bit shift to the extended registers gives
>>>> a wrong result, since the base offset is already included in
>>>> the offset.
>>>> 
>>>> Therefore, we have to add code to the 24 bit accessor functions
>>>> that adjusts the register number for these exended registers.
>>>> 
>>>> The formula finally used was developed and proposed by
>>>> Andy Shevchenko <andy.shevchenko@gmail.com>.
>> 
>>>>      int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>>>> +     int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
>>>> +     int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>> 
>>> Is this reasonable to do on each register access? Compiler will not be
>>> able to optimize out fls and shifts, right?
>> 
>> On modern CPUs fls() is one assembly command. OTOH, any proposal to do
>> this better?
>> 
>> What I can see is that bank_shift is invariant to the function, and
>> maybe cached.
> 
> Yes, I thought that caching bank_shift might be good idea. I thought
> it was constant for given chip...

Yes, it is an f(chip), but the question that comes to my mind is if
optimization is worth any effort. This is an accessor method over i2c
which tends to be slow (100 / 400kHz SCL) compared to the CPU. So saving
1 or 2 CPU cycles here doesn't seem to be a significant improvement.
Maybe it is more valuable to improve the code path through the i2c core?

BR,
Nikolaus
