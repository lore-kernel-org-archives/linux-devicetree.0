Return-Path: <SRS0=d0Jw=VU=linaro.org=georgi.djakov@kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v5 5/5] arm64: dts: qcs404: Add interconnect provider DT nodes
Date: Tue, 23 Jul 2019 17:23:39 +0300
Message-Id: <20190723142339.27772-6-georgi.djakov@linaro.org>
In-Reply-To: <20190723142339.27772-1-georgi.djakov@linaro.org>
References: <20190723142339.27772-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, georgi.djakov@linaro.org
Cc: vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add the DT nodes for the network-on-chip interconnect buses found
on qcs404-based platforms.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

v5:
- Rebased to v5.3-rc1

v4:
- Insert the NoC DT nodes after rng@ to keep the nodes sorted by address.
- Pick Bjorn's r-b.

v3:
- Update according to the new binding: add reg property and moved under the
  "soc" node.

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009..8b9352347622 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018, Linaro Limited
 
+#include <dt-bindings/interconnect/qcom,qcs404.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/clock/qcom,turingcc-qcs404.h>
@@ -273,6 +274,15 @@
 			clock-names = "core";
 		};
 
+		bimc: interconnect@400000 {
+			reg = <0x00400000 0x80000>;
+			compatible = "qcom,qcs404-bimc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+				<&rpmcc RPM_SMD_BIMC_A_CLK>;
+		};
+
 		tsens: thermal-sensor@4a9000 {
 			compatible = "qcom,qcs404-tsens", "qcom,tsens-v1";
 			reg = <0x004a9000 0x1000>, /* TM */
@@ -283,6 +293,24 @@
 			#thermal-sensor-cells = <1>;
 		};
 
+		pcnoc: interconnect@500000 {
+			reg = <0x00500000 0x15080>;
+			compatible = "qcom,qcs404-pcnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
+				<&rpmcc RPM_SMD_PNOC_A_CLK>;
+		};
+
+		snoc: interconnect@580000 {
+			reg = <0x00580000 0x23080>;
+			compatible = "qcom,qcs404-snoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+				<&rpmcc RPM_SMD_SNOC_A_CLK>;
+		};
+
 		remoteproc_cdsp: remoteproc@b00000 {
 			compatible = "qcom,qcs404-cdsp-pas";
 			reg = <0x00b00000 0x4040>;
