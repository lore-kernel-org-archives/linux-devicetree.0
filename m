From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: meson: g12a: add i2c
Date: Tue, 14 May 2019 12:12:34 +0200
Message-ID: <20190514101237.13969-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the i2c controllers and pinctrl definitions to the g12a DT then
the busses present on the u200 and sei510.

Notice the use of the pinconf DT property 'drive-strength-microamp'.
Support for this property is not yet merged in meson pinctrl driver but
the DT part as been acked by the DT maintainer [0] so it should be safe
to use.

[0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus

Guillaume La Roque (1):
  arm64: dts: meson: g12a: add i2c nodes

Jerome Brunet (2):
  arm64: dts: meson: u200: enable i2c busses
  arm64: dts: meson: sei510: enable i2c3

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |   6 +
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  21 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 268 ++++++++++++++++++
 3 files changed, 295 insertions(+)

-- 
2.20.1
