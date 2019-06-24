From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH] riscv: dts: Re-organize SPI DT nodes
Date: Mon, 24 Jun 2019 16:54:13 +0530
Message-ID: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

As per the General convention, define only device DT node in SOC DTSi
file with status = "disabled" and enable device in Board DTS file with
status = "okay"

Reported-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 3 +++
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 4e8fbde..270f6e8 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -203,6 +203,7 @@
 			interrupt-parent = <&plic0>;
 			interrupts = <51>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
+			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
@@ -213,6 +214,7 @@
 			interrupt-parent = <&plic0>;
 			interrupts = <52>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
+			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
@@ -222,6 +224,7 @@
 			interrupt-parent = <&plic0>;
 			interrupts = <6>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
+			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4da8870..73e2af6 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -43,6 +43,7 @@
 };
 
 &qspi0 {
+	status = "okay";
 	flash@0 {
 		compatible = "issi,is25wp256", "jedec,spi-nor";
 		reg = <0>;
-- 
1.9.1
