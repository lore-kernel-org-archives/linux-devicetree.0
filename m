From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCHv2] arm64: dts: ls1028a: add flexspi nodes
Date: Wed, 15 May 2019 11:09:25 +0000
Message-ID: <20190515110924.13726-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Xiaowei Bao <xiaowei.bao@nxp.com>

Add fspi node property for LS1028A SoC for FlexSPI driver.
Property added for the FlexSPI controller and for the connected
slave device for the LS1028ARDB and LS1028AQDS target.
This is having one SPI-NOR flash device, mt35xu02g connected at
CS0.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2:
 - modify the commit message and the dts format.

 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts |   15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |   15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    |   12 ++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index 5bcd491..6e12806 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -158,6 +158,21 @@
 	};
 };
 
+&fspi {
+	status = "okay";
+	mt35xu02g: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,m25p80";
+		m25p,fast-read;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
+		spi-rx-bus-width = <8>; /* 8 SPI Rx lines */
+		spi-tx-bus-width = <1>; /* 1 SPI Tx line */
+	};
+};
+
 &sai1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index 25d2370..5d39616 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -136,6 +136,21 @@
 	};
 };
 
+&fspi {
+	status = "okay";
+	mt35xu02g: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,m25p80";
+		m25p,fast-read;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
+		spi-rx-bus-width = <8>; /* 8 SPI Rx lines */
+		spi-tx-bus-width = <1>; /* 1 SPI Tx line */
+	};
+};
+
 &duart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index ba71a33..a27cd60 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -109,6 +109,18 @@
 		};
 	};
 
+	fspi: spi@20c0000 {
+		compatible = "nxp,lx2160a-fspi", "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0x20c0000 0x0 0x10000>,
+		    <0x0 0x20000000 0x0 0x10000000>;
+		reg-names = "FSPI", "FSPI-memory";
+		interrupts = <0 25 0x4>; /* Level high type */
+		clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+		clock-names = "fspi_en", "fspi";
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
1.7.1
