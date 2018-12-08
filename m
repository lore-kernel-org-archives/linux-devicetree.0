From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/5] Meson (32-bit): add support for the Mali GPU
Date: Sat,  8 Dec 2018 18:12:42 +0100
Message-ID: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, mturquette@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the Mali-450 GPU on Meson8 and Meson8b.
Meson6 uses a Mali-400 GPU but since we don't have a clock driver (and
I don't have a device for testing) Meson6 is left out in this series.

Meson8 uses a Mali-450 MP6 with six pixel processors. Meson8b (as
cost-reduced SoC) uses a Mali-450 MP2 with two pixel processors.
I tested both using the open source lima driver and a patched mesa
from the lima project as well. Since we don't have display support
on the 32-bit SoCs I used off-screen rendering as described in [0].
The result is (for example): [1]

The bootloader (at least on my boards) leaves the Mali clock disabled
by default. The board crashes when trying to access the Mali registers
with the "core" clock disabled.
Thus this series also implements the required clock driver changes. The
Mali clock tree on Meson8b and Meson8m2 is almost identical to the one
on GXBB (see the description of patch #3 for more details). Only Meson8
is slightly different as it doesn't have a glitch-free mux. Patch #2
prepares the meson8b clock driver so we can have different clocks per
SoC.

Dependencies:
- the .dts changes depend on my other series "ARM: dts: meson: add the
  APB/APB2 busses" from [2]
- the .dts changes from this series have no compile-time dependency on
  the clock driver changes because CLKID_MALI was defined in the
  dt-bindings since the first version of the clock driver (but it was
  not used until now).
- the .dts changes from this series have a runtime dependency on the
  clock driver changes (also from this series) if you have a kernel
  patched with the lima driver (without the lima driver there's no
  runtime dependency)

Other notes:
By default the GPU runs off the XTAL clock (24MHz). The lima driver
currently does not update the GPU clock rate. Different frequencies
have to be requested by adding the following properties to the Mali
GPU node (to run it at 510MHz for example):
  assigned-clocks = <&clkc CLKID_MALI>;
  assigned-clock-rates = <510000000>;


[0] https://gitlab.freedesktop.org/lima/web/wikis/home
[1] https://abload.de/img/dump0myic0.png
[2] https://patchwork.kernel.org/cover/10719445/


Martin Blumenstingl (5):
  dt-bindings: gpu: mali-utgard: add Amlogic Meson8 and Meson8b
    compatible
  clk: meson: meson8b: use a separate clock table for Meson8
  clk: meson: meson8b: add the GPU clock tree
  ARM: dts: meson8: add the Mali-450 MP6 GPU
  ARM: dts: meson8b: add the Mali-450 MP2 GPU

 .../bindings/gpu/arm,mali-utgard.txt          |   6 +
 arch/arm/boot/dts/meson8.dtsi                 |  58 +++
 arch/arm/boot/dts/meson8b.dtsi                |  46 +++
 drivers/clk/meson/meson8b.c                   | 349 +++++++++++++++++-
 drivers/clk/meson/meson8b.h                   |   9 +-
 5 files changed, 461 insertions(+), 7 deletions(-)

-- 
2.19.2
