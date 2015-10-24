From: "J. German Rivera" <German.Rivera@freescale.com>
Subject: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
Date: Fri, 23 Oct 2015 20:31:20 -0500
Message-ID: <1445650280-9966-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bhupesh.sharma@freescale.com, stuart.yoder@freescale.com, leoli@freescale.com, "J. German Rivera" <German.Rivera@freescale.com>
List-Id: devicetree@vger.kernel.org

Added sys-reboot node to the FSL's LS2085A SoC DT to leverage
the ARM-generic reboot mechanism for this SoC. This mechanism
is enabled through CONFIG_POWER_RESET_SYSCON.

Signed-off-by: J. German Rivera <German.Rivera@freescale.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
index e281ceb..6f82163 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
@@ -131,6 +131,18 @@
 		interrupts = <1 9 0x4>;
 	};
 
+	rst_ccsr: rstccsr@1E60000 {
+	        compatible = "syscon";
+		reg = <0x0 0x1E60000 0x0 0x10000>;
+	};
+
+	reboot@65024000 {
+		compatible ="syscon-reboot";
+		regmap = <&rst_ccsr>;
+		offset = <0x0>;
+		mask = <0x2>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <1 13 0x8>, /* Physical Secure PPI, active-low */
-- 
2.3.3
