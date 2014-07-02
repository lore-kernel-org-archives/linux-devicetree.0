From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Add reset controllers for STiH407 SoC
Date: Wed,  2 Jul 2014 15:08:45 +0100
Message-ID: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds reset controller support for the STiH407 SoC.

Changes since v1
 - Update copyright to 2014
 - Add const qualifier
 - Fix various whitespace issues
 - Remove THIS_OWNER
 - Move DT documentation into separate patch

Peter Griffin (4):
  reset: stih407: Add softreset, powerdown and picophy controllers
  reset: sti: Document sti-picophyreset controllers bindings.
  ARM: sti: Add STiH407 Kconfig entry to select STIH407_RESET
  ARM: sti: Add STiH407 reset controller support.

 .../bindings/reset/st,sti-picophyreset.txt         |  42 ++++++
 arch/arm/boot/dts/stih407.dtsi                     |  16 +++
 arch/arm/mach-sti/Kconfig                          |  10 ++
 drivers/reset/sti/Kconfig                          |   4 +
 drivers/reset/sti/Makefile                         |   1 +
 drivers/reset/sti/reset-stih407.c                  | 158 +++++++++++++++++++++
 .../dt-bindings/reset-controller/stih407-resets.h  |  61 ++++++++
 7 files changed, 292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
 create mode 100644 drivers/reset/sti/reset-stih407.c
 create mode 100644 include/dt-bindings/reset-controller/stih407-resets.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
