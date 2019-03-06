From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: Update memory map to v3
Date: Wed,  6 Mar 2019 09:51:20 -0800
Message-ID: <20190306175120.22544-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the reserved-memory map to version 3, to adjust to changes in the
remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index d6a91c31986a..298a6053c3e0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -179,8 +179,13 @@
 		#size-cells = <2>;
 		ranges;
 
-		memory@85600000 {
-			reg = <0 0x85600000 0 0x90000>;
+		tz_apps_mem: memory@85900000 {
+			reg = <0 0x85900000 0 0x500000>;
+			no-map;
+		};
+
+		xbl_mem: memory@85e00000 {
+			reg = <0 0x85e00000 0 0x100000>;
 			no-map;
 		};
 
@@ -189,28 +194,33 @@
 			no-map;
 		};
 
-		memory@86100000 {
+		tz_mem: memory@86100000 {
 			reg = <0 0x86100000 0 0x300000>;
 			no-map;
 		};
 
 		wlan_fw_mem: memory@86400000 {
-			reg = <0 0x86400000 0 0x1c00000>;
+			reg = <0 0x86400000 0 0x1100000>;
+			no-map;
+		};
+
+		adsp_fw_mem: memory@87500000 {
+			reg = <0 0x87500000 0 0x1a00000>;
 			no-map;
 		};
 
-		adsp_fw_mem: memory@88000000 {
-			reg = <0 0x88000000 0 0x1a00000>;
+		cdsp_fw_mem: memory@88f00000 {
+			reg = <0 0x88f00000 0 0x600000>;
 			no-map;
 		};
 
-		cdsp_fw_mem: memory@89a00000 {
-			reg = <0 0x89a00000 0 0x600000>;
+		wlan_msa_mem: memory@89500000 {
+			reg = <0 0x89500000 0 0x100000>;
 			no-map;
 		};
 
-		wlan_msa_mem: memory@8a000000 {
-			reg = <0 0x8a000000 0 0x100000>;
+		uefi_mem: memory@9f800000 {
+			reg = <0 0x9f800000 0 0x800000>;
 			no-map;
 		};
 	};
-- 
2.18.0
