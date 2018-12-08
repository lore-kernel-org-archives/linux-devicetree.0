From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] ARM: dts: meson: add the APB/APB2 busses
Date: Sat,  8 Dec 2018 17:45:49 +0100
Message-ID: <20181208164555.26527-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This adds the APB bus on Meson8 and Meson8b as well as the APB2 bus on
Meson6. This is preparation work for adding the Mali GPU which is
located on theses busses.

Meson6 seems to have it's APB at 0xc8000000 instead of 0xd0000000. The
region at 0xd0000000 is called APB2 or A9_APB and it has a different
size (256k) compared to Meson8 and Meson8b (2M).

Addresses and sizes are taken from the Amlogic 3.10 kernel sources:
- Meson6: [0]
- Meson8: [1]
- Meson8b: [2]


[0] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson6/include/mach/io.h#L61
[1] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8/include/mach/io.h#L53
[2] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8b/include/mach/io.h#L53


Martin Blumenstingl (3):
  ARM: dts: meson6: add the APB2 bus
  ARM: dts: meson8: add the APB bus
  ARM: dts: meson8b: add the APB bus

 arch/arm/boot/dts/meson6.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 3 files changed, 24 insertions(+)

-- 
2.19.2
