From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 1/4] pinctrl: stm32: set pin to gpio input when used as
 interrupt
Date: Mon, 24 Apr 2017 18:40:20 +0200
Message-ID: <e9d8c988-0bdd-0c82-2c56-6a31d052f0e6@st.com>
References: <1491577811-26989-1-git-send-email-alexandre.torgue@st.com>
 <1491577811-26989-2-git-send-email-alexandre.torgue@st.com>
 <CACRpkdYZixkJroS-gQxYL6xW47-J9UiNv4hOO9F-1b2eYLr8XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYZixkJroS-gQxYL6xW47-J9UiNv4hOO9F-1b2eYLr8XQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Patrice Chotard <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 04/24/2017 02:36 PM, Linus Walleij wrote:
> On Fri, Apr 7, 2017 at 5:10 PM, Alexandre TORGUE
> <alexandre.torgue@st.com> wrote:
>
>> This patch ensures that pin is correctly set as gpio input when it is used
>> as an interrupt.
>>
>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
> (...)
>
>> +static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
>> +{
>> +       struct stm32_gpio_bank *bank = irq_data->domain->host_data;
>> +       u32 ret;
>> +
>> +       if (!gpiochip_is_requested(&bank->gpio_chip, irq_data->hwirq)) {
>> +               ret = stm32_gpio_request(&bank->gpio_chip, irq_data->hwirq);
>> +               if (ret)
>> +                       return ret;
>> +       }
>
> This is wrong. You should only use gpiochip_lock_as_irq(), because of the
> following in Documentation/gpio/driver.txt:
>
> ---------------
> It is legal for any IRQ consumer to request an IRQ from any irqchip no matter
> if that is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
> irq_chip are orthogonal, and offering their services independent of each
> other.
> (...)
> So always prepare the hardware and make it ready for action in respective
> callbacks from the GPIO and irqchip APIs. Do not rely on gpiod_to_irq() having
> been called first.

Ok, so actually the action to set pin in input mode is necessary in 
stm32_gpio_irq_request_resources.

I'll fix it in V2.


>
> This orthogonality leads to ambiguities that we need to solve: if there is
> competition inside the subsystem which side is using the resource (a certain
> GPIO line and register for example) it needs to deny certain operations and
> keep track of usage inside of the gpiolib subsystem. This is why the API
> below exists.
>
> Locking IRQ usage
> -----------------
> Input GPIOs can be used as IRQ signals. When this happens, a driver is requested
> to mark the GPIO as being used as an IRQ:
>
>         int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
>
> This will prevent the use of non-irq related GPIO APIs until the GPIO IRQ lock
> is released:
>
>         void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
>
> When implementing an irqchip inside a GPIO driver, these two functions should
> typically be called in the .startup() and .shutdown() callbacks from the
> irqchip.
>
> When using the gpiolib irqchip helpers, these callback are automatically
> assigned.
> --------------
>
> It is because of easy to make errors like this that I prefer that people try
> to use GPIOLIB_IRQCHIP helpers insteaf of rolling their own irqchip code.

I understand. It was difficult in our case due to design.

Thanks for review.
Alex

>
> Yours,
> Linus Walleij
>
