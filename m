From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 03/18] arm64: dts: qcom: qcs404: Add reserved-memory regions
Date: Fri,  9 Nov 2018 00:09:54 +0530
Message-ID: <20181108184009.18430-4-vkoul@kernel.org>
References: <20181108184009.18430-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108184009.18430-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the reserved memory regions in QCS404

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b77d1198ba79..58aa1f989089 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -73,6 +73,47 @@
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		memory@85600000 {
+			reg = <0 0x85600000 0 0x90000>;
+			no-map;
+		};
+
+		smem_region: memory@85f00000 {
+			reg = <0 0x85f00000 0 0x200000>;
+			no-map;
+		};
+
+		memory@86100000 {
+			reg = <0 0x86100000 0 0x300000>;
+			no-map;
+		};
+
+		wlan_fw_mem: memory@86400000 {
+			reg = <0 0x86400000 0 0x1c00000>;
+			no-map;
+		};
+
+		adsp_fw_mem: memory@88000000 {
+			reg = <0 0x88000000 0 0x1a00000>;
+			no-map;
+		};
+
+		cdsp_fw_mem: memory@89a00000 {
+			reg = <0 0x89a00000 0 0x600000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8a000000 {
+			reg = <0 0x8a000000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.14.4
