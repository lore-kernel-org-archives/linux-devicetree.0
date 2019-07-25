From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 06/14] dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power domain
Date: Thu, 25 Jul 2019 12:41:34 +0200
Message-ID: <20190725104144.22924-7-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some Qualcomm SoCs have support for Core Power Reduction (CPR).
On these platforms, we need to attach to the power domain provider
providing the performance states, so that the leaky device (the CPU)
can configure the performance states (which represent different
CPU clock frequencies).

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 .../bindings/opp/qcom-nvmem-cpufreq.txt       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
index c5ea8b90e35d..e19a95318e98 100644
--- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
@@ -23,6 +23,15 @@ In 'operating-points-v2' table:
 
 Optional properties:
 --------------------
+In 'cpus' nodes:
+- power-domains: A phandle pointing to the PM domain specifier which provides
+		the performance states available for active state management.
+		Please refer to the power-domains bindings
+		Documentation/devicetree/bindings/power/power_domain.txt
+		and also examples below.
+- power-domain-names: Should be
+	- 'cpr' for qcs404.
+
 In 'operating-points-v2' table:
 - nvmem-cells: A phandle pointing to a nvmem-cells node representing the
 		efuse registers that has information about the
@@ -682,3 +691,105 @@ soc {
 		};
 	};
 };
+
+Example 2:
+---------
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+
+		CPU1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+
+		CPU2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+
+		CPU3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+	};
+
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2-kryo-cpu";
+		opp-shared;
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			required-opps = <&cpr_opp1>;
+		};
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			required-opps = <&cpr_opp2>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			required-opps = <&cpr_opp3>;
+		};
+	};
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
+....
+
+soc {
+....
+	cprpd: cpr@b018000 {
+		compatible = "qcom,qcs404-cpr", "qcom,cpr";
+		reg = <0x0b018000 0x1000>;
+		....
+		vdd-apc-supply = <&pms405_s3>;
+		#power-domain-cells = <0>;
+		operating-points-v2 = <&cpr_opp_table>;
+		....
+	};
+};
-- 
2.21.0
