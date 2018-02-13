From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] gpio: Add GPIO driver for Spreadtrum SC9860 platform
Date: Tue, 13 Feb 2018 09:13:32 +0100
Message-ID: <CACRpkdYYmHLfozshnQcH+CR0N1zFtiLARRtUbXvJiLG+Bv+R9w@mail.gmail.com>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517795460.git.baolin.wang@linaro.org>
 <e6da9398355648fc72dc3f674a7c11e114c37d61.1517795461.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e6da9398355648fc72dc3f674a7c11e114c37d61.1517795461.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 5, 2018 at 2:55 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> The Spreadtrum SC9860 platform GPIO controller contains 16 groups and
> each group contains 16 GPIOs. Each GPIO can set input/output and has
> the interrupt capability.
>
> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes since v2:

Hi Baolin,

sorry for taking so long to review :(

I think you need to add

depends on OF_GPIO to the dependencies. Else the build
will break on compile test on things like Usermode Linux
that doesn't have IOMEM.

> +/* GPIO registers definition */
> +#define SPRD_GPIO_DATA         0x0
> +#define SPRD_GPIO_DMSK         0x4
> +#define SPRD_GPIO_DIR          0x8
> +#define SPRD_GPIO_IS           0xc
> +#define SPRD_GPIO_IBE          0x10
> +#define SPRD_GPIO_IEV          0x14
> +#define SPRD_GPIO_IE           0x18
> +#define SPRD_GPIO_RIS          0x1c
> +#define SPRD_GPIO_MIS          0x20
> +#define SPRD_GPIO_IC           0x24
> +#define SPRD_GPIO_INEN         0x28

So this is very simple. And the only reason we cannot use
GPIO_GENERIC is that we have these groups inside the controller
and a shared interrupt line :/

Hm yeah I cannot think of anything better anyway.

Have you contemplated just putting them into the device tree
like this:

ap_gpio0: gpio@40280000 {
        compatible = "sprd,sc9860-gpio";
        reg = <0 0x40280000 0 0x80>;
        gpio-controller;
        #gpio-cells = <2>;
        interrupt-controller;
        #interrupt-cells = <2>;
        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
};

ap_gpio1: gpio@40280080 {
        compatible = "sprd,sc9860-gpio";
        reg = <0 0x40280080 0 0x80>;
        gpio-controller;
        #gpio-cells = <2>;
        interrupt-controller;
        #interrupt-cells = <2>;
        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
};

ap_gpio2: gpio@40280100 {
        compatible = "sprd,sc9860-gpio";
        reg = <0 0x40280100 0 0x80>;
        gpio-controller;
        #gpio-cells = <2>;
        interrupt-controller;
        #interrupt-cells = <2>;
        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
};

(...)

?

It is fine to have 16 driver instances if you grab the interrupt
with IRQF_SHARED and really just handle the IRQ if it is for
"your" instance. The upside is that you could then use
GPIO_GENERIC and get a very small and simple driver.

I understand that the current approach is also appealing though
and I see why. I'm not gonna say no to it, so if you strongly
prefer this approach we can go for it. Just wanted to point out
alternatives.

> +/* We have 16 groups GPIOs and each group contain 16 GPIOs */
> +#define SPRD_GPIO_GROUP_NR     16
> +#define SPRD_GPIO_NR           256
> +#define SPRD_GPIO_GROUP_SIZE   0x80
> +#define SPRD_GPIO_GROUP_MASK   GENMASK(15, 0)
> +#define SPRD_GPIO_BIT(x)       ((x) & (SPRD_GPIO_GROUP_NR - 1))

Please rename this from "groups" to "banks" because in the GPIO
subsystem everyone talks about "banks" not "groups".

This last thing many drivers do like this:

bit = x % 15;

but it is up to you, either way works (and probably result in the
same assembly).

> +static inline void __iomem *sprd_gpio_group_base(struct sprd_gpio *sprd_gpio,
> +                                                unsigned int group)
> +{
> +       return sprd_gpio->base + SPRD_GPIO_GROUP_SIZE * group;
> +}

Since you're always using this like this:

void __iomem *base = sprd_gpio_group_base(sprd_gpio,
                                            offset / SPRD_GPIO_GROUP_NR);

Why not simply have the offset as parameter to the function
instead of group number and do the division inside this
static inline?

> +static void sprd_gpio_update(struct gpio_chip *chip, unsigned int offset,
> +                            unsigned int reg, unsigned int val)

I would use u16 reg.

> +{
> +       struct sprd_gpio *sprd_gpio = gpiochip_get_data(chip);
> +       void __iomem *base = sprd_gpio_group_base(sprd_gpio,
> +                                                 offset / SPRD_GPIO_GROUP_NR);
> +       u32 shift = SPRD_GPIO_BIT(offset);
> +       unsigned long flags;
> +       u32 orig, tmp;
> +
> +       spin_lock_irqsave(&sprd_gpio->lock, flags);
> +       orig = readl_relaxed(base + reg);
> +
> +       tmp = (orig & ~BIT(shift)) | (val << shift);
> +       writel_relaxed(tmp, base + reg);
> +       spin_unlock_irqrestore(&sprd_gpio->lock, flags);
> +}

You don't need shift, orig and tmp variables here, I think it
gets hard to read.

I would do it like this:

u32 tmp;

tmp = readl_relaxed(base + reg);
if (val)
    tmp |= BIT(SPRD_GPIO_BIT(offset));
else
    tmp &= ~BIT(SPRD_GPIO_BIT(offset));
writel_relaxed(tmp, base + reg);

I don't know if the macros really help much. Maybe just inline it:

tmp = readl_relaxed(base + reg);
if (val)
    tmp |= BIT(offset % 15);
else
    tmp &= ~BIT(offset % 15);
writel_relaxed(tmp, base + reg);

It depends on taste. Just consider my options.
(I'll go with what you feel is easiest to read.)

> +static int sprd_gpio_read(struct gpio_chip *chip, unsigned int offset,
> +                         unsigned int reg)
> +{
> +       struct sprd_gpio *sprd_gpio = gpiochip_get_data(chip);
> +       void __iomem *base = sprd_gpio_group_base(sprd_gpio,
> +                                                 offset / SPRD_GPIO_GROUP_NR);
> +       u32 value = readl_relaxed(base + reg) & SPRD_GPIO_GROUP_MASK;
> +       u32 shift = SPRD_GPIO_BIT(offset);
> +
> +       return !!(value & BIT(shift));

I would just

return !!(readl_relaxed(base + reg) & BIT(offset % 15)):

But again it is a matter of taste.

(the rest looks fine!)

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
