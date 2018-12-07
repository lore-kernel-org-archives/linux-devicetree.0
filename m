From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH] dt-bindings: rtc: sun6i-rtc: Fix register range in example
Date: Fri,  7 Dec 2018 16:47:19 +0800
Message-ID: <20181207084719.2009-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The register range for the RTC extends beyond 0x54.
Use the size from the user manual's memory map instead.

Fixes: 9765d2d94309 ("rtc: sun6i: Add sun6i RTC driver")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
index ceb38abf1ea2..6b732c41392b 100644
--- a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
@@ -38,7 +38,7 @@ Example:
 
 rtc: rtc@1f00000 {
 	compatible = "allwinner,sun6i-a31-rtc";
-	reg = <0x01f00000 0x54>;
+	reg = <0x01f00000 0x400>;
 	interrupts = <0 40 4>, <0 41 4>;
 	clock-output-names = "osc32k";
 	clocks = <&ext_osc32k>;
-- 
2.20.0.rc1
