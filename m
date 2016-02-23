From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 19:21:11 +0200
Message-ID: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

When the SMEM is probed it defers as it depends on the hardware lock, which
is not available yet. But the SMD bus and RPM regulators and clocks depend
on SMEM and they defer too. The problem with this is that the order of
registering the devices is not optimal and also we may end with messed
up serial console as the RPM clocks are not registered yet..

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7705207872a5..c497c7b1ae70 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -113,15 +113,6 @@
 		};
 	};
 
-	smem {
-		compatible = "qcom,smem";
-
-		memory-region = <&smem_mem>;
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-
-		hwlocks = <&tcsr_mutex 3>;
-	};
-
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -512,6 +503,16 @@
 		};
 	};
 
+	smem {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+
 	smd {
 		compatible = "qcom,smd";
 
