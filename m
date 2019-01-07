Return-Path: <SRS0=9cDv=PP=baylibre.com=bgolaszewski@kernel.org>
MIME-Version: 1.0
References: <20190103161329.15235-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103161329.15235-1-thomas.petazzoni@bootlin.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 7 Jan 2019 10:54:46 +0100
Message-ID: <CAMpxmJUMqdMca6Q=jOLc0GAUfDcY-+3cR8wija+19ALp2DwRBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: pca953x: document the nxp,pcal6416
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

czw., 3 sty 2019 o 17:13 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa=C5=82(a):
>
> The NXP PCAL6416 is a variant of the PCA GPIO expander, with 16 GPIOs.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index a3f95d7b6c55..2fb1bfec4f13 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -16,6 +16,7 @@ Required properties:
>         nxp,pca9574
>         nxp,pca9575
>         nxp,pca9698
> +       nxp,pcal6416
>         nxp,pcal6524
>         nxp,pcal9555a
>         maxim,max7310
> --
> 2.20.1
>

Queued for v5.1, thanks!

Bartosz
