From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: meson: mmc clean-up
Date: Thu, 18 Apr 2019 14:27:08 +0200
Message-ID: <20190418122714.30805-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

The patchset is bunch of clean-up found while debugging meson mmc.

* The first 2 patches address the libretech-cc which actually uses 1.8v
  eMMC modules.
* Patch 3 is a pin bias fixup depending on mmc pins.
* Patch 4 lower the mmc max frequencies on gx chips. It was not easy
  to spot but, according to the datasheet, the maximum UHS rate
  supported by these chips is 100MHz (SDR50). This explains why we
  never really managed to get a stable SDR104. SDIO is limited to HS.
* Patch 5 adds missing pinctrl definition on the vim2
* Patch 6 remove hs400 from the supported modes of the vim2. This mode is
  mode reliable enough with HW/SW ATM.

When/If the series on the mmc drivers goes through, I'll send the
following updates:
* Push odroid-c2 eMMC max rate from 100Mhz to 200Mhz. With the new tuning
  method, this mode is finally stable on the OC2 (so far...)
* Enable SD UHS modes on the odroid-c2
* Enable SD UHS DDR50 on the nanopi k2

Jerome Brunet (6):
  arm64: dts: meson: libretech-cc: set eMMC as removable
  arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
  arm64: dts: meson: fix mmc pin bias
  arm64: dts: meson: fix mmc v2 chips max frequencies
  arm64: dts: meson: vim2: add missing clk-gate pinctrl
  arm64: dts: meson: vim2: remove sd hs and hs400 modes from emmc

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  4 +--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 31 ++++++++++++----
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  4 +--
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  5 ++-
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 +-
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  2 +-
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  4 +--
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  4 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 35 +++++++++++++------
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  2 +-
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  | 14 ++++----
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  2 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  4 +--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 35 +++++++++++++------
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 15 ++++----
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |  2 +-
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |  4 +--
 17 files changed, 109 insertions(+), 60 deletions(-)

-- 
2.20.1
