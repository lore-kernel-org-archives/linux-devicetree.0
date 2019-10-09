From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: sm1: add audio support
Date: Wed,  9 Oct 2019 10:27:06 +0200
Message-ID: <20191009082708.6337-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds audio support on the sm1 SoC family and the
sei610 platform

Kevin, The patchset depends on:
 - The ARB binding merged by Philipp [0]
 - The audio clock controller bindings I just applied. A tag is
   available for you here [1]

This clk-meson branch [2] has the necessary clock driver changes, if
you want to test this.

[0]: https://lkml.kernel.org/r/20190905135040.6635-1-jbrunet@baylibre.com
[1]: git://github.com/BayLibre/clk-meson.git clk-meson-dt-v5.5-1
[2]: git://github.com/BayLibre/clk-meson.git v5.5/drivers

Jerome Brunet (2):
  arm64: dts: meson: sm1: add audio devices
  arm64: dts: meson: sei610: enable audio

 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 205 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 327 ++++++++++++++++++
 2 files changed, 532 insertions(+)

-- 
2.21.0
