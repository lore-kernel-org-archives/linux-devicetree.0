From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v4 0/2] gpiolib: Initializing GPIOs using DT property gpio-initval
Date: Fri,  4 Dec 2015 14:06:26 +0100
Message-ID: <1449234388-4007-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

sorry for the delay.

Here is the next version of this series. I added gpiod_parse_flags() to the
code for the initialization. Otherwise there are no differences. As the
gpio-hog bindings already exist I didn't change the gpio-initval bindings.

Best Regards,

Markus


Markus Pargmann (2):
  dt-bindings: GPIO: Add gpio-initval
  gpiolib: Add GPIO initialization

 Documentation/devicetree/bindings/gpio/gpio.txt | 34 ++++++++++++++++---------
 drivers/gpio/gpiolib-of.c                       | 13 ++++++----
 drivers/gpio/gpiolib.c                          | 26 +++++++++++++++++++
 drivers/gpio/gpiolib.h                          |  2 ++
 4 files changed, 58 insertions(+), 17 deletions(-)

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
