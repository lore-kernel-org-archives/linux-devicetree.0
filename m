Return-Path: <SRS0=+lSs=PU=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH RFC 3/3] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI
 flash support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Message-ID: <b84e12ee-eb3a-8fdd-a702-b275b609a8e6@cogentembedded.com>
Date: Sat, 12 Jan 2019 20:45:48 +0300
MIME-Version: 1.0
In-Reply-To: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Define the Condor/V3HSK board dependent parts of the RPC-IF device node.
Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.

Based on the original patches by Dmitry Shifrin.

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   68 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |   68 ++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -264,6 +264,11 @@
 		power-source = <1800>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -275,6 +280,69 @@
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	renesas,rpc-mode = "spi";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -189,6 +189,11 @@
 		function = "i2c0";
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -200,6 +205,69 @@
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	renesas,rpc-mode = "spi";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@00040000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@000C0000 {
+				reg = <0x000C0000 0x080000>;
+				read-only;
+			};
+			bl2@00140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@00180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@001C0000 {
+				reg = <0x001C0000 0x460000>;
+				read-only;
+			};
+			uboot@00640000 {
+				reg = <0x00640000 0x0C0000>;
+				read-only;
+			};
+			uboot-env@00700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@00740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@007C0000 {
+				reg = <0x007C0000 0x1400000>;
+			};
+			user@01BC0000 {
+				reg = <0x01BC0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
