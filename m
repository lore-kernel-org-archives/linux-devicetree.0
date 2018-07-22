From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 05/15] MIPS: dts: img: pistachio_marduk: Enable SPIM0
Date: Sun, 22 Jul 2018 23:20:00 +0200
Message-ID: <20180722212010.3979-6-afaerber@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rahul Bedarkar <rahulbedarkar89@gmail.com>, James Hartley <james.hartley@sondrel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SPIM0 supplies SPI pins on the mikroBUS and Raspberry Pi B+ connectors.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index 5557a6ad61c3..d723b68084c9 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -123,6 +123,14 @@
 	pins = "mfio17", "mfio18", "mfio19", "mfio20";
 };
 
+&pin_spim0 {
+	drive-strength = <2>;
+};
+
+&pin_spim0_clk {
+	drive-strength = <2>;
+};
+
 &pwm {
 	status = "okay";
 
@@ -137,6 +145,21 @@
 	disable-wp;
 };
 
+&spfi0 {
+	status = "okay";
+
+	pinctrl-0 = <&spim0_pins>,
+		    <&spim0_cs0_alt_pin>,
+		    <&spim0_cs2_alt_pin>,
+		    <&spim0_cs3_alt_pin>,
+		    <&spim0_cs4_alt_pin>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>, <0>,
+		   <&gpio1 12 GPIO_ACTIVE_HIGH>,
+		   <&gpio1 13 GPIO_ACTIVE_HIGH>,
+		   <&gpio1 14 GPIO_ACTIVE_HIGH>;
+};
+
 &spfi1 {
 	status = "okay";
 
-- 
2.16.4
