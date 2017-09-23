From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] soc: amlogic: Add Meson6/8/8b SoC Information driver
Date: Sat, 23 Sep 2017 16:14:00 +0200
Message-ID: <20170923141403.20882-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The 32-bit Amlogic SoC have some registers which contain some information
the SoC's major and version, as well as a "major version".
This patchset adds support for this register decoding and exposing with the
SoC bus infrastructure, with dt-bindings and DT node.

This is inspired by Neil's Meson GX socinfo driver, see [0]

All information was taken from Amlogic's 3.10 GPL kernel sources because
the public S805 datasheet from Hardkernel does not contain any relevant
information for these register blocks.


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/004187.html

Martin Blumenstingl (3):
  dt-bindings: Amlogic: add documentation for the SoC info register
    areas
  soc: amlogic: Add Meson6/Meson8/Meson8b/Meson8m2 SoC Information
    driver
  ARM: dts: meson: add SoC information nodes

 .../devicetree/bindings/arm/amlogic/analog-top.txt |  20 +++
 .../devicetree/bindings/arm/amlogic/assist.txt     |  17 ++
 .../devicetree/bindings/arm/amlogic/bootrom.txt    |  17 ++
 arch/arm/boot/dts/meson.dtsi                       |  10 ++
 arch/arm/boot/dts/meson8.dtsi                      |   5 +
 arch/arm/boot/dts/meson8b.dtsi                     |   5 +
 drivers/soc/amlogic/Kconfig                        |  10 ++
 drivers/soc/amlogic/Makefile                       |   1 +
 drivers/soc/amlogic/meson-mx-socinfo.c             | 175 +++++++++++++++++++++
 9 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/assist.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
 create mode 100644 drivers/soc/amlogic/meson-mx-socinfo.c

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
