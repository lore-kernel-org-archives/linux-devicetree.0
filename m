From: Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Subject: [PATCH 0/2] Add driver for AXM55xx SSP chip selects
Date: Mon,  1 Sep 2014 14:53:39 +0200
Message-ID: <1409576021-24828-1-git-send-email-anders.berg@avagotech.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver enables control of the SSP/SPI chip-select signals as GPIOs on the
AXM55xx device.

Anders Berg (2):
  gpio: Add driver for AXM55xx SSP chip selects
  Documentation: DT bindings for AXM55xx SSP CS

 .../devicetree/bindings/gpio/gpio-axxia-sspcs.txt  |  36 ++++++
 drivers/gpio/Kconfig                               |   8 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-axxia-ssp.c                      | 128 +++++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-axxia-sspcs.txt
 create mode 100644 drivers/gpio/gpio-axxia-ssp.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
