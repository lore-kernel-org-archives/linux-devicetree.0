From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch 3/6] media: dt-bindings: ov2659: add powerdown-gpios optional property
Date: Thu, 12 Sep 2019 08:00:04 -0500
Message-ID: <20190912130007.4469-4-bparrot@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912130007.4469-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Add powerdown-gpios to the list of optional properties for the OV2659
camera sensor.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 Documentation/devicetree/bindings/media/i2c/ov2659.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
index cabc7d827dfb..f55204cce0cd 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
@@ -12,6 +12,10 @@ Required Properties:
 - clock-names: should be "xvclk".
 - link-frequencies: target pixel clock frequency.
 
+Optional Properties:
+- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
+  Active is low.
+
 For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
 
@@ -27,6 +31,8 @@ Example:
 			clocks = <&clk_ov2659 0>;
 			clock-names = "xvclk";
 
+			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
+
 			port {
 				ov2659_0: endpoint {
 					remote-endpoint = <&vpfe_ep>;
-- 
2.17.1
