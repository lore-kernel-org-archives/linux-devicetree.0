Return-Path: <SRS0=2uIh=RZ=baylibre.com=bgolaszewski@kernel.org>
MIME-Version: 1.0
References: <20190321092145.14896-1-geert+renesas@glider.be> <20190321092145.14896-2-geert+renesas@glider.be>
In-Reply-To: <20190321092145.14896-2-geert+renesas@glider.be>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 22 Mar 2019 16:46:52 +0100
Message-ID: <CAMpxmJU4ni8=P+BTH7YyX+p2xAc1+h3MA5wBqBpDHMCoSK8X7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Document onnn,cat9554
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

czw., 21 mar 2019 o 10:21 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> with 8 GPIOs and interrupt functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Split DT binding doc and driver update in separate patches.
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  1 file changed, 1 insertion(+)
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
> --
> 2.17.1
>

Both applied to for-next.

Thanks,
Bart
