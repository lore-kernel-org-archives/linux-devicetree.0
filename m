From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: g12a: add tdm resets
Date: Tue, 20 Aug 2019 14:15:49 +0200
Message-ID: <20190820121551.18398-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the dedicated reset of the tdm formatters which
have been added on the g12a SoC family. Using these help with the channel
mapping when the formatter uses more than 1 i2s lane.

Kevin, please note that to build, this patchset depends on the new reset
bindings of the audio clock controller. I've prepared a tag for you [0]

[0]: git://github.com/BayLibre/clk-meson.git - clk-meson-dt-v5.4-2

Jerome Brunet (2):
  arm64: dts: meson: g12a: audio clock controller provides resets
  arm64: dts: meson: g12a: add reset to tdm formatters

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.21.0
