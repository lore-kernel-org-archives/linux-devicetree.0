From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] gpio: DT bindings, move tca9554 from pcf857x to pca953x
Date: Wed, 26 Apr 2017 09:56:36 +0200
Message-ID: <CAMuHMdWnyfjViD=MvHJn7jFV3OdbUvR7TzqGMfx2igEVU6J+bw@mail.gmail.com>
References: <20170421124631.19269-1-anders@chargestorm.se> <20170421124631.19269-2-anders@chargestorm.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170421124631.19269-2-anders@chargestorm.se>
Sender: linux-gpio-owner@vger.kernel.org
To: Anders Darander <anders@chargestorm.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 21, 2017 at 2:46 PM, Anders Darander <anders@chargestorm.se> wrote:
> The TCA9554 is similar to the PCA9554. Update the DT binding docs.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index e63935710011..7f57271df2bc 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -26,6 +26,7 @@ Required properties:
>         ti,tca6416
>         ti,tca6424
>         ti,tca9539
> +       ti,tca9554
>         onsemi,pca9654
>         exar,xra1202
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
> index ada4e2973323..7d3bd631d011 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
> @@ -25,7 +25,6 @@ Required Properties:
>      - "nxp,pcf8574": For the NXP PCF8574
>      - "nxp,pcf8574a": For the NXP PCF8574A
>      - "nxp,pcf8575": For the NXP PCF8575
> -    - "ti,tca9554": For the TI TCA9554
>
>    - reg: I2C slave address.

BTW, gpio-pca953x.txt seems to lack lots of gpio-controller-related properties.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
