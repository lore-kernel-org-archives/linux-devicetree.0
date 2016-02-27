From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 0/4] Add support for Amlogic Meson MMC driver
Date: Sat, 27 Feb 2016 19:01:44 +0100
Message-ID: <1456596108-1406-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

This patchset adds support for the MMC driver found on the Meson platforms.

Changelog:

v2:
    * fix typo in commit message
    * avoid the bounce buffer (max_segs == 1)

v3:
    * simplify meson_mmc_map_dma() and fix memory leak

v4:
    * code and documentation cleanup
    * removed redundant variables
    * removed useless printing
    * introduced MMC_CAP2_NO_SDIO
    * removed state machine
    * better spinlocks management and positioning

v5:
    * split submission in several patches
    * update mmc->actual_clock
    * fix timeout value
    * add clk_prepare_enable()
    * add 'meson,sd-port' property

Carlo Caione (4):
  mmc: meson: Document Amlogic Meson MMC DT bindings
  mmc: meson: Add driver for the SD/MMC host found on Amlogic Meson SoCs
  ARM: dts: meson8b: Add MMC nodes
  ARM: multi_v7_defconfig: Add Amlogic Meson MMC support

 .../devicetree/bindings/mmc/meson-mmc.txt          |  30 ++
 arch/arm/boot/dts/meson8b-mxq.dts                  |   8 +
 arch/arm/boot/dts/meson8b-odroidc1.dts             |   8 +
 arch/arm/boot/dts/meson8b.dtsi                     |  16 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/mmc/host/Kconfig                           |   7 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/meson-mmc.c                       | 535 +++++++++++++++++++++
 8 files changed, 606 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/meson-mmc.txt
 create mode 100644 drivers/mmc/host/meson-mmc.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
