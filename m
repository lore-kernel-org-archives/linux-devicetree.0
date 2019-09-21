From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
Date: Sat, 21 Sep 2019 17:12:18 +0200
Message-ID: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

So far the HHI clock controller has been providing the XTAL clock on
Amlogic Meson8/Meson8b/Meson8m2 SoCs.
This is not correct because the XTAL is actually a crystal on the
boards and the SoC has a dedicated input for it.

This updates the dt-bindings of the HHI clock controller and defines
a fixed-clock in meson.dtsi (along with switching everything over to
use this clock).
The clock driver needs three updates to use this:
- patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
  the explicit reference to CLKID_XTAL while at the same time making
  the code much easier (thanks to Neil for providing this new method
  as part of the G12A CPU clock bringup!)
- patch #3 ensures that the clock driver doesn't rely on it's internal
  XTAL clock while not losing support for older .dtbs that don't have
  the XTAL clock input yet
- with patch #4 the clock controller's own XTAL clock is not registered
  anymore when a clock input is provided via OF

This series is a functional no-op. It's main goal is to better represent
how the actual hardware looks like.


Martin Blumenstingl (5):
  dt-bindings: clock: meson8b: add the clock inputs
  clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
  clk: meson: meson8b: change references to the XTAL clock to use the
    name
  clk: meson: meson8b: don't register the XTAL clock when provided via
    OF
  ARM: dts: meson: provide the XTAL clock using a fixed-clock

 .../bindings/clock/amlogic,meson8b-clkc.txt   |   5 +
 arch/arm/boot/dts/meson.dtsi                  |   7 ++
 arch/arm/boot/dts/meson6.dtsi                 |   7 --
 arch/arm/boot/dts/meson8.dtsi                 |  15 +--
 arch/arm/boot/dts/meson8b-ec100.dts           |   2 +-
 arch/arm/boot/dts/meson8b-mxq.dts             |   2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts        |   2 +-
 arch/arm/boot/dts/meson8b.dtsi                |  15 +--
 drivers/clk/meson/meson8b.c                   | 106 +++++++++---------
 9 files changed, 87 insertions(+), 74 deletions(-)

-- 
2.23.0
