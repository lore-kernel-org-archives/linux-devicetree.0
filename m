From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: Re: [PATCH RESEND 2/2] gpio: axp209: add pinctrl support
Date: Tue, 29 Nov 2016 23:13:08 +0100
Message-ID: <f46c89f2-478b-93b8-5a66-12d1307d4514@free-electrons.com>
References: <20161123141151.25315-1-quentin.schulz@free-electrons.com>
 <20161123141151.25315-3-quentin.schulz@free-electrons.com>
 <CACRpkdb8cej=AMs2kO1Vks-WYeae+CtAW2YOCc+Pz3E49mcrDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb8cej=AMs2kO1Vks-WYeae+CtAW2YOCc+Pz3E49mcrDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 24/11/2016 15:17, Linus Walleij wrote:
> On Wed, Nov 23, 2016 at 3:11 PM, Quentin Schulz
> <quentin.schulz@free-electrons.com> wrote:
> 
>> The GPIOs present in the AXP209 PMIC have multiple functions. They
>> typically allow a pin to be used as GPIO input or output and can also be
>> used as ADC or regulator for example.[1]
>>
>> This adds the possibility to use all functions of the GPIOs present in
>> the AXP209 PMIC thanks to pinctrl subsystem.
>>
>> [1] see registers 90H, 92H and 93H at
>>     http://dl.linux-sunxi.org/AXP/AXP209_Datasheet_v1.0en.pdf
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> 
> I need Maxime's review on this patch.
> 
>>  .../devicetree/bindings/gpio/gpio-axp209.txt       |  28 +-
> 
> Also move the bindings to pinctrl/pinctrl-axp209.txt
> 
>>  drivers/gpio/gpio-axp209.c                         | 551 ++++++++++++++++++---
> 
> Combined drivers should be in drivers/pinctrl/*.
> 
> Make a separate patch moving the driver to
> drivers/pinctrl/pinctrl-axp209.c (remember -M to git format-patch)
> augment Kconfig and Makefile in both subsystems and make
> these patches on top of that.
> 

So basically:

 - first patch for adding pinctrl to the existing driver
 - second patch for moving the driver and binding from gpio to pinctrl
subsystem
 - third patch for both removing Kconfig entry and Makefile rule from
gpio subsystem, and adding a Kconfig entry and a Makefile rule in
pinctrl subsystem

Is that what you want?

Thanks,
Quentin

> I will deal with cross-merging the result between the GPIO
> and pin control trees.
> 
> Yours,
> Linus Walleij
> 

-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
