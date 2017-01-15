From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/2] add support for uart_AO_B
Date: Sun, 15 Jan 2017 23:20:27 +0100
Message-ID: <20170115222029.8271-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the uart_AO_B serial port and the related pinctrl nodes to
meson-gx.

Due to a bug in the current GXBB and GXL/GXM pinctrl code uart_AO_B
could not be used when uart_AO(_A) was enabled at the same time. The
reason for this is that uart_AO_A and uart_AO_B were both trying to
request the same pin as their RX pin (GPIOAO_1). uart_AO_B also
requests a second pin for it's RX (GPIOAO_5), which does not make any
sense.
Thus uart_AO_B is changed to only use GPIOAO_5 for RX and GPIOAO_4
for TX, which is also what the Amlogic reference kernel does.

Adding uart_AO_B is preparation work for adding support for the
Khadas VIM and VIM Pro boards, as these are both exposing uart_AO_B
on the pin-header.


Martin Blumenstingl (2):
  pinctrl: meson: fix uart_ao_b for GXBB and GXL/GXM
  ARM64: dts: meson-gx: add the missing uart_AO_B

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 7 +++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 7 +++----
 drivers/pinctrl/meson/pinctrl-meson-gxl.c   | 7 +++----
 5 files changed, 28 insertions(+), 8 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
