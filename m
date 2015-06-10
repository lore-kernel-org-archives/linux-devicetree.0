From: Suneel Garapati <suneel.garapati@xilinx.com>
Subject: [PATCH] devicetree: xilinx: zynqmp: add sata node
Date: Wed, 10 Jun 2015 15:46:56 +0530
Message-ID: <1433931416-6661-1-git-send-email-suneel.garapati@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@vger.kernel.org
Cc: michals@xilinx.com, sorenb@xilinx.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Suneel Garapati <suneel.garapati@xilinx.com>
List-Id: devicetree@vger.kernel.org

add sata node with sata fixed clock nodes in dtsi file.
enable sata in zynqmp-ep108.dts with broken-gen2.

Signed-off-by: Suneel Garapati <suneel.garapati@xilinx.com>
---
Note -
Driver and bindings are added via libata/for-4.2 tree
bindings is found in Documentation/devicetree/bindings/ata/ahci-ceva.txt
---
 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts |  5 +++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 0a3f40e..981e594 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -42,6 +42,11 @@
	};
 };

+&sata {
+	status = "okay";
+	ceva,broken-gen2;
+};
+
 &uart0 {
	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 11e0b00..e7545ed 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -272,6 +272,21 @@
			#size-cells = <0>;
		};

+		sata_clk: sata_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <75000000>;
+		};
+
+		sata0: ahci@fd0c0000 {
+			compatible = "ceva,ahci-1v84";
+			status = "disabled";
+			reg = <0x0 0xfd0c0000 0x2000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 133 4>;
+			clocks = <&sata_clk>;
+		};
+
		sdhci0: sdhci@ff160000 {
			compatible = "arasan,sdhci-8.9a";
			status = "disabled";
--
2.1.2
