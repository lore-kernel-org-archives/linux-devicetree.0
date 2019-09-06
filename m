From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] gpio: API boundary cleanups
Date: Fri,  6 Sep 2019 10:45:35 +0200
Message-ID: <20190906084539.21838-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Linus, Bartosz,

This patch series contains various API boundary cleanups for gpiolib:
  - The first two patches make two functions private,
  - The last two patches switch the remaining gpiolib exported functions
    from EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL().

After this there is only a single GPIO driver function exported with
EXPORT_SYMBOL();

    drivers/gpio/gpio-htc-egpio.c:EXPORT_SYMBOL(htc_egpio_get_wakeup_irq);

I believe this symbol was never used upstream, and may be a relic of the
original out-of-tree code the htc-egpio was based on.  I don't know if
there (still) exist out-of-tree users of the symbol.

Thanks for your comments!

Geert Uytterhoeven (4):
  gpio: of: Make of_get_named_gpiod_flags() private
  gpio: of: Make of_gpio_simple_xlate() private
  gpio: of: Switch to EXPORT_SYMBOL_GPL()
  gpio: devres: Switch to EXPORT_SYMBOL_GPL()

 drivers/gpio/gpiolib-devres.c | 28 ++++++++++++++--------------
 drivers/gpio/gpiolib-of.c     | 16 ++++++++--------
 drivers/gpio/gpiolib-of.h     |  7 -------
 include/linux/of_gpio.h       | 11 -----------
 4 files changed, 22 insertions(+), 40 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
