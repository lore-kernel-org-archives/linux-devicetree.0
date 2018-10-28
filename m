Return-Path: <SRS0=Ck17=NI=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
Date: Sun, 28 Oct 2018 13:08:56 +0100
Message-Id: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
There is a register area called "HHI" which is used for multiple IP
blocks of the SoC:
- the system clock controller
- a few reset lines (there is a separate reset controller, these reset
  lines are not part of the other reset controller). this reset
  controller is currently implemented in the clock controller driver
- a HDMI controller
- temperature sensor calibration data (by "data" I really mean data,
  the ADC driver has four bits for the TSC data in it's own register
  space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
  is stored in the HHI register area)

The first three could be implemented with a single node (either in one
big driver, or using a MFD driver which would register function-
specific drivers).
However, the TSC data is a big problem, because the ADC has it's own
set of registers but needs to write one bit in the HHI register area.

NOTE: this series has multiple dependencies:
- the clock controller changes depend "meson8b: add the CPU_DIV16 clock
  for the ARM TWD" as well as "meson8b: register the clock controller
  early" [2]
- the dts changes depend on "fix clock controller register size on
  Meson8/Meson8b" [3]


Changes since v1 at [4]:
- added a "amlogic,meson-hhi-sysctrl" compatible to the syscon node
  (which is the parent of the clock controller) in patch #1 and #3
- added Neil's Acked-by
- rebased on top of clk-meson's meson-clk-4.20-1 tag and my other
  series "Meson8b: fixes for the cpu_scale_div clock" from [5]


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006733.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007890.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007900.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007897.html
[4] https://patchwork.kernel.org/cover/10539051/
[5] https://patchwork.kernel.org/cover/10617617/


Martin Blumenstingl (3):
  dt-bindings: clock: meson8b: use the registers from the HHI syscon
  clk: meson: meson8b: use the HHI syscon if available
  ARM: dts: meson: switch the clock controller to the HHI register area

 .../bindings/clock/amlogic,meson8b-clkc.txt   | 13 ++++------
 arch/arm/boot/dts/meson.dtsi                  |  7 ++++++
 arch/arm/boot/dts/meson8.dtsi                 | 15 ++++++------
 arch/arm/boot/dts/meson8b.dtsi                | 15 ++++++------
 drivers/clk/meson/meson8b.c                   | 24 ++++++++++++-------
 5 files changed, 43 insertions(+), 31 deletions(-)

-- 
2.19.1
