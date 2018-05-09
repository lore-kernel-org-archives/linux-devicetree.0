Return-Path: <SRS0=X3x8=H4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35455 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965309AbeEIXuu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 May 2018 19:50:50 -0400
Received: by mail-wm0-f66.google.com with SMTP id o78-v6so1289505wmg.0
        for <devicetree@vger.kernel.org>; Wed, 09 May 2018 16:50:50 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/4] Meson8m2 (32-bit ARM) SoC support
Date: Thu, 10 May 2018 01:50:33 +0200
Message-Id: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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


changes since v1 at [0]:
- do not create a new MACH_MESON8M2 Kconfig entry as suggested by Kevin
  (MACH_MESON8 is re-used instead). This affects patch #1 (which was
  patch #3 in v1) and patch #4 (which was patch #6 in v1)
- dropped patches #1 and #2 from v1 because Kevin already applied these
  ("dt-bindings: arm: amlogic: add support for the Meson8m2 SoC" and
  "dt-bindings: arm: amlogic: add support for the Tronsmart MXIII Plus")


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-May/007303.html


Martin Blumenstingl (3):
  ARM: meson: add support for the Meson8m2 SoCs
  ARM: dts: meson: add support for the Meson8m2 SoC
  ARM: dts: meson8: add the uart_A pins

Oleg Ivanov (1):
  ARM: dts: meson8m2: add support for the Tronsmart MXIII Plus

 arch/arm/boot/dts/Makefile                |   3 +-
 arch/arm/boot/dts/meson8.dtsi             |  16 ++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 244 ++++++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi           |  54 +++++
 arch/arm/mach-meson/Kconfig               |   2 +-
 arch/arm/mach-meson/meson.c               |   1 +
 6 files changed, 318 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/meson8m2-mxiii-plus.dts
 create mode 100644 arch/arm/boot/dts/meson8m2.dtsi

-- 
2.17.0

