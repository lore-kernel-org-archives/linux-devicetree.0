From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/4] gpio: API boundary cleanups
Date: Tue, 10 Sep 2019 10:50:55 +0200
Message-ID: <CAMpxmJVrQ92+ULRrzyN52LwEcdPTuK7OZssZjUcRPRSTBQ=fwg@mail.gmail.com>
References: <20190906084539.21838-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906084539.21838-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

pt., 6 wrz 2019 o 10:45 Geert Uytterhoeven <geert+renesas@glider.be> napisa=
=C5=82(a):
>
>         Hi Linus, Bartosz,
>
> This patch series contains various API boundary cleanups for gpiolib:
>   - The first two patches make two functions private,
>   - The last two patches switch the remaining gpiolib exported functions
>     from EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL().
>
> After this there is only a single GPIO driver function exported with
> EXPORT_SYMBOL();
>
>     drivers/gpio/gpio-htc-egpio.c:EXPORT_SYMBOL(htc_egpio_get_wakeup_irq)=
;
>
> I believe this symbol was never used upstream, and may be a relic of the
> original out-of-tree code the htc-egpio was based on.  I don't know if
> there (still) exist out-of-tree users of the symbol.
>
> Thanks for your comments!

All looks good to me. Are you fine with this being picked up after the
v5.4 merge window?

Bart

>
> Geert Uytterhoeven (4):
>   gpio: of: Make of_get_named_gpiod_flags() private
>   gpio: of: Make of_gpio_simple_xlate() private
>   gpio: of: Switch to EXPORT_SYMBOL_GPL()
>   gpio: devres: Switch to EXPORT_SYMBOL_GPL()
>
>  drivers/gpio/gpiolib-devres.c | 28 ++++++++++++++--------------
>  drivers/gpio/gpiolib-of.c     | 16 ++++++++--------
>  drivers/gpio/gpiolib-of.h     |  7 -------
>  include/linux/of_gpio.h       | 11 -----------
>  4 files changed, 22 insertions(+), 40 deletions(-)
>
> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
