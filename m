From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 2/3] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Fri, 6 May 2016 14:44:14 +0300
Message-ID: <CAHp75VcDPY+LbV5+j9DUMJ8Ws=O9=+KmAa9Nog-JuKkPGAM6Cw@mail.gmail.com>
References: <cover.1462372360.git.chunkeey@googlemail.com>
	<50f7f506364f84effd5224677b21726fd2e511a4.1462372360.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <50f7f506364f84effd5224677b21726fd2e511a4.1462372360.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 6, 2016 at 2:10 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> This patch adds support for defining memory-mapped GPIOs which
> are compatible with the existing gpio-mmio interface. The generic
> library provides support for many memory-mapped GPIO controllers
> that are found in various on-board FPGA and ASIC solutions that
> are used to control board's switches, LEDs, chip-selects,
> Ethernet/USB PHY power, etc.
>
> For setting GPIO's there are three configurations:
>         1. single input/output register resource (named "dat"),
>         2. set/clear pair (named "set" and "clr"),
>         3. single output register resource and single input resource
>            ("set" and dat").
>
> The configuration is detected by which resources are present.
> For the single output register, this drives a 1 by setting a bit
> and a zero by clearing a bit.  For the set clr pair, this drives
> a 1 by setting a bit in the set register and clears it by setting
> a bit in the clear register. The configuration is detected by
> which resources are present.
>
> For setting the GPIO direction, there are three configurations:
>         a. simple bidirectional GPIOs that requires no configuration.
>         b. an output direction register (named "dirout")
>            where a 1 bit indicates the GPIO is an output.
>         c. an input direction register (named "dirin")
>            where a 1 bit indicates the GPIO is an input.
>
> The first user for this binding is "wd,mbl-gpio".

Some (mostly) style issues below.

> @@ -569,6 +571,89 @@ static void __iomem *bgpio_map(struct platform_d=
evice *pdev,
>         return devm_ioremap_resource(&pdev->dev, r);
>  }
>
> +#ifdef CONFIG_OF
> +static int bgpio_basic_mmio_parse_dt(struct platform_device *pdev,
> +                                    struct bgpio_pdata *pdata,
> +                                    unsigned long *flags)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       int err;
> +
> +       pdata->base =3D -1;

+ empty line

> +       /* If ngpio property is not specified, of_property_read_u32
> +        * will return -EINVAL. In this case the number of GPIOs is
> +        * automatically determined by the register width. Any
> +        * other error of of_property_read_u32 is due bad data and
> +        * needs to be dealt with.

Couple style issues:
/*
 * First sentence starts here. func() are going with parens.
 */

> +        */
> +       err =3D of_property_read_u32(dev->of_node, "ngpio", &pdata->n=
gpio);
> +       if (err && err !=3D -EINVAL)
> +               return err;
> +
> +       if (of_device_is_big_endian(dev->of_node))
> +               *flags |=3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
> +
> +       if (of_property_read_bool(dev->of_node, "unreadable-reg-set")=
)
> +               *flags |=3D BGPIOF_UNREADABLE_REG_SET;
> +
> +       if (of_property_read_bool(dev->of_node, "unreadable-reg-dir")=
)
> +               *flags |=3D BGPIOF_UNREADABLE_REG_DIR;
> +
> +       if (of_property_read_bool(dev->of_node, "big-endian-byte-orde=
r"))
> +               *flags |=3D BGPIOF_BIG_ENDIAN;
> +
> +       if (of_property_read_bool(dev->of_node, "read-output-reg-set"=
))
> +               *flags |=3D BGPIOF_READ_OUTPUT_REG_SET;
> +
> +       if (of_property_read_bool(dev->of_node, "no-output"))
> +               *flags |=3D BGPIOF_NO_OUTPUT;
> +       return 0;
> +}
> +
> +#define ADD_GPIO_OF(_name, _func) { .compatible =3D _name, .data =3D=
 _func }
> +
> +static const struct of_device_id bgpio_of_match[] =3D {
> +       ADD_GPIO_OF("wd,mbl-gpio", bgpio_basic_mmio_parse_dt),
> +       { }
> +};
> +#undef ADD_GPIO_OF
> +MODULE_DEVICE_TABLE(of, bgpio_of_match);
> +
> +static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pd=
ev,
> +                                         unsigned long *flags)
> +{
> +       const int (*parse_dt)(struct platform_device *,
> +                             struct bgpio_pdata *, unsigned long *);
> +       const struct device_node *node =3D pdev->dev.of_node;
> +       const struct of_device_id *of_id;
> +       struct bgpio_pdata *pdata;
> +       int err =3D -ENODEV;

(1)

> +
> +       of_id =3D of_match_node(bgpio_of_match, node);
> +       if (!of_id)
> +               return NULL;

(2)

Why so?

> +
> +       pdata =3D devm_kzalloc(&pdev->dev, sizeof(struct bgpio_pdata)=
,
> +                            GFP_KERNEL);
> +       if (!pdata)
> +               return ERR_PTR(-ENOMEM);
> +
> +       parse_dt =3D (const void *)of_id->data;
> +       if (parse_dt)
> +               err =3D parse_dt(pdev, pdata, flags);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return pdata;
> +}
> +#else
> +static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pd=
ev,
> +                                         unsigned long *flags)
> +{
> +       return NULL;
> +}
> +#endif /* CONFIG_OF */



--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
