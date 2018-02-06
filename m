From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/7] arm64: dts: Add ADI device node for Spreadtrum SC9860
Date: Tue,  6 Feb 2018 17:28:21 +0800
Message-ID: <b66796fb6c9e6ebc52be9f62d2543a23594e6909.1517908478.git.baolin.wang@linaro.org>
References: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang@linaro.org>
In-Reply-To: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang@linaro.org>
References: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: chunyan.zhang@spreadtrum.com, orson.zhai@spreadtrum.com, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

We will access the PMIC through ADI controller, thus this patch adds
the ADI device node for Spreadtrum SC9860 platform.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |    1 +
 arch/arm64/boot/dts/sprd/whale2.dtsi      |    9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index 0362ecd..550f323 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -22,6 +22,7 @@
 		serial1 = &uart1; /* UART console */
 		serial2 = &uart2; /* Reserved */
 		serial3 = &uart3; /* for GPS */
+		spi0 = &adi_bus;
 	};
 
 	memory{
diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index b9cc0fb..63fe89e 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -113,6 +113,15 @@
 			#size-cells = <2>;
 			ranges;
 
+			adi_bus: spi@40030000 {
+				compatible = "sprd,sc9860-adi";
+				reg = <0 0x40030000 0 0x10000>;
+				hwlocks = <&hwlock 0>;
+				hwlock-names = "adi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
 			hwlock: hwspinlock@40500000 {
 				compatible = "sprd,hwspinlock-r3p0";
 				reg = <0 0x40500000 0 0x1000>;
-- 
1.7.9.5
