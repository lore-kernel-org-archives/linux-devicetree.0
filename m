From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 02/15] MIPS: dts: img: pistachio_marduk: Cleanups
Date: Sun, 22 Jul 2018 23:19:57 +0200
Message-ID: <20180722212010.3979-3-afaerber@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, James Hartley <james.hartley@sondrel.com>, Rahul Bedarkar <rahulbedarkar89@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add and remove some white lines for consistency.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index f03f4114e645..29358d1f7027 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -51,6 +51,7 @@
 
 	leds {
 		compatible = "pwm-leds";
+
 		heartbeat {
 			label = "marduk:red:heartbeat";
 			pwms = <&pwm 3 300000>;
@@ -61,11 +62,13 @@
 
 	keys {
 		compatible = "gpio-keys";
+
 		button@1 {
 			label = "Button 1";
 			linux,code = <0x101>; /* BTN_1 */
 			gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
 		};
+
 		button@2 {
 			label = "Button 2";
 			linux,code = <0x102>; /* BTN_2 */
@@ -92,7 +95,6 @@
 		compatible = "infineon,slb9645tt";
 		reg = <0x20>;
 	};
-
 };
 
 &i2c3 {
-- 
2.16.4
