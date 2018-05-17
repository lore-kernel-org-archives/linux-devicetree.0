From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/4] ARM64: dts: meson-axg: i2c updates
Date: Thu, 17 May 2018 11:30:56 +0200
Message-ID: <20180517093100.22225-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset fixes a few problems found in the i2c nodes of
amlogic's meson-axg platform. It also adds the missing pins for
AO controller so we can use it on the S400

This series has been tested on the S400 board.

Jerome Brunet (4):
  ARM64: dts: meson-axg: clean-up i2c nodes
  ARM64: dts: meson-axg: correct i2c AO clock
  ARM64: dts: meson-axg: add i2c AO pins
  ARM64: dts: meson-axg: enable i2c AO on the S400 board

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts |  6 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 79 ++++++++++++++++++--------
 2 files changed, 62 insertions(+), 23 deletions(-)

-- 
2.14.3
