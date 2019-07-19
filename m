From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 3/3] riscv: dts: Add DT node for SiFive FU540 Ethernet controller driver
Date: Fri, 19 Jul 2019 16:40:31 +0530
Message-ID: <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, paul.walmsley@sifive.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, nicolas.ferre@microchip.com, ynezz@true.cz, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index cc73522..588669f0 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -231,5 +231,20 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-c000-gem";
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			reg = <0x0 0x10090000 0x0 0x2000
+			       0x0 0x100a0000 0x0 0x1000>;
+			local-mac-address = [00 00 00 00 00 00];
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 	};
 };
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 0b55c53..85c17a7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -76,3 +76,12 @@
 		disable-wp;
 	};
 };
+
+&eth0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
-- 
1.9.1
