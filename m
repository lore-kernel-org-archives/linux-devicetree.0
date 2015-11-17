From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 0/2] gpiolib: Initializing GPIOs using DT property gpio-initval
Date: Tue, 17 Nov 2015 11:07:56 +0100
Message-ID: <1447754878-21099-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I completely forgot this series. Here is an update.

This series adds a gpio-initval property to the devicetree. It provides a way
to initialize GPIOs to a defined value.

In v3 I splitted the patch into dt-bindings and the gpiolib patch. This series
is now based on v4.4-rc1. gpiod_initialize() does not use common code with
gpiod_hog anymore.

Best Regards,

Markus


Markus Pargmann (2):
  dt-bindings: GPIO: Add gpio-initval
  gpiolib: Add GPIO initialization

 Documentation/devicetree/bindings/gpio/gpio.txt | 34 ++++++++++++++++---------
 drivers/gpio/gpiolib-of.c                       | 13 ++++++----
 drivers/gpio/gpiolib.c                          | 24 +++++++++++++++++
 drivers/gpio/gpiolib.h                          |  2 ++
 4 files changed, 56 insertions(+), 17 deletions(-)

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
