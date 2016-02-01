From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v4 4/9] pinctrl: Add STM32 MCUs support
Date: Mon, 1 Feb 2016 11:39:31 +0100
Message-ID: <CALszF6DTpcU8jFwA0HL8LpkxfO5ZOdFmpHBUxA7WfYgAj_uFhg@mail.gmail.com>
References: <1452773795-24216-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1452773795-24216-5-git-send-email-mcoquelin.stm32@gmail.com>
	<CACRpkdaBcP6fC5Oxn+d1WPdHq1FtwMkf8Ap5VDLQFg-5UwEBAw@mail.gmail.com>
	<2151471.Wut3mQ9SS7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <2151471.Wut3mQ9SS7@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

2016-02-01 11:21 GMT+01:00 Arnd Bergmann <arnd@arndb.de>:
> On Wednesday 27 January 2016 14:16:32 Linus Walleij wrote:
>> On Thu, Jan 14, 2016 at 1:16 PM, Maxime Coquelin
>> <mcoquelin.stm32@gmail.com> wrote:
>>
>> > This patch adds pinctrl and GPIO support to STMicroelectronic's STM32
>> > family of MCUs.
>> >
>> > While it only supports STM32F429 for now, it has been designed to enable
>> > support of other MCUs of the family (e.g. STM32F746).
>> >
>> > Acked-by: Patrice Chotard <patrice.chotard@st.com>
>> > Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>
>> This patch applied for kernel v4.6.
>>
>
> This breaks the kernel build, please revert:
>
> drivers/pinctrl/stm32/pinctrl-stm32.c:26:47: fatal error: dt-bindings/pinctrl/pinctrl-stm32.h: No such file or directory

Right, I missed to notify this dependency to Linus, sorry about that.
This dependency is no more needed, so I could just move the macros to
the driver side.

Note that I also noticed a breakage at build time due to field
renaming in gpio_chip structure (dev -> parent).

I propose to rebase the series and move the defines into the driver.
Is it ok for you?

Regards,
Maxime
