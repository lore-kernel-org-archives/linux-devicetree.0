From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 4/6] ARM: STi: STiH416: Enable Cortex-A9 PMU support
Date: Tue, 29 Jul 2014 15:05:42 +0100
Message-ID: <1406642744-22589-5-git-send-email-lee.jones@linaro.org>
References: <1406642744-22589-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406642744-22589-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com, tglx@linutronix.de, jason@lakedaemon.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is ARM's generic Performance Monitoring Unit.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 84758d7..badefd6 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -21,6 +21,12 @@
 		cache-level = <2>;
 	};
 
+	arm-pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.9.1
