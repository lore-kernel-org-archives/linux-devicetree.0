From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v4 3/8] gpio: generic: add DT support for generic
 memory-mapped GPIOs
Date: Thu, 28 Apr 2016 12:58:03 +0300
Message-ID: <CAHp75VeSf_=rQBRQ+1ox=fn7aJ53mGg_huH7HRbZck0HEhxBAQ@mail.gmail.com>
References: <cover.1461806071.git.chunkeey@googlemail.com>
	<a5d6bb7bb73ff9396c9e8053a8e8e0975b857934.1461806071.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <a5d6bb7bb73ff9396c9e8053a8e8e0975b857934.1461806071.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 12:05 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> This patch adds support for defining memory-mapped GPIOs
> which provide a compatible interface for the existing
> generic-gpio driver.

> +static inline void set_resource_address(struct resource *res,
> +                                       resource_size_t start,
> +                                       resource_size_t len)
> +{
> +       res->start =3D start;
> +       res->end =3D start + len - 1;
> +}

It might make sense to put this in the generic (resource related, e.g.
ioport.h) header. There are plenty users of such already and who knows
how many will come.

>  #include <linux/bitops.h>
>  #include <linux/platform_device.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

Perhaps + empty line?

> +#include "gpio-mmio-compat.h"

[]

> +#ifdef CONFIG_OF
> +static int bgpio_basic_mmio_parse_dt(struct platform_device *pdev,
> +                                    struct bgpio_pdata *pdata,
> +                                    unsigned long *flags)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       int err;
> +
> +       err =3D of_property_read_u32(dev->of_node, "ngpio", &pdata->n=
gpio);
> +       if (err && err !=3D -EINVAL)
> +               return err;

I think check for -EINVAL needs explanation.

> +}

[]

> +       pdata =3D bgpio_parse_dt(pdev, &flags);
> +       if (IS_ERR(pdata)) {
> +               return PTR_ERR(pdata);

> +       } else if (!pdata) {

Redundant else

> +               pdata =3D dev_get_platdata(dev);
> +               flags =3D pdev->id_entry->driver_data;
> +       }
>
>         r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat=
");
>         if (!r)
> @@ -646,6 +734,9 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
>  static struct platform_driver bgpio_driver =3D {
>         .driver =3D {
>                 .name =3D "basic-mmio-gpio",

> +#ifdef CONFIG_OF

Doesn't of_match_ptr do this for you?


> +               .of_match_table =3D of_match_ptr(bgpio_of_match),
> +#endif

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
