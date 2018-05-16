From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] ARM64: dts: meson-axg: i2c clean-up
Date: Wed, 16 May 2018 17:52:01 +0200
Message-ID: <20180516155203.24922-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset fixes a few problems found in the i2c nodes of
amlogic's meson-axg paltform.

Jerome Brunet (2):
  ARM64: dts: meson-axg: clean-up i2c nodes
  ARM64: dts: meson-axg: remove incorrect i2c ao clock

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 42 ++++++++++++++----------------
 1 file changed, 19 insertions(+), 23 deletions(-)

-- 
2.14.3
