From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] dt-bindings: iio: adc: meson-saradc: update temperature sensor support
Date: Thu, 27 Dec 2018 22:50:19 +0100
Message-ID: <20181227215020.9803-2-martin.blumenstingl@googlemail.com>
References: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: balbes-150@yandex.ru, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Meson8b and Meson8m2 use a 5-bit wide TSC (temperature sensor
coefficient). The SAR ADC registers however can only store (the lower)
4 bits. The fifth (upper-most) bit is stored inside the
MESON_HHI_DPLL_TOP_0[9] register from the HHI register area.
This adds a syscon property to the HHI register area so a driver can
fetch the HHI register map and store the fifth TSC bit in there.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
index 325090e43ce6..75c775954102 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
@@ -23,6 +23,10 @@ Required properties:
 - #io-channel-cells: must be 1, see ../iio-bindings.txt
 
 Optional properties:
+- amlogic,hhi-sysctrl:	phandle to the syscon which contains the 5th bit
+			of the TSC (temperature sensor coefficient) on
+			Meson8b and Meson8m2 (which used to calibrate the
+			temperature sensor)
 - nvmem-cells:		phandle to the temperature_calib eFuse cells
 - nvmem-cell-names:	if present (to enable the temperature sensor
 			calibration) this must contain "temperature_calib"
-- 
2.20.1
