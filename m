From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 7/9] gpio: pl061: convert to use generic irq chip
Date: Wed, 14 Dec 2011 14:17:24 -0700
Message-ID: <CACxGe6tvJawKU_fesJuBko9CFjg3Df7PO8B9iW66MMxAYof+Wg@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-8-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-8-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Convert the pl061 irq_chip code to use the generic irq chip code.
>
> This has the side effect of using 32-bit accesses rather than 8-bit
> accesses to interrupt registers. The h/w TRM and testing seem to indi=
cate
> this is fine.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> Cc: Linus Walleij <linus.ml.walleij@gmail.com>
> ---
> =A0drivers/gpio/Kconfig =A0 =A0 =A0| =A0 =A01 +
> =A0drivers/gpio/gpio-pl061.c | =A0 74 ++++++++++++++++---------------=
--------------
> =A02 files changed, 27 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8482a23..4d433e2 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -138,6 +138,7 @@ config GPIO_MXS
> =A0config GPIO_PL061
> =A0 =A0 =A0 =A0bool "PrimeCell PL061 GPIO support"
> =A0 =A0 =A0 =A0depends on ARM_AMBA
> + =A0 =A0 =A0 select GENERIC_IRQ_CHIP
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Say yes here to support the PrimeCell PL061 GPIO d=
evice
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index fe19dec..4a1874f 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -50,7 +50,6 @@ struct pl061_gpio {
> =A0 =A0 =A0 =A0 * the IRQ code simpler.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0lock; =A0 =A0 =A0=
 =A0 =A0 /* GPIO registers */
> - =A0 =A0 =A0 spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_lock; =A0 =A0=
 =A0 /* IRQ registers */
>
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*base;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base;
> @@ -125,40 +124,10 @@ static int pl061_to_irq(struct gpio_chip *gc, u=
nsigned offset)
> =A0 =A0 =A0 =A0return chip->irq_base + offset;
> =A0}
>
> -/*
> - * PL061 GPIO IRQ
> - */
> -static void pl061_irq_disable(struct irq_data *d)
> -{
> - =A0 =A0 =A0 struct pl061_gpio *chip =3D irq_data_get_irq_chip_data(=
d);
> - =A0 =A0 =A0 int offset =3D d->irq - chip->irq_base;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 u8 gpioie;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&chip->irq_lock, flags);
> - =A0 =A0 =A0 gpioie =3D readb(chip->base + GPIOIE);
> - =A0 =A0 =A0 gpioie &=3D ~(1 << offset);
> - =A0 =A0 =A0 writeb(gpioie, chip->base + GPIOIE);
> - =A0 =A0 =A0 spin_unlock_irqrestore(&chip->irq_lock, flags);
> -}
> -
> -static void pl061_irq_enable(struct irq_data *d)
> -{
> - =A0 =A0 =A0 struct pl061_gpio *chip =3D irq_data_get_irq_chip_data(=
d);
> - =A0 =A0 =A0 int offset =3D d->irq - chip->irq_base;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 u8 gpioie;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&chip->irq_lock, flags);
> - =A0 =A0 =A0 gpioie =3D readb(chip->base + GPIOIE);
> - =A0 =A0 =A0 gpioie |=3D 1 << offset;
> - =A0 =A0 =A0 writeb(gpioie, chip->base + GPIOIE);
> - =A0 =A0 =A0 spin_unlock_irqrestore(&chip->irq_lock, flags);
> -}
> -
> =A0static int pl061_irq_type(struct irq_data *d, unsigned trigger)
> =A0{
> - =A0 =A0 =A0 struct pl061_gpio *chip =3D irq_data_get_irq_chip_data(=
d);
> + =A0 =A0 =A0 struct irq_chip_generic *gc =3D irq_data_get_irq_chip_d=
ata(d);
> + =A0 =A0 =A0 struct pl061_gpio *chip =3D gc->private;
> =A0 =A0 =A0 =A0int offset =3D d->irq - chip->irq_base;
> =A0 =A0 =A0 =A0unsigned long flags;
> =A0 =A0 =A0 =A0u8 gpiois, gpioibe, gpioiev;
> @@ -166,7 +135,7 @@ static int pl061_irq_type(struct irq_data *d, uns=
igned trigger)
> =A0 =A0 =A0 =A0if (offset < 0 || offset >=3D PL061_GPIO_NR)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>
> - =A0 =A0 =A0 spin_lock_irqsave(&chip->irq_lock, flags);
> + =A0 =A0 =A0 raw_spin_lock_irqsave(&gc->lock, flags);
>
> =A0 =A0 =A0 =A0gpioiev =3D readb(chip->base + GPIOIEV);
>
> @@ -195,18 +164,11 @@ static int pl061_irq_type(struct irq_data *d, u=
nsigned trigger)
>
> =A0 =A0 =A0 =A0writeb(gpioiev, chip->base + GPIOIEV);
>
> - =A0 =A0 =A0 spin_unlock_irqrestore(&chip->irq_lock, flags);
> + =A0 =A0 =A0 raw_spin_unlock_irqrestore(&gc->lock, flags);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -static struct irq_chip pl061_irqchip =3D {
> - =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "GPIO",
> - =A0 =A0 =A0 .irq_enable =A0 =A0 =3D pl061_irq_enable,
> - =A0 =A0 =A0 .irq_disable =A0 =A0=3D pl061_irq_disable,
> - =A0 =A0 =A0 .irq_set_type =A0 =3D pl061_irq_type,
> -};
> -
> =A0static void pl061_irq_handler(unsigned irq, struct irq_desc *desc)
> =A0{
> =A0 =A0 =A0 =A0struct list_head *chip_list =3D irq_get_handler_data(i=
rq);
> @@ -232,6 +194,26 @@ static void pl061_irq_handler(unsigned irq, stru=
ct irq_desc *desc)
> =A0 =A0 =A0 =A0chained_irq_exit(irqchip, desc);
> =A0}
>
> +static void __init pl061_init_gc(struct pl061_gpio *chip, int irq_ba=
se)
> +{
> + =A0 =A0 =A0 struct irq_chip_generic *gc;
> + =A0 =A0 =A0 struct irq_chip_type *ct;
> +
> + =A0 =A0 =A0 gc =3D irq_alloc_generic_chip("gpio-pl061", 1, irq_base=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 chip->base, handle_simple_irq);
> + =A0 =A0 =A0 gc->private =3D chip;
> +
> + =A0 =A0 =A0 ct =3D gc->chip_types;
> + =A0 =A0 =A0 ct->chip.irq_mask =3D irq_gc_mask_clr_bit;
> + =A0 =A0 =A0 ct->chip.irq_unmask =3D irq_gc_mask_set_bit;
> + =A0 =A0 =A0 ct->chip.irq_set_type =3D pl061_irq_type;
> + =A0 =A0 =A0 ct->chip.irq_set_wake =3D irq_gc_set_wake;
> + =A0 =A0 =A0 ct->regs.mask =3D GPIOIE;
> +
> + =A0 =A0 =A0 irq_setup_generic_chip(gc, IRQ_MSK(PL061_GPIO_NR),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_GC_I=
NIT_NESTED_LOCK, IRQ_NOREQUEST, 0);
> +}
> +
> =A0static int pl061_probe(struct amba_device *dev, const struct amba_=
id *id)
> =A0{
> =A0 =A0 =A0 =A0struct pl061_platform_data *pdata;
> @@ -269,7 +251,6 @@ static int pl061_probe(struct amba_device *dev, c=
onst struct amba_id *id)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0spin_lock_init(&chip->lock);
> - =A0 =A0 =A0 spin_lock_init(&chip->irq_lock);
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&chip->list);
>
> =A0 =A0 =A0 =A0chip->gc.direction_input =3D pl061_direction_input;
> @@ -293,6 +274,8 @@ static int pl061_probe(struct amba_device *dev, c=
onst struct amba_id *id)
> =A0 =A0 =A0 =A0if (chip->irq_base <=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> + =A0 =A0 =A0 pl061_init_gc(chip, chip->irq_base);
> +
> =A0 =A0 =A0 =A0writeb(0, chip->base + GPIOIE); /* disable irqs */
> =A0 =A0 =A0 =A0irq =3D dev->irq[0];
> =A0 =A0 =A0 =A0if (irq < 0) {
> @@ -321,11 +304,6 @@ static int pl061_probe(struct amba_device *dev, =
const struct amba_id *id)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pl061_=
direction_input(&chip->gc, i);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chip_and_handler(i + chip->irq_=
base, &pl061_irqchip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0handle_simple_irq);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_irq_flags(i+chip->irq_base, IRQF_VA=
LID);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chip_data(i + chip->irq_base, c=
hip);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.5.4
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
