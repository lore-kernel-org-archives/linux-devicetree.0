From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v6 1/8] arm64: dts: qcom: sdm845: Update reserved memory map
Date: Tue,  5 Feb 2019 21:13:28 -0800
Message-ID: <20190206051335.23799-2-bjorn.andersson@linaro.org>
References: <20190206051335.23799-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206051335.23799-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update existing and add missing regions to the reserved memory map, as
described in version 10.

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Replaced a few 0x0 with 0
- Corrected size of tz_mem

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 74 +++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ade2f385507c..16a060063882 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -72,29 +72,69 @@
 		#size-cells = <2>;
 		ranges;
 
-		memory@85fc0000 {
+		hyp_mem: memory@85700000 {
+			reg = <0 0x85700000 0 0x600000>;
+			no-map;
+		};
+
+		xbl_mem: memory@85e00000 {
+			reg = <0 0x85e00000 0 0x100000>;
+			no-map;
+		};
+
+		aop_mem: memory@85fc0000 {
 			reg = <0 0x85fc0000 0 0x20000>;
 			no-map;
 		};
 
-		memory@85fe0000 {
+		aop_cmd_db_mem: memory@85fe0000 {
 			compatible = "qcom,cmd-db";
-			reg = <0x0 0x85fe0000 0x0 0x20000>;
+			reg = <0x0 0x85fe0000 0 0x20000>;
 			no-map;
 		};
 
 		smem_mem: memory@86000000 {
-			reg = <0x0 0x86000000 0x0 0x200000>;
+			reg = <0x0 0x86000000 0 0x200000>;
 			no-map;
 		};
 
-		memory@86200000 {
+		tz_mem: memory@86200000 {
 			reg = <0 0x86200000 0 0x2d00000>;
 			no-map;
 		};
 
-		wlan_msa_mem: memory@96700000 {
-			reg = <0 0x96700000 0 0x100000>;
+		qseecom_mem: memory@8ab00000 {
+			reg = <0 0x8ab00000 0 0x1400000>;
+			no-map;
+		};
+
+		camera_mem: memory@8bf00000 {
+			reg = <0 0x8bf00000 0 0x500000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
 			no-map;
 		};
 
@@ -103,10 +143,30 @@
 			no-map;
 		};
 
+		venus_mem: memory@95800000 {
+			reg = <0 0x95800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@95d00000 {
+			reg = <0 0x95d00000 0 0x800000>;
+			no-map;
+		};
+
 		mba_region: memory@96500000 {
 			reg = <0 0x96500000 0 0x200000>;
 			no-map;
 		};
+
+		slpi_mem: memory@96700000 {
+			reg = <0 0x96700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97b00000 {
+			reg = <0 0x97b00000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	cpus {
-- 
2.18.0
