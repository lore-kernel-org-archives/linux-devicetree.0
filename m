From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH 0/3]  Add support of New Amlogic temperature sensor for G12A SoCs
Date: Tue,  4 Jun 2019 16:47:11 +0200
Message-ID: <20190604144714.2009-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, khilman@baylibre.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchs series add support of New Amlogic temperature sensor.
This driver is based on IIO frameworks.
formulas and calibration values come from amlogic.

Dependencies :
- patch 2: temperature sensor clock are needed [1]

[1] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com

Guillaume La Roque (3):
  Documentation: dt-bindings: add the Amlogic Meson Temperature Sensor
  arm64: dts: meson: g12a: add temperature sensor node
  iio: temperature: add a driver for the temperature sensor found in
    Amlogic Meson G12 SoCs

 .../iio/temperature/amlogic,meson-tsensor.txt |  31 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  22 +
 drivers/iio/temperature/Kconfig               |  11 +
 drivers/iio/temperature/Makefile              |   1 +
 drivers/iio/temperature/meson_tsensor.c       | 416 ++++++++++++++++++
 5 files changed, 481 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
 create mode 100644 drivers/iio/temperature/meson_tsensor.c

-- 
2.17.1
