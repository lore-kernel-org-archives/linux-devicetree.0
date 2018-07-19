From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH] dt-bindings: iio: sigma-delta-modulator: fix unit-address in example
Date: Thu, 19 Jul 2018 16:51:50 +0200
Message-ID: <1532011910-11641-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, arnaud.pouliquen@st.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Device tree compiler gives a warning if a device node has "@"
but no reg property.
Fix the example in iio: adc: sigma-delta-modulator.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
index ba24ca7..59b92cd 100644
--- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
+++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
@@ -7,7 +7,7 @@ Required properties:
 
 Example node:
 
-	ads1202: adc@0 {
+	ads1202: adc {
 		compatible = "sd-modulator";
 		#io-channel-cells = <0>;
 	};
-- 
1.9.1
