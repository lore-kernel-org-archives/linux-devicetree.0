From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 3/5] gpio: syscon: Add support for a custom get operation
Date: Thu, 3 Oct 2019 10:24:22 +0200
Message-ID: <CAMpxmJUHPuGPPPFSctyhtfj0oAk6oJ+=mvgN4=7jmLxAfHs45Q@mail.gmail.com>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com> <20190927100407.1863293-4-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927100407.1863293-4-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
<paul.kocialkowski@bootlin.com> napisa=C5=82(a):
>
> Some drivers might need a custom get operation to match custom
> behavior implemented in the set operation.
>
> Add plumbing for supporting that.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/gpio/gpio-syscon.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 31f332074d7d..05c537ed73f1 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -43,8 +43,9 @@ struct syscon_gpio_data {
>         unsigned int    bit_count;
>         unsigned int    dat_bit_offset;
>         unsigned int    dir_bit_offset;
> -       void            (*set)(struct gpio_chip *chip,
> -                              unsigned offset, int value);
> +       int             (*get)(struct gpio_chip *chip, unsigned offset);
> +       void            (*set)(struct gpio_chip *chip, unsigned offset,
> +                              int value);

Why did you change this line? Doesn't seem necessary and pollutes the histo=
ry.

Bart

>  };
>
>  struct syscon_gpio_priv {
> @@ -252,7 +253,7 @@ static int syscon_gpio_probe(struct platform_device *=
pdev)
>         priv->chip.label =3D dev_name(dev);
>         priv->chip.base =3D -1;
>         priv->chip.ngpio =3D priv->data->bit_count;
> -       priv->chip.get =3D syscon_gpio_get;
> +       priv->chip.get =3D priv->data->get ? : syscon_gpio_get;
>         if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
>                 priv->chip.direction_input =3D syscon_gpio_dir_in;
>         if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
> --
> 2.23.0
>
