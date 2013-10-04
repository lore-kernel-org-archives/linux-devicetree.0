From: "Sherman Yin" <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Add Broadcom Capri pinctrl driver
Date: Thu, 3 Oct 2013 17:23:15 -0700
Message-ID: <1380846199-12829-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following patches adds a pinctrl driver for Broadcom Capri (BCM281xx) SoCs.
The first patch, adding the void * to pinctrl_pin_desc, has been previously
discussed with LinusW.  See this thread:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/165880.html

Sherman Yin (4):
  pinctrl: Add void * to pinctrl_pin_desc
  pinctrl: Add pinctrl binding for Broadcom Capri SoCs
  ARM: pinctrl: Add Broadcom Capri pinctrl driver
  pinctrl: Enable pinctrl for Broadcom Capri SoCs

 .../bindings/pinctrl/brcm,capri-pinctrl.txt        |  419 +++++
 arch/arm/boot/dts/bcm11351.dtsi                    |    4 +
 arch/arm/mach-bcm/Kconfig                          |    2 +
 drivers/pinctrl/Kconfig                            |   10 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-capri.c                    | 1727 ++++++++++++++++++++
 include/linux/pinctrl/pinctrl.h                    |    2 +
 7 files changed, 2165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,capri-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-capri.c

-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
