From: Ashish Kumar <Ashish.Kumar@nxp.com>
Subject: [PATCH] arm64: dts: ls1088a: Add QSPI support for NXP LS1088
Date: Tue, 10 Sep 2019 17:50:54 +0530
Message-ID: <1568118055-9740-4-git-send-email-Ashish.Kumar@nxp.com>
References: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ashish Kumar <Ashish.Kumar@nxp.com>, Kuldeep Singh <kuldeep.singh@nxp.com>
List-Id: devicetree@vger.kernel.org

Add QSPI node in dtsi(ls1088si), and dts(ls1088ardb, ls1088aqds) boards.

Both ls1088ardb and ls1088aqds has two 64MB flash from SPANSION(s25fs512s).
QUAD I/O is tested in case of read and single I/O is tested in case of
write.

Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
Signed-off-by: Ashish Kumar <Ashish.Kumar@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts | 26 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts | 26 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 13 ++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
index 120e62d..3347e6a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
@@ -143,6 +143,32 @@
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	qflash0: s25fs512s@0 {
+		compatible = "spansion,s25fs512a", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+
+	qflash1: s25fs512s@1 {
+		compatible = "spansion,s25fs512a", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <1>;
+	};
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 8e925df..09d3203 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -86,6 +86,32 @@
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	qflash0: s25fs512s@0 {
+		compatible = "spansion,s25fs512a", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+
+	qflash1: s25fs512s@1 {
+		compatible = "spansion,s25fs512a", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <1>;
+	};
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index d1469b0..5a81a7e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -408,6 +408,19 @@
 			status = "disabled";
 		};
 
+		qspi: spi@20c0000 {
+			compatible = "fsl,ls2080a-qspi", "fsl,ls1088a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20c0000 0x0 0x10000>,
+			      <0x0 0x20000000 0x0 0x10000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			status = "disabled";
+		};
+
 		sata: sata@3200000 {
 			compatible = "fsl,ls1088a-ahci";
 			reg = <0x0 0x3200000 0x0 0x10000>,
-- 
2.7.4
