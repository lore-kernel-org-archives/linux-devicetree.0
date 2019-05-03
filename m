From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 0/7] Add support for H6 thermal sensor
Date: Fri,  3 May 2019 03:28:06 -0400
Message-ID: <20190503072813.2719-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the H6 ths sensor.

Based on IIO-based thermal sensor driver for Allwinner H3 and A83T SoC,
thx to Philipp Rossak's work.

TODO: calibrate thermal sensor by using information from sid.

Yangtao Li (7):
  iio: adc: sun4i-gpadc: rework for support multiple thermal sensor
  iio: adc: sun4i-gpadc: introduce temp_data in gpadc_data
  iio: adc: sun4i-gpadc: introduce gpadc_enable and gpadc_disable in
    gpadc_data
  iio: adc: sun4i-gpadc-iio: support clocks and reset
  dt-bindings: mfd: Add H6 GPADC binding
  iio: adc: sun4i-gpadc-iio: add support for H6 thermal sensor
  iio: adc: sun4i-gpadc-iio convert to SPDX license tags

 .../devicetree/bindings/mfd/sun4i-gpadc.txt   |  27 ++-
 drivers/iio/adc/sun4i-gpadc-iio.c             | 208 +++++++++++++++---
 include/linux/mfd/sun4i-gpadc.h               |   9 +
 3 files changed, 213 insertions(+), 31 deletions(-)

-- 
2.17.1
