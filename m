From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Amlogic: GXBB: Add pin controller
Date: Mon,  2 May 2016 10:02:14 +0200
Message-ID: <1462176138-29433-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Patchset to add and enable the pin controller driver on a couple of Amlogic
boards with a Meson GXBB SoC.

Please note that:
* This patch depends on http://www.spinics.net/lists/devicetree/msg120964.html
  ([PATCH] ARM64: dts: amlogic: Add hiu and periphs buses).

* The platform driver is still missing a lot of muxing configurations. This is
  because Amlogic still hasn't publicly released documentation for the GXBB.
  Since Kevin has already this documentation under NDA, he will integrate and
  complete this driver with a separate submission.

Changelog:
* v2:
  - Split patchset in 4 different patches

Carlo Caione (4):
  pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC
  documentation: Add compatibles for Amlogic Meson GXBB pin controllers
  ARM64: Kconfig: Select the Amlogic Meson pin controller driver
  ARM64: dts: amlogic: Enable pin controller on GXBB-based platforms

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   2 +
 arch/arm64/Kconfig.platforms                       |   2 +
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  13 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |   2 +
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  41 ++
 drivers/pinctrl/meson/Makefile                     |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         | 432 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |   8 +
 drivers/pinctrl/meson/pinctrl-meson.h              |   2 +
 include/dt-bindings/gpio/meson-gxbb-gpio.h         | 154 ++++++++
 11 files changed, 660 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gxbb.c
 create mode 100644 include/dt-bindings/gpio/meson-gxbb-gpio.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
