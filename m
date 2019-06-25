From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH] riscv: dts: Re-organize the DT nodes
Date: Tue, 25 Jun 2019 15:01:31 +0530
Message-ID: <1561455091-29488-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

As per the convention for any SOC device with external connection,
define only device DT node in SOC DTSi file with status = "disabled"
and enable device in Board DTS file with status = "okay"

Reported-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          |  6 ++++++
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 4e8fbde..cc73522 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -177,6 +177,7 @@
 			interrupt-parent = <&plic0>;
 			interrupts = <4>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
+			status = "disabled";
 		};
 		uart1: serial@10011000 {
 			compatible = "sifive,fu540-c000-uart", "sifive,uart0";
@@ -184,6 +185,7 @@
 			interrupt-parent = <&plic0>;
 			interrupts = <5>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
+			status = "disabled";
 		};
 		i2c0: i2c@10030000 {
 			compatible = "sifive,fu540-c000-i2c", "sifive,i2c0";
@@ -195,6 +197,7 @@
 			reg-io-width = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 		qspi0: spi@10040000 {
 			compatible = "sifive,fu540-c000-spi", "sifive,spi0";
@@ -205,6 +208,7 @@
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 		qspi1: spi@10041000 {
 			compatible = "sifive,fu540-c000-spi", "sifive,spi0";
@@ -215,6 +219,7 @@
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 		qspi2: spi@10050000 {
 			compatible = "sifive,fu540-c000-spi", "sifive,spi0";
@@ -224,6 +229,7 @@
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4da8870..0b55c53 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -42,7 +42,20 @@
 	};
 };
 
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
 &qspi0 {
+	status = "okay";
 	flash@0 {
 		compatible = "issi,is25wp256", "jedec,spi-nor";
 		reg = <0>;
-- 
1.9.1
