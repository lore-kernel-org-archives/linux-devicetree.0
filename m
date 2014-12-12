From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Subject: [Patch v4 0/2] gpio: add GPIO hogging mechanism
Date: Fri, 12 Dec 2014 16:07:29 -0600
Message-ID: <1418422051-9471-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set re-introduces the gpio hogging concept first 
presented by Boris Brezillion.
This patch set provides a way to initally configure specific GPIO
when the gpio controller is probed.

The actual DT scanning to collect the GPIO specific data is performed
as part of the of_gpiochip_add().

The purpose of this is to allows specific GPIOs to be configured
without any driver specific code.
This particularly useful because board design are getting
increasingly complex and given SoC pins can now have upward
of 10 mux values a lot of connections are now dependent on
external IO muxes to switch various modes and combination.

Specific drivers should not necessarily need to be aware of
what accounts to a specific board implementation. This board level
"description" should be best kept as part of the dts file.

Changes since v3:
 * Relocated the non-DT "hog" function to gpiolib.c.
 * Rename some of the function to be clearer and remove _ prefixes.
 * Replace the gpiod_request/gpiod_put usage with
   gpiochip_request_own_desc/free_own_desc version instead.
 * Refactor some of the logic to better handle error condition/reporting
 * Renamed the "direction" DT properties to "state".

Changes since v2:
 * Refactor the gpio-hog mechanism to split the DT related action
   from the actual "hogging" operation.
 * This allows non-DT providers to implement hogs as well.
 * Added FLAG_IS_HOGGED to mark hogged gpio and make gpiochip removal
   able to release hogged gpio.
 * Similarly to the hogging, the cleanup is performed as part of
   of_gpiochip_remove

Changes since v1:
 * Split the devicetree bindings documentation in its own patch.
 * Refactor the gpio-hog mechanism as private functions meant to
   be to invoked from of_gpiochip_add().

Benoit Parrot (2):
  gpio: add GPIO hogging mechanism
  gpio: Document GPIO hogging mechanism

 Documentation/devicetree/bindings/gpio/gpio.txt |  23 +++++
 drivers/gpio/gpiolib-of.c                       | 119 ++++++++++++++++++++++
 drivers/gpio/gpiolib.c                          | 128 ++++++++++++++++++++----
 drivers/gpio/gpiolib.h                          |   3 +
 4 files changed, 253 insertions(+), 20 deletions(-)

-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
