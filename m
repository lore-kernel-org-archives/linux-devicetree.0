From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 6/9] pinctrl: Add IRQ support to STM32 gpios
Date: Wed, 7 Sep 2016 23:06:12 +0200
Message-ID: <CACRpkdZ_r0phJeScTYs_LmEHavcjGo6YjHPEHo-rKAv+rLgiFg@mail.gmail.com>
References: <1473180341-1999-1-git-send-email-alexandre.torgue@st.com> <1473180341-1999-7-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1473180341-1999-7-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2016 at 6:45 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> This patch adds IRQ support to STM32 gpios.
>
> The EXTI controller has 16 lines dedicated to GPIOs.
> EXTI line n can be connected to only line n of one of the GPIO ports, for
> example EXTI0 can be connected to either PA0, or PB0, or PC0...
> This port selection is done by specifying the port number into System
> Config registers.
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

> +++ b/drivers/pinctrl/stm32/Kconfig
> @@ -6,6 +6,8 @@ config PINCTRL_STM32
>         select PINMUX
>         select GENERIC_PINCONF
>         select GPIOLIB
> +       select GPIOLIB_IRQCHIP

But you're not really using GPIOLIB_IRQCHIP. You have a different,
super-complex irqchip in use.

So just don't select this.

> +       bank->gpio_chip.irqdomain = irq_domain_create_hierarchy(pctl->domain,
> +                                       0, STM32_GPIO_IRQ_LINE, bank->fwnode,
> +                                       &stm32_gpio_domain_ops, bank);

Don't use that irqdomain pointer inside the gpio_chip.

Instead declare the irqdomain pointer inside struct stm32_gpio_bank
or something like that.

Yours,
Linus Walleij
