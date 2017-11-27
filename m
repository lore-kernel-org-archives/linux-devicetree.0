From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V6 11/12] arm64: dts: add syscon for whale2 platform
Date: Mon, 27 Nov 2017 18:01:14 +0800
Message-ID: <20171127100115.20655-12-chunyan.zhang@spreadtrum.com>
References: <20171127100115.20655-1-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127100115.20655-1-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

Some clocks on SC9860 are in the same address area with syscon
devices, the proper syscon node will be quoted under the
definitions of those clocks in DT.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 7c217c5..6ea3a75 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -17,6 +17,51 @@
 		#size-cells = <2>;
 		ranges;
 
+		ap_ahb_regs: syscon@20210000 {
+			compatible = "syscon";
+			reg = <0 0x20210000 0 0x10000>;
+		};
+
+		pmu_regs: syscon@402b0000 {
+			compatible = "syscon";
+			reg = <0 0x402b0000 0 0x10000>;
+		};
+
+		aon_regs: syscon@402e0000 {
+			compatible = "syscon";
+			reg = <0 0x402e0000 0 0x10000>;
+		};
+
+		ana_regs: syscon@40400000 {
+			compatible = "syscon";
+			reg = <0 0x40400000 0 0x10000>;
+		};
+
+		agcp_regs: syscon@415e0000 {
+			compatible = "syscon";
+			reg = <0 0x415e0000 0 0x1000000>;
+		};
+
+		vsp_regs: syscon@61100000 {
+			compatible = "syscon";
+			reg = <0 0x61100000 0 0x10000>;
+		};
+
+		cam_regs: syscon@62100000 {
+			compatible = "syscon";
+			reg = <0 0x62100000 0 0x10000>;
+		};
+
+		disp_regs: syscon@63100000 {
+			compatible = "syscon";
+			reg = <0 0x63100000 0 0x10000>;
+		};
+
+		ap_apb_regs: syscon@70b00000 {
+			compatible = "syscon";
+			reg = <0 0x70b00000 0 0x40000>;
+		};
+
 		ap-apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
@@ -59,7 +104,6 @@
 				status = "disabled";
 			};
 		};
-
 	};
 
 	ext_26m: ext-26m {
-- 
2.7.4
