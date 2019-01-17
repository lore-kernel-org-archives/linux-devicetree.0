From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] soc: amlogic: clk-measure: add axg and g12a support
Date: Thu, 17 Jan 2019 17:48:34 +0100
Message-ID: <20190117164838.8008-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the axg and g12a SoC family in amlogic's
clock measure driver and enable it on the related devices

Jerome Brunet (4):
  dt-bindings: amlogic: add new compatible devices to clk_measure
  soc: amlogic: clk-measure: add axg and g12a support
  arm64: dts: meson: axg: add clk measure support
  arm64: dts: meson: g12a: add clk measure support

 .../bindings/soc/amlogic/clk-measure.txt      |   2 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   5 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   5 +
 drivers/soc/amlogic/meson-clk-measure.c       | 194 ++++++++++++++++++
 4 files changed, 206 insertions(+)

-- 
2.20.1
