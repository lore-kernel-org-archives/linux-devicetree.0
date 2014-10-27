From: Feng Kan <fkan@apm.com>
Subject: [PATCH RESEND 7/7] arm64: dts: Add PMU node for APM X-Gene Storm SOC
Date: Mon, 27 Oct 2014 12:28:28 -0700
Message-ID: <1414438108-8384-8-git-send-email-fkan@apm.com>
References: <1414438108-8384-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414438108-8384-1-git-send-email-fkan@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@apm.com
Cc: Feng Kan <fkan@apm.com>, Vinayak Kale <vkale@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds the PMU device tree node for APM X-Gene Storm SOC.

Signed-off-by: Vinayak Kale <vkale@apm.com>
Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index b2e6068..85d2dd7 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -97,6 +97,11 @@
 		clock-frequency = <50000000>;
 	};
 
+	pmu {
+		compatible = "apm,potenza-pmu", "arm,armv8-pmuv3";
+		interrupts = <1 12 0xff04>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
1.9.1
