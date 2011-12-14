From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 5/9] gpio: pl061: convert to use 0 for no irq
Date: Wed, 14 Dec 2011 14:16:09 -0700
Message-ID: <CACxGe6ujBaRLxo9JSW-vMHz1TZs+poKacHQbvC=aAjUsSq=m4g@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-6-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-6-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> We don't want drivers using NO_IRQ, so remove its use. For now, 0 or
> -1 means no irq until platforms are converted to use 0.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> Cc: Linus Walleij <linus.ml.walleij@gmail.com>
> ---
> =A0drivers/gpio/gpio-pl061.c =A0| =A0 =A08 ++++----
> =A0include/linux/amba/pl061.h | =A0 =A02 +-
> =A02 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 0f718f9..fe19dec 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -53,7 +53,7 @@ struct pl061_gpio {
> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_lock; =A0 =A0=
 =A0 /* IRQ registers */
>
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*base;
> - =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_base;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base;
> =A0 =A0 =A0 =A0struct gpio_chip =A0 =A0 =A0 =A0gc;
> =A0};
>
> @@ -119,7 +119,7 @@ static int pl061_to_irq(struct gpio_chip *gc, uns=
igned offset)
> =A0{
> =A0 =A0 =A0 =A0struct pl061_gpio *chip =3D container_of(gc, struct pl=
061_gpio, gc);
>
> - =A0 =A0 =A0 if (chip->irq_base =3D=3D NO_IRQ)
> + =A0 =A0 =A0 if (chip->irq_base <=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>
> =A0 =A0 =A0 =A0return chip->irq_base + offset;
> @@ -250,7 +250,7 @@ static int pl061_probe(struct amba_device *dev, c=
onst struct amba_id *id)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->irq_base =3D pdata->irq_base;
> =A0 =A0 =A0 =A0} else if (dev->dev.of_node) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->gc.base =3D -1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->irq_base =3D NO_IRQ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->irq_base =3D 0;
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENODEV;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto free_mem;
> @@ -290,7 +290,7 @@ static int pl061_probe(struct amba_device *dev, c=
onst struct amba_id *id)
> =A0 =A0 =A0 =A0 * irq_chip support
> =A0 =A0 =A0 =A0 */
>
> - =A0 =A0 =A0 if (chip->irq_base =3D=3D NO_IRQ)
> + =A0 =A0 =A0 if (chip->irq_base <=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> =A0 =A0 =A0 =A0writeb(0, chip->base + GPIOIE); /* disable irqs */
> diff --git a/include/linux/amba/pl061.h b/include/linux/amba/pl061.h
> index 2412af9..fb83c04 100644
> --- a/include/linux/amba/pl061.h
> +++ b/include/linux/amba/pl061.h
> @@ -7,7 +7,7 @@ struct pl061_platform_data {
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0gpio_base;
>
> =A0 =A0 =A0 =A0/* number of the first IRQ.
> - =A0 =A0 =A0 =A0* If the IRQ functionality in not desired this must =
be set to NO_IRQ.
> + =A0 =A0 =A0 =A0* If the IRQ functionality in not desired this must =
be set to 0.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0irq_base;
>
> --
> 1.7.5.4
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
