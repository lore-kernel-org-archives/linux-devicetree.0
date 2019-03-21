Return-Path: <SRS0=jHhf=RY=baylibre.com=bgolaszewski@kernel.org>
MIME-Version: 1.0
References: <20190320103600.20875-1-geert+renesas@glider.be>
In-Reply-To: <20190320103600.20875-1-geert+renesas@glider.be>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 21 Mar 2019 10:03:48 +0100
Message-ID: <CAMpxmJUSwR8FSkMAQsSvpRHYRDLiheJb02r7imkA=zOhoQFkJg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for CAT9554
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, linux-devicetree <devicetree@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

=C5=9Br., 20 mar 2019 o 11:36 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> with 8 GPIOs and interrupt functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  drivers/gpio/gpio-pca953x.c                             | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index fb144e2b65226601..8678df2a5713a9af 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -30,6 +30,7 @@ Required properties:
>         ti,tca6424
>         ti,tca9539
>         ti,tca9554
> +       onnn,cat9554
>         onnn,pca9654
>         exar,xra1202
>   - gpio-controller: if used as gpio expander.
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 7e76830b33682aa3..88c94d155e218535 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1167,6 +1167,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>         { .compatible =3D "ti,tca6416", .data =3D OF_953X(16, PCA_INT), }=
,
>         { .compatible =3D "ti,tca6424", .data =3D OF_953X(24, PCA_INT), }=
,
>
> +       { .compatible =3D "onnn,cat9554", .data =3D OF_953X( 8, PCA_INT),=
 },
>         { .compatible =3D "onnn,pca9654", .data =3D OF_953X( 8, PCA_INT),=
 },
>
>         { .compatible =3D "exar,xra1202", .data =3D OF_953X( 8, 0), },
> --
> 2.17.1
>

Hi Geert,

I'm seeing that historically we always would split the patches adding
the new compatible to the DT bindings and the actual support
implementation into separate commits. Could you do the same here?

Thanks,
Bart
