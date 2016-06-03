From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/2] gpio: of: Support cascaded GPIO
Date: Fri,  3 Jun 2016 23:26:54 +0300
Message-ID: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

These two patches enable GPIO cascades where a match may be
retried until the finalr real GPIO is located.

The first patch removes the const specifier from gpiospec at of_xlate(),
while the second introduces the new method of_gpiochip_find() that
performs the cascade operation.

Pantelis Antoniou (2):
  gpio: Remove const from gpiospec in of_xlate
  gpio: Support cascaded GPIO chip lookup for OF

 drivers/gpio/gpio-brcmstb.c |  2 +-
 drivers/gpio/gpio-davinci.c |  2 +-
 drivers/gpio/gpio-etraxfs.c |  2 +-
 drivers/gpio/gpio-lpc32xx.c |  2 +-
 drivers/gpio/gpio-pxa.c     |  2 +-
 drivers/gpio/gpiolib-of.c   | 18 +++++----------
 drivers/gpio/gpiolib.c      | 54 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h      | 14 ++++++++++++
 include/linux/gpio/driver.h |  2 +-
 include/linux/of_gpio.h     |  2 +-
 10 files changed, 80 insertions(+), 20 deletions(-)

-- 
1.7.12

