From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/2] gpiolib: Improve open-drain and open-source GPIO support
Date: Tue, 13 Oct 2015 00:20:19 +0300
Message-ID: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

These two patches try to improve open-drain and open-source (collectively
referred to as single-ended) GPIO support in the gpiolib core.

The first patch splits GPIO flag parsing and GPIO configuration into two
operation to allow gpiochip drivers to reject GPIO requests with flags that
don't match the device capabilities.

The second patch builds on top of "[PATCH v2] gpio: add DT bindings for
existing consumer flags" (http://marc.info/?l=linux-gpio&m=144378527414721&w=2)
to enable usage of the single-ended flag.

Laurent Pinchart (2):
  gpiolib: Split GPIO flags parsing and GPIO configuration
  gpiolib: Add and use OF_GPIO_SINGLE_ENDED flag

 drivers/gpio/gpiolib-legacy.c |  8 ++---
 drivers/gpio/gpiolib.c        | 70 ++++++++++++++++++++++++++++++++-----------
 include/linux/of_gpio.h       |  1 +
 3 files changed, 58 insertions(+), 21 deletions(-)

-- 
Regards,

Laurent Pinchart
