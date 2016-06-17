From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: Add support for the WP8548 and mangOH Board
Date: Fri, 17 Jun 2016 12:42:08 +0200
Message-ID: <1466160132-24574-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to support the Qualcomm MDM9615 in the Sierra Wireless WP8548
Modules, and on the open hardware mangOH board WP8548 DTSI, mangOH board DTS
and corresponding dt-bindings..

This patchset depends on pinctrl [1], clk [2], pmic [3], arm-soc [4],
arm-soc-dt [5], usb-hsic [6], gpio-sx150x [7] patchsets.

This patchset is part of a global SoC + Module + Board support for the
Sierra Wireless mangOH Board support with the WP8548 module.

[1] http://lkml.kernel.org/r/1466158535-17962-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[2] http://lkml.kernel.org/r/1466157875-14428-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[3] http://lkml.kernel.org/r/1466158929-19524-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[4] http://lkml.kernel.org/r/1466159484-21858-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[5] http://lkml.kernel.org/r/1466159704-22774-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[6] http://lkml.kernel.org/r/1466159119-20310-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[7] http://lkml.kernel.org/r/1466157063-10955-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

Neil Armstrong (4):
  dt-bindings: vendor-prefixes: Add Sierra Wireless
  dt-bindings: arm: Add Sierra Wireless modules bindings
  ARM: dts: Add Sierra Wireless WP8548 dtsi
  ARM: dts: Add WP8548 based MangOH Green board DTS

 Documentation/devicetree/bindings/arm/swi.txt      |  12 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/swi-wp8548-mangoh-green.dts      | 290 +++++++++++++++++++++
 arch/arm/boot/dts/swi-wp8548.dtsi                  | 182 +++++++++++++
 5 files changed, 487 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/swi.txt
 create mode 100644 arch/arm/boot/dts/swi-wp8548-mangoh-green.dts
 create mode 100644 arch/arm/boot/dts/swi-wp8548.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
