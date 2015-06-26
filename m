From: Walter Lozano <walter@vanguardiasur.com.ar>
Subject: [PATCH 2/3] ARM: socfpga: dts: Fix entries order
Date: Thu, 25 Jun 2015 23:25:58 -0300
Message-ID: <1435285559-11053-2-git-send-email-walter@vanguardiasur.com.ar>
References: <1435285559-11053-1-git-send-email-walter@vanguardiasur.com.ar>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435285559-11053-1-git-send-email-walter@vanguardiasur.com.ar>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@opensource.altera.com, geert@linux-m68k.org, s.trumtrar@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Walter Lozano <walter@vanguardiasur.com.ar>
List-Id: devicetree@vger.kernel.org

This patch reorders the nodes alphabetically

Signed-off-by: Walter Lozano <walter@vanguardiasur.com.ar>
---
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
index 5b60692..d343e03 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
@@ -60,15 +60,6 @@
 	rxc-skew-ps = <2000>;
 };
 
-&mmc0 {
-	vmmc-supply = <&regulator_3_3v>;
-	vqmmc-supply = <&regulator_3_3v>;
-};
-
-&usb1 {
-	status = "okay";
-};
-
 &gpio2 {
 	status = "okay";
 };
@@ -84,3 +75,12 @@
 		interrupts = <3 2>;
 	};
 };
+
+&mmc0 {
+	vmmc-supply = <&regulator_3_3v>;
+	vqmmc-supply = <&regulator_3_3v>;
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
1.7.10.4
