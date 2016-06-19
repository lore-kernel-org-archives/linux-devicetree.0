From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] Add Amlogic secure monitor and NVMEM drivers
Date: Sun, 19 Jun 2016 14:38:58 +0200
Message-ID: <1466339944-602-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bjdooks-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

I decided to respin again the secure monitor driver this time with the NVMEM
driver in the same patchset to have a clear view on how a generic driver can
use the monitor.

The latest patchset for the secure monitor with the Changelog is here [1].

[1] http://www.spinics.net/lists/arm-kernel/msg510441.html

Carlo Caione (6):
  firmware: Amlogic: Add secure monitor driver
  documentation: Add secure monitor bindings documentation
  ARM64: dts: amlogic: gxbb: Enable secure monitor
  nvmem: amlogic: Add Amlogic Meson EFUSE driver
  documentation: Add nvmem bindings documentation
  ARM64: dts: amlogic: gxbb: Enable NVMEM

 .../bindings/firmware/meson/meson_sm.txt           |  15 ++
 .../devicetree/bindings/nvmem/amlogic-efuse.txt    |  39 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  24 ++
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/meson/Kconfig                     |   8 +
 drivers/firmware/meson/Makefile                    |   1 +
 drivers/firmware/meson/meson_sm.c                  | 266 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  11 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/meson-efuse.c                        | 130 ++++++++++
 include/linux/firmware/meson/meson_sm.h            |  32 +++
 12 files changed, 530 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
 create mode 100644 Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
 create mode 100644 drivers/firmware/meson/Kconfig
 create mode 100644 drivers/firmware/meson/Makefile
 create mode 100644 drivers/firmware/meson/meson_sm.c
 create mode 100644 drivers/nvmem/meson-efuse.c
 create mode 100644 include/linux/firmware/meson/meson_sm.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
