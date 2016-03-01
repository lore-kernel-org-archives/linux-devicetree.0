From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] Refactor pinctrl driver for aobus / cbus
Date: Tue,  1 Mar 2016 23:04:32 +0100
Message-ID: <1456869876-19320-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

The rationale behind this patchset is in this thread
http://www.spinics.net/lists/devicetree/msg115019.html

We basically want to introduce in the Amlogic Meson device-tree the CBUS and
AOBUS nodes. To do this we need to split / refactor the pinctrl driver that is
currently accessing at the same time registers on both these buses.

Carlo Caione (4):
  pinctrl: amlogic: Separate some pin functions for Meson8 / Meson8b
  pinctrl: amlogic: Make driver independent from two-domain
    configuration
  ARM: dts: amlogic: Split pinctrl device for Meson8 / Meson8b
  documentation: Fix pinctrl documentation for Meson8 / Meson8b

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  36 +---
 arch/arm/boot/dts/meson8.dtsi                      |  57 ++++---
 arch/arm/boot/dts/meson8b.dtsi                     |  12 +-
 drivers/pinctrl/meson/pinctrl-meson.c              | 135 +++++++--------
 drivers/pinctrl/meson/pinctrl-meson.h              |  21 +--
 drivers/pinctrl/meson/pinctrl-meson8.c             | 137 +++++++++-------
 drivers/pinctrl/meson/pinctrl-meson8b.c            | 182 ++++++++++++---------
 7 files changed, 296 insertions(+), 284 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
