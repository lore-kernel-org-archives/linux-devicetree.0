From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/5] arm64: dts: meson: audio updates
Date: Thu,  5 Sep 2019 14:59:51 +0200
Message-ID: <20190905125956.4384-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patchset features a few updates to prepare the addition of the audio
on sm1. It fixes the register range of audio fifo which was incorrect.

It also create another layer of dtsi, common to g12a and g12b but not sm1.
The audio related device are moved to this file.

This was done because the audio bus, which was at 0xff642000 on g12, has
moved 0xff660000 on sm1. Overwriting the reg property was option but it
would have left confusing node names on the sm1.

Jerome Brunet (5):
  arm64: dts: meson: axg: fix audio fifo reg size
  arm64: dts: meson: g12: fix audio fifo reg size
  arm64: dts: meson: g12: add a g12 layer
  arm64: dts: meson: g12: factor the power domain.
  arm64: dts: meson: g12: move audio bus out of g12-common

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  12 +-
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 320 ----------------
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi    | 344 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  15 +-
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  14 +-
 5 files changed, 352 insertions(+), 353 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12.dtsi

-- 
2.21.0
