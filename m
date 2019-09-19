From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 4/7] media: dt-bindings: ov2659: add powerdown/reset-gpios optional property
Date: Thu, 19 Sep 2019 15:39:52 -0500
Message-ID: <20190919203955.15125-5-bparrot@ti.com>
References: <20190919203955.15125-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919203955.15125-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Add powerdown-gpios and reset-gpios to the list of optional properties
for the OV2659 camera sensor.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 Documentation/devicetree/bindings/media/i2c/ov2659.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
index cabc7d827dfb..92989a619f29 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
@@ -12,6 +12,12 @@ Required Properties:
 - clock-names: should be "xvclk".
 - link-frequencies: target pixel clock frequency.
 
+Optional Properties:
+- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
+  Active high with internal pull down resistor.
+- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
+  Active low with internal pull up resistor.
+
 For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
 
@@ -27,6 +33,9 @@ Example:
 			clocks = <&clk_ov2659 0>;
 			clock-names = "xvclk";
 
+			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+
 			port {
 				ov2659_0: endpoint {
 					remote-endpoint = <&vpfe_ep>;
-- 
2.17.1
