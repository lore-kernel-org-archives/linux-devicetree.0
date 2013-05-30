From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] GPIO: Add support for dual channel in gpio-xilinx.c
Date: Thu, 30 May 2013 21:46:54 +0200
Message-ID: <CACRpkdY4xaCOe28nu-NrYQ7pafjhj8-xqFcJRF9iJUy3SrCVrA@mail.gmail.com>
References: <4b90b06fce0475b579cfba4d968b4778359154f6.1369826814.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4b90b06fce0475b579cfba4d968b4778359154f6.1369826814.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
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
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2013 at 1:27 PM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

> Supporting the second channel in the driver.
> Offset is 0x8 and both channnels share the same
> IRQ.
>
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

(...)
> +/* Read/Write access to the GPIO registers */
> +#define xgpio_readreg(offset)          __raw_readl(offset)
> +#define xgpio_writereg(offset, val)    __raw_writel(val, offset)

So you're swithing in_be32/out_be32 to the CPU-dependent
__raw_readl/__raw_writel functions? Why?

Can you explain exactly why you are using __raw_* accessors
rather than e.g. atleast readl_relaxed()/writel_relaxed()
or even plain readl/writel so you know the writes will hit
the hardware as immediately as possible?

I'd prefer this step to be a separate patch.

>  struct xgpio_instance {
>         struct of_mm_gpio_chip mmchip;
>         u32 gpio_state;         /* GPIO state shadow register */
>         u32 gpio_dir;           /* GPIO direction shadow register */
> +       u32 offset;
>         spinlock_t gpio_lock;   /* Lock used for synchronization */
>  };

Why not take this opportunity to move the comments out to
kerneldoc above this struct, plus document what "offset"
means.

> -       return (in_be32(mm_gc->regs + XGPIO_DATA_OFFSET) >> gpio) & 1;
> +       return (xgpio_readreg(regs + XGPIO_DATA_OFFSET) >> gpio) & 1;


Another way would be:

#include <linux/bitops.h>

return !!(xgpio_readreg(regs + XGPIO_DATA_OFFSET & BIT(gpio));

> +
> +       pr_info("XGpio: %s: registered, base is %d\n", np->full_name,
> +                                                       chip->mmchip.gc.base);
> +
> +       tree_info = of_get_property(np, "xlnx,is-dual", NULL);

This looks like you want to use of_property_read_bool().

Have you documented these new bindings? It doesn't seem so.
Documentation/devicetree/bindings/gpio/*...

If it's undocumented so far, this is a good oppotunity to add it.

> +       if (tree_info && be32_to_cpup(tree_info)) {
> +               chip = kzalloc(sizeof(*chip), GFP_KERNEL);
> +               if (!chip)
> +                       return -ENOMEM;
> +
> +               /* Add dual channel offset */
> +               chip->offset = XGPIO_CHANNEL_OFFSET;
> +
> +               /* Update GPIO state shadow register with default value */
> +               tree_info = of_get_property(np, "xlnx,dout-default-2", NULL);
> +               if (tree_info)
> +                       chip->gpio_state = be32_to_cpup(tree_info);

This is basically a jam table (hardware set-up) in the device tree.

I don't exactly like this. Is this necessary?

> +               /* Update GPIO direction shadow register with default value */
> +               /* By default, all pins are inputs */
> +               chip->gpio_dir = 0xFFFFFFFF;
> +               tree_info = of_get_property(np, "xlnx,tri-default-2", NULL);
> +               if (tree_info)
> +                       chip->gpio_dir = be32_to_cpup(tree_info);

Dito.

> +               /* Check device node and parent device node for device width */
> +               /* By default assume full GPIO controller */
> +               chip->mmchip.gc.ngpio = 32;
> +               tree_info = of_get_property(np, "xlnx,gpio2-width", NULL);
> +               if (tree_info)
> +                       chip->mmchip.gc.ngpio = be32_to_cpup(tree_info);

Seems fine, but document it in the binding.

Yours,
Linus Walleij
