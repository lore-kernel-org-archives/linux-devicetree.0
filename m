From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9] gpio: pl061: enable interrupts with DT style binding
Date: Wed, 14 Dec 2011 14:39:26 -0700
Message-ID: <CACxGe6uzoJeLst+4T3CNArQ-K1CPD6KQjFHg_komrqNsWHR=xQ@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
 <1323876538-20406-9-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323876538-20406-9-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> Enable DT interrupt binding support for pl061 gpio lines. If the gpio
> node has an interrupt-controller property, then it will be setup to
> handle interrupts on gpio lines.
>
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0.../devicetree/bindings/gpio/pl061-gpio.txt =A0 =A0 =A0 =A0| =A0 15 ++=
++++++++
> =A0drivers/gpio/gpio-pl061.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 29 +++++++++++--------
> =A02 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt b/Docu=
mentation/devicetree/bindings/gpio/pl061-gpio.txt
> index a2c416b..9671d4e 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
> @@ -8,3 +8,18 @@ Required properties:
> =A0- gpio-controller : Marks the device node as a GPIO controller.
> =A0- interrupts : Interrupt mapping for GPIO IRQ.
>
> +Optional properties:
> +- interrupt-controller : Identifies the node as an interrupt controller.=
 Must
> + =A0be present if using gpios lines for interrupts.
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> + =A0interrupt source. =A0The type shall be a <u32> and the value shall b=
e 2.
> +
> + =A0The 1st cell contains the interrupt number 0-7 corresponding to the =
gpio
> + =A0line.
> +
> + =A0The 2nd cell is the flags, encoding trigger type and level flags.
> + =A0 =A0 =A0 1 =3D low-to-high edge triggered
> + =A0 =A0 =A0 2 =3D high-to-low edge triggered
> + =A0 =A0 =A0 4 =3D active high level-sensitive
> + =A0 =A0 =A0 8 =3D active low level-sensitive
> +
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 4a1874f..0151798 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -16,6 +16,8 @@
> =A0#include <linux/io.h>
> =A0#include <linux/ioport.h>
> =A0#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> =A0#include <linux/bitops.h>
> =A0#include <linux/workqueue.h>
> =A0#include <linux/gpio.h>
> @@ -52,7 +54,7 @@ struct pl061_gpio {
> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0lock; =A0 =A0 =A0 =
=A0 =A0 /* GPIO registers */
>
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*base;
> - =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base;
> + =A0 =A0 =A0 struct irq_domain =A0 =A0 =A0 *irq_domain;
> =A0 =A0 =A0 =A0struct gpio_chip =A0 =A0 =A0 =A0gc;
> =A0};
>
> @@ -117,18 +119,16 @@ static void pl061_set_value(struct gpio_chip *gc, u=
nsigned offset, int value)
> =A0static int pl061_to_irq(struct gpio_chip *gc, unsigned offset)
> =A0{
> =A0 =A0 =A0 =A0struct pl061_gpio *chip =3D container_of(gc, struct pl061_=
gpio, gc);
> -
> - =A0 =A0 =A0 if (chip->irq_base <=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> -
> - =A0 =A0 =A0 return chip->irq_base + offset;
> + =A0 =A0 =A0 if (!chip->irq_domain)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENXIO;
> + =A0 =A0 =A0 return irq_domain_to_irq(chip->irq_domain, offset);
> =A0}
>
> =A0static int pl061_irq_type(struct irq_data *d, unsigned trigger)
> =A0{
> =A0 =A0 =A0 =A0struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data=
(d);
> =A0 =A0 =A0 =A0struct pl061_gpio *chip =3D gc->private;
> - =A0 =A0 =A0 int offset =3D d->irq - chip->irq_base;
> + =A0 =A0 =A0 int offset =3D d->hwirq;
> =A0 =A0 =A0 =A0unsigned long flags;
> =A0 =A0 =A0 =A0u8 gpiois, gpioibe, gpioiev;
>
> @@ -212,6 +212,7 @@ static void __init pl061_init_gc(struct pl061_gpio *c=
hip, int irq_base)
>
> =A0 =A0 =A0 =A0irq_setup_generic_chip(gc, IRQ_MSK(PL061_GPIO_NR),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_GC_INIT_N=
ESTED_LOCK, IRQ_NOREQUEST, 0);
> + =A0 =A0 =A0 chip->irq_domain =3D gc->domain;

I would expect the driver to store chip->gc =3D gc instead.  Then the
driver has access to both structures, and if ever needed, the gc could
be freed on driver release.

> =A0}
>
> =A0static int pl061_probe(struct amba_device *dev, const struct amba_id *=
id)
> @@ -219,7 +220,7 @@ static int pl061_probe(struct amba_device *dev, const=
 struct amba_id *id)
> =A0 =A0 =A0 =A0struct pl061_platform_data *pdata;
> =A0 =A0 =A0 =A0struct pl061_gpio *chip;
> =A0 =A0 =A0 =A0struct list_head *chip_list;
> - =A0 =A0 =A0 int ret, irq, i;
> + =A0 =A0 =A0 int ret, irq, i, irq_base;
> =A0 =A0 =A0 =A0static DECLARE_BITMAP(init_irq, NR_IRQS);
>
> =A0 =A0 =A0 =A0chip =3D kzalloc(sizeof(*chip), GFP_KERNEL);
> @@ -229,10 +230,13 @@ static int pl061_probe(struct amba_device *dev, con=
st struct amba_id *id)
> =A0 =A0 =A0 =A0pdata =3D dev->dev.platform_data;
> =A0 =A0 =A0 =A0if (pdata) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->gc.base =3D pdata->gpio_base;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->irq_base =3D pdata->irq_base;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base =3D pdata->irq_base;
> =A0 =A0 =A0 =A0} else if (dev->dev.of_node) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->gc.base =3D -1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->irq_base =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_get_property(dev->dev.of_node, "inte=
rrupt-controller", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base =3D -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base =3D 0;
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENODEV;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto free_mem;
> @@ -271,10 +275,11 @@ static int pl061_probe(struct amba_device *dev, con=
st struct amba_id *id)
> =A0 =A0 =A0 =A0 * irq_chip support
> =A0 =A0 =A0 =A0 */
>
> - =A0 =A0 =A0 if (chip->irq_base <=3D 0)
> + =A0 =A0 =A0 if (!irq_base)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;

A comment would be useful here as it took a bit for me to work out
what the options are here.  What are the possible values of irq_base
at this point, and what do they mean?

Otherwise looks pretty good.

g.
