From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v6] gpio/mpc8xxx: change irq handler from chained to normal
Date: Wed, 9 Oct 2019 18:33:54 +0200
Message-ID: <CAMpxmJVUkkiywMOQ6i_izu+8LQD0S_fpd_iuBz4yGceSrs5beg@mail.gmail.com>
References: <20191009083021.33529-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009083021.33529-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=C5=9Br., 9 pa=C5=BA 2019 o 10:41 Hui Song <hui.song_1@nxp.com> napisa=C5=
=82(a):
>
> From: Song Hui <hui.song_1@nxp.com>
>
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
>
> While this will work, it will mess up userspace accounting of the number
> of interrupts per second in tools such as vmstat.  The reason is that
> for every GPIO interrupt, /proc/interrupts records the count against GIC
> interrupt 68 or 69, as well as the GPIO itself.  So, for every GPIO
> interrupt, the total number of interrupts that the system has seen
> increments by two
>
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  Changes in v6:
>         - change request_irq to devm_request_irq and add commit message.
>  Changes in v5:
>         - add traverse every bit function.
>  Changes in v4:
>         - convert 'pr_err' to 'dev_err'.
>  Changes in v3:
>         - update the patch description.
>  Changes in v2:
>         - delete the compatible of ls1088a.
>
>  drivers/gpio/gpio-mpc8xxx.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..f0be284 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -22,6 +22,7 @@
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/bitops.h>
> +#include <linux/interrupt.h>
>
>  #define MPC8XXX_GPIO_PINS      32
>
> @@ -127,20 +128,20 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc=
, unsigned offset)
>                 return -ENXIO;
>  }
>
> -static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
> +static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
>  {
> -       struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D irq_desc_get_handler_dat=
a(desc);
> -       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D data;
>         struct gpio_chip *gc =3D &mpc8xxx_gc->gc;
>         unsigned int mask;
> +       int i;
>
>         mask =3D gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
>                 & gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
> -       if (mask)
> +       for_each_set_bit(i, &mask, 32)
>                 generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
> -                                                    32 - ffs(mask)));
> -       if (chip->irq_eoi)
> -               chip->irq_eoi(&desc->irq_data);
> +                                                    31 - i));
> +
> +       return IRQ_HANDLED;
>  }
>
>  static void mpc8xxx_irq_unmask(struct irq_data *d)
> @@ -388,8 +389,8 @@ static int mpc8xxx_probe(struct platform_device *pdev=
)
>
>         ret =3D gpiochip_add_data(gc, mpc8xxx_gc);
>         if (ret) {
> -               pr_err("%pOF: GPIO chip registration failed with status %=
d\n",
> -                      np, ret);
> +               dev_err(&pdev->dev, "%pOF: GPIO chip registration failed =
with status %d\n",
> +                       np, ret);

This is unrelated to the patch. Please put it in a separate patch.

Bart

>                 goto err;
>         }
>
> @@ -409,8 +410,16 @@ static int mpc8xxx_probe(struct platform_device *pde=
v)
>         if (devtype->gpio_dir_in_init)
>                 devtype->gpio_dir_in_init(gc);
>
> -       irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -                                        mpc8xxx_gpio_irq_cascade, mpc8xx=
x_gc);
> +       ret =3D devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
> +                              mpc8xxx_gpio_irq_cascade,
> +                              IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascad=
e",
> +                              mpc8xxx_gc);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), =
ret =3D %d\n",
> +                       np->full_name, mpc8xxx_gc->irqn, ret);
> +               goto err;
> +       }
> +
>         return 0;
>  err:
>         iounmap(mpc8xxx_gc->regs);
> --
> 2.9.5
>
