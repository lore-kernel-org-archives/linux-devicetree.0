From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v8 2/3] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Sun, 8 May 2016 19:17:13 +0200
Message-ID: <CAGhQ9VyG6yX+g=FjfB6VP0pUNYGYXo60CHkWmSiiOisjeX20cg@mail.gmail.com>
References: <cover.1462543457.git.chunkeey@googlemail.com>
	<535f785bf6116c0fb6f46afbb77e6d4bd3ef5f60.1462543458.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <535f785bf6116c0fb6f46afbb77e6d4bd3ef5f60.1462543458.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Christian,

On 8 May 2016 at 15:08, Christian Lamparter <chunkeey@googlemail.com> w=
rote:
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
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> ---

> +#define ADD(_name, _func) { .compatible =3D _name, .data =3D _func }

I don't see the point in having a macro for such a simple data
structure, but since this v8 and Linus hasn't complained I guess it's
fine.

Using a macro here makes it impossible to grep for 'compatible'. Doing
'git grep compatible drivers/gpio/' is sometimes very useful to see
which hardware the driver actually supports.

> +static const struct of_device_id bgpio_of_match[] =3D {
> +       ADD("wd,mbl-gpio", bgpio_basic_mmio_parse_dt),
> +       { }
> +};
> +#undef ADD
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
> +
> +       of_id =3D of_match_node(bgpio_of_match, node);
> +       if (!of_id)
> +               return NULL;
> +
> +       pdata =3D devm_kzalloc(&pdev->dev, sizeof(struct bgpio_pdata)=
,
> +                            GFP_KERNEL);
> +       if (!pdata)
> +               return ERR_PTR(-ENOMEM);
> +
> +       parse_dt =3D (const void *)of_id->data;

You can retrieve OF match data using of_device_get_match_data(). Saves
you a couple of lines and better explains what your doing.


> +       if (parse_dt)
> +               err =3D parse_dt(pdev, pdata, flags);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return pdata;
> +}


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
