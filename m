From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Thu, 19 Dec 2013 15:34:30 +0100
Message-ID: <1387463671-1164-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Ben Gamari <bgamari.foss@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Hello,

This a proposal for the GPIO hog concept described by Linus (Walleij).

I know there were work in progress on this subject (Jiri and Ben at least:
https://www.mail-archive.com/linux-gpio@vger.kernel.org/msg00864.html),
so don't hesitate to point out if something similar has already been posted.

Best Regards,

Boris 

Boris BREZILLON (1):
  gpio: add GPIO hogging mechanism

 Documentation/devicetree/bindings/gpio/gpio.txt |   47 ++++++++
 drivers/base/Makefile                           |    1 +
 drivers/base/dd.c                               |    5 +
 drivers/base/gpio.c                             |   59 ++++++++++
 drivers/gpio/devres.c                           |   39 +++++++
 drivers/gpio/gpiolib-of.c                       |  134 +++++++++++++++++++++++
 drivers/gpio/gpiolib.c                          |  103 +++++++++++++++++
 include/linux/device.h                          |    5 +
 include/linux/gpio/consumer.h                   |   25 +++++
 include/linux/gpio/devinfo.h                    |   38 +++++++
 include/linux/of_gpio.h                         |   19 ++++
 11 files changed, 475 insertions(+)
 create mode 100644 drivers/base/gpio.c
 create mode 100644 include/linux/gpio/devinfo.h

-- 
1.7.9.5

