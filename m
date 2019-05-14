From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: meson: g12a: add mmc B and C
Date: Tue, 14 May 2019 11:16:08 +0200
Message-ID: <20190514091611.15278-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the MMC controller B and C to the g12a SoC as well
as the u200 and sei510 boards.

MMC controller A has been left out on purpose. This controller is
special on this SoC family and will be added later on.

Notice the use of the pinconf DT property 'drive-strength-microamp'.
Support for this property is not yet merged in meson pinctrl driver but
the DT part as been acked by the DT maintainer [0] so it should be safe
to use.

[0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus

Jerome Brunet (3):
  arm64: dts: meson: g12a: add mmc nodes
  arm64: dts: meson: u200: add sd and emmc
  arm64: dts: meson: sei510: add sd and emmc

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  42 ++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  42 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 124 ++++++++++++++++++
 3 files changed, 208 insertions(+)

-- 
2.20.1
