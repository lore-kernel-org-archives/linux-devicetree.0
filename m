From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 10/14] dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
Date: Thu, 25 Jul 2019 12:41:38 +0200
Message-ID: <20190725104144.22924-11-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT bindings to describe the CPR HW found on certain Qualcomm SoCs.

Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since V1:
-Picked up tags.

 .../bindings/power/avs/qcom,cpr.txt           | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt

diff --git a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
new file mode 100644
index 000000000000..93be67fa8f38
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
@@ -0,0 +1,193 @@
+QCOM CPR (Core Power Reduction)
+
+CPR (Core Power Reduction) is a technology to reduce core power on a CPU
+or other device. Each OPP of a device corresponds to a "corner" that has
+a range of valid voltages for a particular frequency. While the device is
+running at a particular frequency, CPR monitors dynamic factors such as
+temperature, etc. and suggests adjustments to the voltage to save power
+and meet silicon characteristic requirements.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: should be "qcom,qcs404-cpr", "qcom,cpr" for qcs404
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address and size of the rbcpr register region
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the CPR interrupt
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: phandle to the reference clock
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "ref"
+
+- vdd-apc-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: phandle to the vdd-apc-supply regulator
+
+- #power-domain-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: should be 0
+
+- operating-points-v2:
+	Usage: required
+	Value type: <phandle>
+	Definition: A phandle to the OPP table containing the
+		    performance states supported by the CPR
+		    power domain
+
+- acc-syscon:
+	Usage: optional
+	Value type: <phandle>
+	Definition: phandle to syscon for writing ACC settings
+
+- nvmem-cells:
+	Usage: required
+	Value type: <phandle>
+	Definition: phandle to nvmem cells containing the data
+		    that makes up a fuse corner, for each fuse corner.
+		    As well as the CPR fuse revision.
+
+- nvmem-cell-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: should be "cpr_quotient_offset1", "cpr_quotient_offset2",
+		    "cpr_quotient_offset3", "cpr_init_voltage1",
+		    "cpr_init_voltage2", "cpr_init_voltage3", "cpr_quotient1",
+		    "cpr_quotient2", "cpr_quotient3", "cpr_ring_osc1",
+		    "cpr_ring_osc2", "cpr_ring_osc3", "cpr_fuse_revision"
+		    for qcs404.
+
+- qcom,cpr-timer-delay-us:
+	Usage: required
+	Value type: <u32>
+	Definition: delay in uS for the timer interval
+
+- qcom,cpr-timer-cons-up:
+	Usage: required
+	Value type: <u32>
+	Definition: Consecutive number of timer intervals, or units of
+		    qcom,cpr-timer-delay-us, that occur before issuing an up
+		    interrupt
+
+- qcom,cpr-timer-cons-down:
+	Usage: required
+	Value type: <u32>
+	Definition: Consecutive number of timer intervals, or units of
+		    qcom,cpr-timer-delay-us, that occur before issuing a down
+		    interrupt
+
+- qcom,cpr-up-threshold:
+	Usage: optional
+	Value type: <u32>
+	Definition: The threshold for CPR to issue interrupt when error_steps
+		    is greater than it when stepping up
+
+- qcom,cpr-down-threshold:
+	Usage: optional
+	Value type: <u32>
+	Definition: The threshold for CPR to issue interrupt when error_steps
+		    is greater than it when stepping down
+
+- qcom,cpr-idle-clocks:
+	Usage: optional
+	Value type: <u32>
+	Definition: Idle clock cycles ring oscillator can be in
+
+- qcom,cpr-gcnt-us:
+	Usage: required
+	Value type: <u32>
+	Definition: The time for gate count in uS
+
+- qcom,vdd-apc-step-up-limit:
+	Usage: required
+	Value type: <u32>
+	Definition: Limit of number of vdd-apc-supply regulator steps for
+		    scaling up
+
+- qcom,vdd-apc-step-down-limit:
+	Usage: required
+	Value type: <u32>
+	Definition: Limit of number of vdd-apc-supply regulator steps for
+		    scaling down
+
+Example:
+
+	cpr_opp_table: cpr-opp-table {
+		compatible = "operating-points-v2-qcom-level";
+
+		cpr_opp1: opp1 {
+			opp-level = <1>;
+			....
+		};
+		cpr_opp2: opp2 {
+			opp-level = <2>;
+			....
+		};
+		cpr_opp3: opp3 {
+			opp-level = <3>;
+			....
+		};
+	};
+
+	cpr@b018000 {
+		compatible = "qcom,qcs404-cpr", "qcom,cpr";
+		reg = <0x0b018000 0x1000>;
+		interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&xo_board>;
+		clock-names = "ref";
+		vdd-apc-supply = <&pms405_s3>;
+		#power-domain-cells = <0>;
+		operating-points-v2 = <&cpr_opp_table>;
+		acc-syscon = <&tcsr>;
+
+		nvmem-cells = <&cpr_efuse_quot_offset1>,
+			<&cpr_efuse_quot_offset2>,
+			<&cpr_efuse_quot_offset3>,
+			<&cpr_efuse_init_voltage1>,
+			<&cpr_efuse_init_voltage2>,
+			<&cpr_efuse_init_voltage3>,
+			<&cpr_efuse_quot1>,
+			<&cpr_efuse_quot2>,
+			<&cpr_efuse_quot3>,
+			<&cpr_efuse_ring1>,
+			<&cpr_efuse_ring2>,
+			<&cpr_efuse_ring3>,
+			<&cpr_efuse_revision>;
+		nvmem-cell-names = "cpr_quotient_offset1",
+			"cpr_quotient_offset2",
+			"cpr_quotient_offset3",
+			"cpr_init_voltage1",
+			"cpr_init_voltage2",
+			"cpr_init_voltage3",
+			"cpr_quotient1",
+			"cpr_quotient2",
+			"cpr_quotient3",
+			"cpr_ring_osc1",
+			"cpr_ring_osc2",
+			"cpr_ring_osc3",
+			"cpr_fuse_revision";
+
+		qcom,cpr-timer-delay-us = <5000>;
+		qcom,cpr-timer-cons-up = <0>;
+		qcom,cpr-timer-cons-down = <2>;
+		qcom,cpr-up-threshold = <1>;
+		qcom,cpr-down-threshold = <3>;
+		qcom,cpr-idle-clocks = <15>;
+		qcom,cpr-gcnt-us = <1>;
+		qcom,vdd-apc-step-up-limit = <1>;
+		qcom,vdd-apc-step-down-limit = <1>;
+	};
-- 
2.21.0
