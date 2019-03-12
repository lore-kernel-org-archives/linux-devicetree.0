From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
Date: Tue, 12 Mar 2019 16:33:26 +0800
Message-ID: <20190312083326.18029-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
List-Id: devicetree@vger.kernel.org

There is a white LED on the front panel behind the logo and the
manufacturer uses that LED to indicate network and USB drive status.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index 9a8a8a7e4b53..b5667f1fb2c8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -14,6 +14,16 @@
 	cvbs-connector {
 		status = "disabled";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		status {
+			label = "n1:white:status";
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
 };
 
 &cvbs_vdac_port {
-- 
2.20.1
