From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/7] arm64: meson: g12a: add audio devices
Date: Fri, 12 Apr 2019 14:51:29 +0200
Message-ID: <20190412125136.28232-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds most the audio devices of the g12a SoCs.

Kevin, couple of things worth noting:
 * This patch depends of the new audio clocks binding recently applied
   by Neil [0].
 * You may get a warning about an undocumented compatible string.
   The related binding documentation has been merged through ASoC [1].

[0]: https://lkml.kernel.org/r/20190329160649.31603-2-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20190404111733.28705-2-jbrunet@baylibre.com

Jerome Brunet (7):
  arm64: dts: meson: g12a: add audio clock controller
  arm64: dts: meson: g12a: add audio memory arbitrer
  arm64: dts: meson: g12a: add audio fifos
  arm64: dts: meson: g12a: add tdm devices
  arm64: dts: meson: g12a: add spdifouts
  arm64: dts: meson: g12a: add pdm
  arm64: dts: meson: g12a: add spdifin

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 304 ++++++++++++++++++++
 1 file changed, 304 insertions(+)

-- 
2.20.1
