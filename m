From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/6] gpio: Add GPIO driver for Nintendo Wii
Date: Sun, 28 Jan 2018 19:31:58 +0200
Message-ID: <CAHp75VcWshngZFuUp4hzYdD43HF7TZ1sRE3Dh+HckB5do1=gGw@mail.gmail.com>
References: <20180122050411.32460-1-j.neuschaefer@gmx.net> <20180122050411.32460-4-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20180122050411.32460-4-j.neuschaefer@gmx.net>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Albert Herranz <albert_herranz@yahoo.es>, Segher Boessenkool <segher@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 22, 2018 at 7:04 AM, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

Style issues below.

> +#define HW_GPIO_OWNER          0x3c
> +
> +
> +struct hlwd_gpio {

No need extra empty line in between.

> +       struct gpio_chip gpioc;
> +       void __iomem *regs;
> +       struct device *dev;
> +};
> +
> +static int hlwd_gpio_probe(struct platform_device *pdev)
> +{
> +       struct hlwd_gpio *hlwd;
> +       struct resource *regs_resource;
> +       u32 ngpios;
> +       int res;
> +
> +       hlwd =3D devm_kzalloc(&pdev->dev, sizeof(*hlwd), GFP_KERNEL);
> +       if (!hlwd)
> +               return -ENOMEM;
> +

> +       /* Save the struct device pointer so dev_info, etc. can be used. =
*/

Useless.

> +       hlwd->dev =3D &pdev->dev;
> +

> +       regs_resource =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);

> +       if (IS_ERR(regs_resource))
> +               return PTR_ERR(regs_resource);
> +

This is redundant. Below does it for ya.

> +       hlwd->regs =3D devm_ioremap_resource(&pdev->dev, regs_resource);
> +       if (IS_ERR(hlwd->regs))
> +               return PTR_ERR(hlwd->regs);


> +       res =3D bgpio_init(&hlwd->gpioc, &pdev->dev, 4,
> +                       hlwd->regs + HW_GPIOB_IN, hlwd->regs + HW_GPIOB_O=
UT,
> +                       NULL, hlwd->regs + HW_GPIOB_DIR, NULL,
> +                       BGPIOF_BIG_ENDIAN_BYTE_ORDER);

> +

Remove this extra line.

> +       if (res < 0) {
> +               dev_warn(hlwd->dev, "bgpio_init failed: %d\n", res);
> +               return res;
> +       }

> +       if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios))
> +               ngpios =3D 32;

A nit: I would rather go with
res =3D of_property_read(...);
if (res)
  ngpios =3D 32;

--=20
With Best Regards,
Andy Shevchenko
