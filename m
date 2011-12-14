From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/9] gpio: pl061: use chained_irq_* functions in irq handler
Date: Wed, 14 Dec 2011 14:15:19 -0700
Message-ID: <CACxGe6uAEUXe=7B5c0yDdRWpMx-_d=dwc5wofh3FYaUN=EZQQg@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-5-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-5-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Use chained_irq_enter/exit helper functions instead of direct pointer
> accesses. This is needed for generic irq chip conversion.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> Cc: Linus Walleij <linus.ml.walleij@gmail.com>
> ---
> =A0drivers/gpio/gpio-pl061.c | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 4102f63..0f718f9 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -23,6 +23,7 @@
> =A0#include <linux/amba/bus.h>
> =A0#include <linux/amba/pl061.h>
> =A0#include <linux/slab.h>
> +#include <asm/mach/irq.h>
>
> =A0#define GPIODIR 0x400
> =A0#define GPIOIS =A00x404
> @@ -211,8 +212,9 @@ static void pl061_irq_handler(unsigned irq, struc=
t irq_desc *desc)
> =A0 =A0 =A0 =A0struct list_head *chip_list =3D irq_get_handler_data(i=
rq);
> =A0 =A0 =A0 =A0struct list_head *ptr;
> =A0 =A0 =A0 =A0struct pl061_gpio *chip;
> + =A0 =A0 =A0 struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
>
> - =A0 =A0 =A0 desc->irq_data.chip->irq_ack(&desc->irq_data);
> + =A0 =A0 =A0 chained_irq_enter(irqchip, desc);
> =A0 =A0 =A0 =A0list_for_each(ptr, chip_list) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long pending;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int offset;
> @@ -227,7 +229,7 @@ static void pl061_irq_handler(unsigned irq, struc=
t irq_desc *desc)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for_each_set_bit(offset, &pending, PL0=
61_GPIO_NR)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0generic_handle_irq(pl0=
61_to_irq(&chip->gc, offset));
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 desc->irq_data.chip->irq_unmask(&desc->irq_data);
> + =A0 =A0 =A0 chained_irq_exit(irqchip, desc);
> =A0}
>
> =A0static int pl061_probe(struct amba_device *dev, const struct amba_=
id *id)
> --
> 1.7.5.4
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
