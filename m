From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 6/9] pinctrl: Add IRQ support to STM32 gpios
Date: Tue, 19 Apr 2016 11:04:46 +0200
Message-ID: <CALszF6CUFKAjzUpEh3pDtSDdJuFan1ON0Kcu_uKD_OX36kXOHQ@mail.gmail.com>
References: <1459436979-17275-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1459436979-17275-7-git-send-email-mcoquelin.stm32@gmail.com>
	<CACRpkdYLPWNQZgdFHVwLOZv+rS=bdERM9St5b0hVHTd_+ZJMKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYLPWNQZgdFHVwLOZv+rS=bdERM9St5b0hVHTd_+ZJMKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Linus

2016-04-08 11:43 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Mar 31, 2016 at 5:09 PM, Maxime Coquelin
> <mcoquelin.stm32@gmail.com> wrote:
>
>> +static int stm32_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct stm32_pinctrl *pctl = dev_get_drvdata(chip->parent);
>> +       struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
>> +       unsigned int irq;
>> +
>> +       regmap_field_write(pctl->irqmux[offset], bank->range.id);
>
> No. You must implement the irqchip and GPIO controllers to
> be orthogonal, doing things like this creates a semantic that
> assumes .to_irq() is always called before using the IRQ and
> that is not guaranteed at all. A consumer may very well
> use an interrupt right off the irqchip without this being called
> first. All this function should do is translate a number. No
> other semantics.
>
> This needs to be done from the irqchip (sorry).

Actually, the register written here is not part of the irqchip.
It is a system config register that is only used when using a GPIO as
external interrupt.
Its aim is to mux the GPIO bank on a line.
For example on line 1, it can be muxed to select either gpioa1,
gpiob1, gpioc1, ...
How could I do it in the irqchip that has no gpio knowledge?

In case the consumer uses an interrupt right off the irqchip, it
should not access this register.
For example the RTC wakeup lines, where we will reference directly the irqchip.

That said, do you still believe the implementation is wrong? Do I miss
something?

Best regards,
Maxime
