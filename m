From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] of/gpio: Automatic handling of devicetree open-drain GPIO specifications.
Date: Tue, 11 Feb 2014 11:49:58 -0800
Message-ID: <1392148200-5393-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Add two new flags for open-drain and open-source GPIOs and the
corresponding handling in gpiod_get() to automatically set the
corresponding flags in the GPIO system.

Changes from v1 (suggested by Alexandre Courbot):

  o Add OF_GPIO_OPEN_SOURCE
  o Add automatic propagation of the flags in gpiod_get() et al.

David Daney (2):
  of/gpio: Define OF_GPIO_OPEN_DRAIN and OF_GPIO_OPEN_SOURCE flags.
  of/gpio: Automatically decode OF_GPIO_OPEN_DRAIN and
    OF_GPIO_OPEN_SOURCE flags in gpiolib.

 drivers/gpio/gpiolib.c  | 6 ++++++
 include/linux/of_gpio.h | 2 ++
 2 files changed, 8 insertions(+)

-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
