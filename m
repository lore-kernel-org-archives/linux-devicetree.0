From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] ARM64: dts: meson-axg: first round of daughter card updates
Date: Thu, 28 Jun 2018 11:50:51 +0200
Message-ID: <20180628095054.13433-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds a speaker amplifier and some leds present on daughter
cards which are connected to the s400 board.

Kevin, please note that the bindings documentation update for the tas5707
has been queued for next in Mark Brown's ASoC tree. Not having it won't
break anything but you may get checkpatch warning.

Jerome Brunet (3):
  ARM64: dts: meson-axg: add s400 microphone card leds
  ARM64: dts: meson-axg: add s400 main 12v supply
  ARM64: dts: meson-axg: add s400 speaker amplifier

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

-- 
2.14.4
