From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 6/9] pinctrl: Add IRQ support to STM32 gpios
Date: Mon, 12 Sep 2016 14:58:34 +0200
Message-ID: <CACRpkdYYoMqCqq=L53LFUxCM=q00q5YhcxB=+-ZhxkAUbJEB5Q@mail.gmail.com>
References: <1473180341-1999-1-git-send-email-alexandre.torgue@st.com>
 <1473180341-1999-7-git-send-email-alexandre.torgue@st.com>
 <CACRpkdZ_r0phJeScTYs_LmEHavcjGo6YjHPEHo-rKAv+rLgiFg@mail.gmail.com> <0063a1ef-1b09-7cfc-f18b-76f2bb07eb84@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <0063a1ef-1b09-7cfc-f18b-76f2bb07eb84@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 5:47 PM, Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Just one question, when you say "super-complex irqchip in use", do you mean
> I could use another (simplest) solution to handle this EXTI controller?

I don't know, GPIOLIB_IRQCHIP is to be used for some specific
cases documented in Documentation/gpio/driver.txt.

For anything complex, we either need to have this hairy code
or invent new abstractions.

For now, I assume this is needed...

Yours,
Linus Walleij
