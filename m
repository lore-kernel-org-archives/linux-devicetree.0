From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/5] 32-bit Meson: add the canvas module
Date: Mon, 20 May 2019 21:43:48 +0200
Message-ID: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
IP is used by the video decoder hardware as well as the VPU (video
output) hardware.

Neither the VPU nor the video decoder driver support the 32-bit SoCs
yet. However, we can still add the canvas module to have it available
once these drivers gain support for the older SoCs.

I have tested this on my Meson8m2 board by hacking the VPU driver to
not re-initialize the VPU (and to use the configuration set by u-boot).
With that hack I could get some image out of the CVBS connector. No
changes to the canvas driver were required.

Due to lack of hardware I could not test Meson8, but I'm following (as
always) what the Amlogic 3.10 vendor kernel uses.
Meson8b is also not tested because u-boot of my EC-100 doesn't have
video output enabled (so I couldn't use the same hack I used on my
Meson8m2 board).

This series meant to be applied on top of "Meson8b: add support for the
RTC on EC-100 and Odroid-C1" from [0]


changes since v1 at [1]:
- added new bindings for the 32-bit SoCs because they don't support the
  "endianness" configuration (new patch #1, thanks to Maxime Jourdan
  for pointing this out)
- update the driver to reject the "endianness" configuration on the
  32-bit SoCs (new patch #2)
- patches #3 to #5 haven't changed compared to v1


[0] https://patchwork.kernel.org/cover/10899509/
[1] https://patchwork.kernel.org/cover/10899565/


Martin Blumenstingl (5):
  dt-bindings: soc: amlogic: canvas: document support for Meson8/8b/8m2
  soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2
  ARM: dts: meson8: add the canvas module
  ARM: dts: meson8m2: update the offset of the canvas module
  ARM: dts: meson8b: add the canvas module

 .../bindings/soc/amlogic/amlogic,canvas.txt   | 10 ++++++---
 arch/arm/boot/dts/meson8.dtsi                 | 22 +++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi                | 22 +++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi               | 10 +++++++++
 drivers/soc/amlogic/meson-canvas.c            | 14 +++++++++++-
 5 files changed, 74 insertions(+), 4 deletions(-)

-- 
2.21.0
