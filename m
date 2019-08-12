From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: Enable DDC regulator for Beelink GS1
Date: Mon, 12 Aug 2019 12:23:55 +0200
Message-ID: <20190812102355.22586-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Beelink GS1 has a DDC I2C bus voltage shifter. This is actually missing
and video is limited to 1024x768 due to missing EDID information.

Add the DDC regulator in the device-tree.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 680dc29cb089..67d7f269c5da 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -25,6 +25,7 @@
 	connector {
 		compatible = "hdmi-connector";
 		type = "a";
+		ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
 
 		port {
 			hdmi_con_in: endpoint {
-- 
2.20.1
