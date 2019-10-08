From: Joyce Ooi <joyce.ooi@intel.com>
Subject: [PATCH] arm64: dts: agilex: add QSPI support for Intel Agilex
Date: Tue,  8 Oct 2019 01:46:39 -0700
Message-ID: <1570524399-7192-1-git-send-email-joyce.ooi@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Joyce Ooi <joyce.ooi@intel.com>, Ong Hean Loong <hean.loong.ong@intel.com>, See Chin Liang <chin.liang.see@intel.com>, Tan Ley Foon <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

From: "Ooi, Joyce" <joyce.ooi@intel.com>

This patch adds QSPI flash interface in device tree for Intel Agilex

Signed-off-by: Ooi, Joyce <joyce.ooi@intel.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index 2ba9a5dc91aa..e3c5b007fb51 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -81,3 +81,38 @@
 &watchdog0 {
 	status = "okay";
 };
+
+&qspi {
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "mt25qu02g";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+
+		m25p,fast-read;
+		cdns,page-size = <256>;
+		cdns,block-size = <16>;
+		cdns,read-delay = <1>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x034B0000>;
+			};
+
+			qspi_rootfs: partition@34B0000 {
+				label = "Root Filesystem - JFFS2";
+				reg = <0x034B0000 0x0EB50000>;
+			};
+		};
+	};
+};
-- 
2.13.0
