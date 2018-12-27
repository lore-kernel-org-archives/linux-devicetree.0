From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] meson-saradc: temperature sensor support for Meson8b/Meson8m2
Date: Thu, 27 Dec 2018 22:50:18 +0100
Message-ID: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: balbes-150@yandex.ru, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This adds support for the temperature sensor on Meson8b and Meson8m2
(both are sharing the same logic).

These SoCs can use most of the existing infrastructure that we already
have for Meson8:
- parsing the TSC (calibration data) from an nvmem-cell
- the math to calculate millicelsius from the register values

What this series adds on top of the existing infrastructure:
- The TSC data is 5-bit wide instead of 4-bit. The upper-most bit has t
  be written into a register in the HHI area (which is outside the ADC
  register space). Thus this adds a new device tree property to pass the
  HHI syscon to the SAR ADC and we set up this register during SAR ADC
  driver initialization
- the multiplier and divider values (to convert the raw register value
  to celsius / millicelsius) are different compared to Meson8

This was successfully tested on multiple boards:
- Meson8b Odroid-C1 (me)
- Meson8b EC-100 (me)
- Meson8m2 M8S (not upstream yet, me)
- Meson8m2 MXIII-Plus (an earlier version of this series, Oleg Ivanov)


Martin Blumenstingl (2):
  dt-bindings: iio: adc: meson-saradc: update temperature sensor support
  iio: adc: meson-saradc: enable the temperature sensor two more SoCs

 .../bindings/iio/adc/amlogic,meson-saradc.txt |  4 +++
 drivers/iio/adc/meson_saradc.c                | 33 +++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.20.1
