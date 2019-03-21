Return-Path: <SRS0=YV71=RY=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] gpio: pca953x: Add support for CAT9554
Date: Thu, 21 Mar 2019 10:21:43 +0100
Message-Id: <20190321092145.14896-1-geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Linus, Bartosz,

The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
with 8 GPIOs and interrupt functionality.

Changes compared to v1:
  - Split DT binding doc and driver update in separate patches.

Thanks!

Geert Uytterhoeven (2):
  dt-bindings: gpio: pca953x: Document onnn,cat9554
  gpio: pca953x: Add support for CAT9554

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 1 +
 2 files changed, 2 insertions(+)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
