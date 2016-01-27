From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v4 0/9] Add STM32 pinctrl/GPIO driver
Date: Wed, 27 Jan 2016 21:59:28 +0100
Message-ID: <56A92FB0.7080907@gmail.com>
References: <1452773795-24216-1-git-send-email-mcoquelin.stm32@gmail.com>
 <CACRpkdYGQ1xObWfka2CN9au6YMGhpu4qcTZpu72bzuJjO38tog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYGQ1xObWfka2CN9au6YMGhpu4qcTZpu72bzuJjO38tog@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

On 01/27/2016 02:20 PM, Linus Walleij wrote:
> On Thu, Jan 14, 2016 at 1:16 PM, Maxime Coquelin
> <mcoquelin.stm32@gmail.com>  wrote:
>
>> >This is the fourth round of STM32 pinctrl series, which takes into
>> >account comments made by Patrice on patch 4.
> I have applied patch 2 and 4 to the pinctrl tree.

Just tried to compile your devel branch, and it breaks:

   CC      drivers/pinctrl/stm32/pinctrl-stm32f429.o
drivers/pinctrl/stm32/pinctrl-stm32.c: In function 
'stm32_gpiolib_register_bank':
drivers/pinctrl/stm32/pinctrl-stm32.c:692:17: error: 'struct gpio_chip' 
has no member named 'dev'
   bank->gpio_chip.dev = dev;
                  ^
make[3]: *** [drivers/pinctrl/stm32/pinctrl-stm32.o] Error 1

This is due to the field renaming you did in gpio_chip struct:
58383c7 gpio: change member .dev to .parent

How do you prefer to proceed?
Should I send a fix on top of your devel branch, or you will fix it 
directly?

Thanks,
Maxime
