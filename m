From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/2] gpio: Add driver for SPI serializers
Date: Mon, 25 Jan 2016 10:37:29 -0600
Message-ID: <1453739851-31839-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a GPI(General Purpose Input) driver for generic
parallel-in/serial-out shift registers, such as the SN65HVS882
that this driver was tested on. This should also work for the rest
of the SN65HVS88x series as well as other 74x165 style devices.

Changes from v1[0]:
 - Use new gpiochip_add_data
 - Rebased on v4.5-rc1
 - Small fixes

[0] http://www.spinics.net/lists/linux-gpio/msg10563.html

Andrew F. Davis (2):
  dt-bindings: GPIO: Add generic serializer binding
  gpio: Add driver for SPI serializers

 .../devicetree/bindings/gpio/gpio-pisosr.txt       |  34 ++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-pisosr.c                         | 188 +++++++++++++++++++++
 4 files changed, 229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
 create mode 100644 drivers/gpio/gpio-pisosr.c

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
