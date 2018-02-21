From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 08/10] gpio: Add gpio driver for Actions OWL S900 SoC
Date: Wed, 21 Feb 2018 21:13:53 +0200
Message-ID: <CAHp75VfLkmZp7HwX-du4EYdtJ8h=y59OrSbu53Ltf-_kFfpczg@mail.gmail.com>
References: <20180221160044.15089-1-manivannan.sadhasivam@linaro.org>
 <20180221160044.15089-9-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221160044.15089-9-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, hzhang@ucrobotics.com, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amit.kucheria@linaro.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, bdong@ucrobotics.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 21, 2018 at 6:00 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> Add gpio driver for Actions Semi OWL family S900 SoC. Set of registers
> controlling the gpio shares the same register range with pinctrl block.
>
> GPIO registers are organized as 6 banks and each bank controls the
> maximum of 32 gpios.

> +static void owl_gpio_set_reg(void __iomem *base, unsigned int pin, int flag)
> +{
> +       u32 val;
> +
> +       if (flag) {
> +               val = readl(base);
> +               val |= BIT(pin);
> +               writel(val, base);
> +       } else {
> +               val = readl(base);
> +               val &= ~BIT(pin);
> +               writel(val, base);
> +       }
> +}

Why not to use the same pattern as below?

readl()
if ()
 ...
else
...
writel()

?

> +static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +       struct owl_gpio *gpio = gpiochip_get_data(chip);
> +       const struct owl_gpio_port *port = gpio->port;
> +       void __iomem *gpio_base = gpio->base + port->offset;
> +       u32 val;
> +
> +       val = readl(gpio_base + GPIO_DAT);
> +
> +       if (value)
> +               val |= BIT(offset);
> +       else
> +               val &= ~BIT(offset);
> +
> +       writel(val, gpio_base + GPIO_DAT);
> +}


-- 
With Best Regards,
Andy Shevchenko
