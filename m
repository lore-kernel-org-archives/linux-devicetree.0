From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH RESEND 3/8] arm: dts: berlin2: add watchdog nodes
Date: Mon, 16 Nov 2015 19:09:49 +0800
Message-ID: <1447672194-483-4-git-send-email-jszhang@marvell.com>
References: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

The Marvell Berlin BG2 has 3 watchdogs which are compatible with the
snps,dw-wdt driver sit in the sysmgr domain. This patch adds the
corresponding device tree nodes.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
index ef811de..7e35de2 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -412,6 +412,30 @@
 			ranges = <0 0xfc0000 0x10000>;
 			interrupt-parent = <&sic>;
 
+			wdt0: watchdog@1000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x1000 0x100>;
+				clocks = <&refclk>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
+			wdt1: watchdog@2000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x2000 0x100>;
+				clocks = <&refclk>;
+				interrupts = <1>;
+				status = "disabled";
+			};
+
+			wdt2: watchdog@3000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x3000 0x100>;
+				clocks = <&refclk>;
+				interrupts = <2>;
+				status = "disabled";
+			};
+
 			sm_gpio1: gpio@5000 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x5000 0x400>;
-- 
2.6.1
