From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/5] gpio: of: Add error handling and support for multiple gpio in gpio-hog
Date: Fri, 11 Mar 2016 19:13:19 +0530
Message-ID: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: bparrot-l0cyMroinI0@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series enhance the error print by adding error number in print message,
handle the error if gpio_hogd() fails and returns error to caller, and 
add the support of multiple GPIOs to be passed from property "gpios" under
gpio hogd node.

Changes from V1:
- revert the chnage of error message.
- Collected acks/reviewed by.
- Added label for name in gpio hog node.
- Reseeunce to have dt doc before driver change.

Laxman Dewangan (5):
  gpio: of: Scan available child node for gpio-hog
  gpio: gpiolib: Print error number if gpio hog failed
  gpio: of: Return error if gpio hog configuration failed
  gpio: DT: Rephrase "gpios" of hog node to support multiple gpios
  gpio: of: Add support to have multiple gpios in gpio-hog

 Documentation/devicetree/bindings/gpio/gpio.txt | 11 +++-
 drivers/gpio/gpiolib-of.c                       | 86 +++++++++++++++++++------
 drivers/gpio/gpiolib.c                          | 11 ++--
 3 files changed, 79 insertions(+), 29 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
