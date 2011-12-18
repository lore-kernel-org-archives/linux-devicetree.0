From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Sun, 18 Dec 2011 23:01:38 +0100
Message-ID: <CACRpkdYu7HCBdAzqNr1pwZMgvZFyBYpcJXYo-RUx5R-U3CJ1BA@mail.gmail.com>
References: <1324203229-15571-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324203229-15571-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 18, 2011 at 11:13 AM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> The Synopsys DesignWare block is used in some ARM devices (picoxcell)
> and can be configured to provide multiple banks of GPIO pins. =A0The first
> bank (A) can also provide IRQ capabilities.

Overall this is looking good.

Here is a problem (I think):

> +static int dwapb_irq_set_type(struct irq_data *d, u32 type)
> +{
> + =A0 =A0 =A0 struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(=
d);
> + =A0 =A0 =A0 struct dwapb_gpio *gpio =3D gc->private;
> + =A0 =A0 =A0 int bit =3D d->hwirq;
> + =A0 =A0 =A0 unsigned long level, polarity;
> +
> + =A0 =A0 =A0 if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_L=
EVEL_LOW))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 level =3D readl(gpio->regs + INT_TYPE_REG_OFFS);
> + =A0 =A0 =A0 polarity =3D readl(gpio->regs + INT_POLARITY_REG_OFFS);
> +
> + =A0 =A0 =A0 if (type & IRQ_TYPE_EDGE_RISING) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 level |=3D (1 << bit);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity |=3D (1 << bit);
> + =A0 =A0 =A0 } else if (type & IRQ_TYPE_EDGE_FALLING) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 level |=3D (1 << bit);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity &=3D ~(1 << bit);

So what if you get request for *both* falling and rising edges?

This is not uncommon at all, for example a GPIO which detecs
MMC card insertions and removals like drivers/host/mmc/mmci.c
will want interrupts on both edges since we want to change state
whenever the card is inserted *or* removed.

If you check drivers/gpio/gpio-u300.c you can see how I handled
this on another hardware where triggering on falling and rising
edges was a binary choice and thus mutually exclusive: I toggle
for each interrupt.

See u300_toggle_trigger(), u300_gpio_irq_type().

So either you do something like that, or you detect both set
and return an error, else the poor caller will just get falling
edges in this driver...

> + =A0 =A0 =A0 } else if (type & IRQ_TYPE_LEVEL_HIGH) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 level &=3D ~(1 << bit);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity |=3D (1 << bit);
> + =A0 =A0 =A0 } else if (type & IRQ_TYPE_LEVEL_LOW) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 level &=3D ~(1 << bit);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity &=3D ~(1 << bit);
> + =A0 =A0 =A0 }

This is OK though, these are mutually exclusive.

Yours,
Linus Walleij
