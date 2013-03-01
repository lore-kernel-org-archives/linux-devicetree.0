From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] gpio: Add device driver for GRGPIO cores and support
 custom accessors with gpio-generic
Date: Fri, 1 Mar 2013 01:24:01 +0100
Message-ID: <CACRpkdaYQSrzm_Yj3ZH9YZLC_zPJN06X-9ZM9jd7=X0OB1shXQ@mail.gmail.com>
References: <1360653873-25368-1-git-send-email-andreas@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360653873-25368-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Cc: software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2013 at 8:24 AM, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org> wrote:

> This driver supports GRGPIO gpio cores available in the GRLIB VHDL IP
> core library from Aeroflex Gaisler.
>
> This also adds support to gpio-generic for using custom accessor
> functions. The grgpio driver uses this to use ioread32be and iowrite32be
> for big endian register accesses.
>
> Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>

Can you split this in two patches: one that adds the custom accessors
and one that adds the driver?

Grant is currently thinking about optimizations on the call graph
depths of the GPIO functions and may want to take this opportunity
to alter something there.

> +++ b/drivers/gpio/gpio-grgpio.c
(...)
> +struct grgpio_priv {
> +       struct bgpio_chip bgc;
> +       struct grgpio_regs __iomem *regs;
> +
> +       u32 imask;      /* irq mask shadow register */
> +       s32 *irqmap;    /* maps offset to irq or -1 if no irq */

irqmap? Argh what is this... I think you want to use irqdomain
for this instead. (Documentation/IRQ-domain.txt)

Check other GPIO drivers (e.g. STMPE or TC3589x) for some
example of how to use irqdomain.

> +static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct grgpio_priv *priv = grgpio_gc_to_priv(gc);
> +       int index, irq;

This is wher you should use irq_create_mapping(domain, hwirq);

Yours,
Linus Walleij
