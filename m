Return-Path: <SRS0=qowN=HZ=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/6] Meson8m2 (32-bit ARM) SoC support
Date: Sun,  6 May 2018 11:21:13 +0200
Message-Id: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

This series adds support for the Meson8m2 SoC. This SoC is mostly
compatible with Meson8 while using some peripherals from Meson8b. Patch
#4 contains a list of (known) differences between the Meson8 and Meson8m2
SoCs.

The first supported board with Meson8m2 SoC is the "Tronsmart MXIII Plus"
where Oleg contributed the initial .dts and heavily tested it (many
thanks!). His testing also confirmed that the Meson8m2 SoC uses the same
register layout for the Ethernet "glue registers (supported by the
dwmac-meson8b driver) as Meson8b.


Martin Blumenstingl (5):
  dt-bindings: arm: amlogic: add support for the Meson8m2 SoC
  dt-bindings: arm: amlogic: add support for the Tronsmart MXIII Plus
  ARM: meson: add support for the Meson8m2 SoCs
  ARM: dts: meson: add support for the Meson8m2 SoC
  ARM: dts: meson8: add the uart_A pins

Oleg Ivanov (1):
  ARM: dts: meson8m2: add support for the Tronsmart MXIII Plus

 .../devicetree/bindings/arm/amlogic.txt       |   6 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/meson8.dtsi                 |  16 ++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts     | 244 ++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi               |  54 ++++
 arch/arm/mach-meson/Kconfig                   |   7 +
 arch/arm/mach-meson/meson.c                   |   1 +
 7 files changed, 330 insertions(+)
 create mode 100644 arch/arm/boot/dts/meson8m2-mxiii-plus.dts
 create mode 100644 arch/arm/boot/dts/meson8m2.dtsi

-- 
2.17.0
