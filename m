From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v2 0/3] gpiolib: Initializing GPIOs using DT property gpio-initval
Date: Sun, 30 Aug 2015 09:44:43 +0200
Message-ID: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, chrisrfq@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi,

This is basically a resend with the devicetree mailinglist added to CC.

This series adds a gpio-initval property to the devicetree. It provides a way
to initialize GPIOs to a defined value.

There are 3 patches. The first two simplify the function gpiod_hog. The third
reuses the gpiod_hog()_code for a new gpiod_initialize() and adds the parsing
of the DT.

This series is based on the series
"[PATCH v3 0/9] gpiolib: Add GPIO name support".

Best regards,

Markus


Changes in v2:
 - Fixed Signed-off-by/author


Markus Pargmann (3):
  gpio: Use __gpiod_request directly
  gpiolib: gpiod_hog remove separate name argument
  gpiolib: Add GPIO initialization

 Documentation/devicetree/bindings/gpio/gpio.txt | 29 ++++++----
 drivers/gpio/gpiolib-of.c                       | 11 +++-
 drivers/gpio/gpiolib.c                          | 74 +++++++++++++++++--------
 drivers/gpio/gpiolib.h                          |  6 +-
 4 files changed, 83 insertions(+), 37 deletions(-)

-- 
2.5.0

