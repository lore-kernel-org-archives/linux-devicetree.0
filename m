From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2 0/3] power: reset: vf610 system reset controller
Date: Mon,  1 Dec 2014 18:03:06 +0100
Message-ID: <1417453389-1588-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fkan-qTEPVZfXA3Y@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

This second version does essentially the same as v1, but with a lot
less code due to the usage of syscon and syscon-reboot driver. My
earlier misgivings that it might be a problem for the suspend/resume
implementation later on did not hold true: I tested my prelinear
suspend code and in case the code really needs to access some
registers form assembler, it is possible to map temporarly the
relevant region again.

I refrained from adding POWER_RESET_SYSCON as a hard dependency for
Vybrid (SOC_VF610): In its dual-core configuration, one might want
have the Cortex-M4 in charge of the system reset... Hence the user
should be able to build a kernel without the system reset (beside
the option to create a board specific device tree with disabled
SRC node).

Shawn, the defconfig change is based on the latest (almost-merged?)
defconfig patch.

Changes since v1:
- Total rework using syscon/syscon-reboot capabilities
- Enhance syscon-reboot with priority capabilities (as suggested by Guenter)

Stefan Agner (3):
  power: reset: read priority from device tree
  ARM: dts: vf610: add system reset controller and syscon-reboot
  ARM: imx_v6_v7_defconfig: add POWER_RESET_SYSCON

 .../devicetree/bindings/power/reset/syscon-reboot.txt       |  3 +++
 arch/arm/boot/dts/vf500.dtsi                                |  4 ++++
 arch/arm/boot/dts/vfxxx.dtsi                                | 13 +++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig                        |  8 ++++----
 drivers/power/reset/syscon-reboot.c                         |  5 ++++-
 5 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
