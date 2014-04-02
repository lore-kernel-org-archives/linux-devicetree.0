From: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] pinctrl: Rename Broadcom Capri pinctrl driver
Date: Wed, 2 Apr 2014 15:40:36 -0700
Message-ID: <1396478439-16586-1-git-send-email-syin@broadcom.com>
References: <1390509887-19278-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390509887-19278-1-git-send-email-syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To be consistent with other Broadcom drivers, the Broadcom Capri pinctrl
driver and its related CONFIG option are renamed to bcm281xx.

Devicetree compatible string and binding documentation use
"brcm,bcm11351-pinctrl" to match the machine binding here:
Documentation/devicetree/bindings/arm/bcm/bcm11351.txt

This driver supports pinctrl on BCM11130, BCM11140, BCM11351, BCM28145
and BCM28155 SoCs.

Signed-off-by: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
v3: removed the device tree/compatible string portion of changes which
    were already accepted in 3.14-rc6.  Fixed typo in documentation.
v2: split single patch into 4 patches

Sherman Yin (3):
  pinctrl: Rename Broadcom Capri pinctrl driver
  Update bcm_defconfig with new pinctrl CONFIG
  pinctrl: fix typo in bindings documentation

 .../bindings/pinctrl/brcm,bcm11351-pinctrl.txt     |    2 +-
 arch/arm/configs/bcm_defconfig                     |    2 +-
 drivers/pinctrl/Kconfig                            |    8 +-
 drivers/pinctrl/Makefile                           |    2 +-
 .../{pinctrl-capri.c => pinctrl-bcm281xx.c}        | 1519 ++++++++++----------
 5 files changed, 770 insertions(+), 763 deletions(-)
 rename drivers/pinctrl/{pinctrl-capri.c => pinctrl-bcm281xx.c} (25%)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
