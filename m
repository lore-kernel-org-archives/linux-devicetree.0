From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v2 0/6] pinctrl: aspeed: Fixes for g5, implement remaining pins
Date: Thu,  3 Nov 2016 01:07:55 +1030
Message-ID: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This is v2 of the series implementing the remainder of the pinmux tables for
the AST2400 and AST2500 SoCs. v1 of the series can be found here:

https://lkml.org/lkml/2016/9/27/309

The first patch, "pinctrl-aspeed-g5: Never set SCU90[6]", is another fix that
should be applied for 4.9. Please let me know if I should send such patches
separately, as the series otherwise targets 4.10.

v2 is based on 4.9-rc2 as requested in feedback on v1.

Cheers,

Andrew

Significant changes since v1:

* Fixes from v1 have been applied, so have been dropped for v2
* A new fix has appeared, "pinctrl-aspeed-g5: Never set SCU90[6]", as noted
  above
* New bindings documents for the SoC Display and LPC Host Controllers, driven
  by the patch "pinctrl: aspeed: Read and write bits in LPCHC and GFX
  controllers"
* The v1 patch "pinctrl: aspeed: Enable capture of off-SCU pinmux state" has
  been significantly reworked and is now titled "pinctrl: aspeed: Read and
  write bits in LPCHC and GFX controllers"

Andrew Jeffery (6):
  pinctrl-aspeed-g5: Never set SCU90[6]
  mfd: dt: Add bindings for the Aspeed SoC Display Controller (GFX)
  mfd: dt: Add bindings for the Aspeed LPC Host Controller (LPCHC)
  pinctrl: aspeed: Read and write bits in LPCHC and GFX controllers
  pinctrl: aspeed-g4: Add mux configuration for all pins
  pinctrl: aspeed-g5: Add mux configuration for all pins

 .../devicetree/bindings/mfd/aspeed-gfx.txt         |   17 +
 .../devicetree/bindings/mfd/aspeed-lpchc.txt       |   17 +
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   86 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1115 +++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 1514 +++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |   66 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |   33 +-
 7 files changed, 2760 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
