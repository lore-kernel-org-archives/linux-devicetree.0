From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/6] ARM64: dts: meson-axg: updates
Date: Mon, 16 Jul 2018 12:11:45 +0200
Message-ID: <20180716101151.31109-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset groups several updates targeted on amlogic's AXG
device tree. Patch 1, 2 and 6 had been posted previously but I thought
it would be more convenient for Kevin to get them as a single series.

Jerome Brunet (6):
  ARM64: dts: meson-axg: remove vddio_ao18 from SoC dtsi
  ARM64: dts: meson-axg: add adc buttons the S400
  ARM64: dts: meson-axg: remove spdif out from gpio a7
  ARM64: dts: meson-axg: add spdif input pins
  ARM64: dts: meson-axg: add pdm pins
  ARM64: dts: meson-axg: add the audio clock controller

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts |  44 +++++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 127 ++++++++++++++++++++++---
 2 files changed, 157 insertions(+), 14 deletions(-)

-- 
2.14.4
