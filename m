From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH] riscv: dts: Add DT node for SiFive FU540 Ethernet controller driver
Date: Fri, 21 Jun 2019 11:40:22 +0530
Message-ID: <1561097422-25130-2-git-send-email-yash.shah@sifive.com>
References: <1561097422-25130-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561097422-25130-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 4e8fbde..584e737 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -225,5 +225,25 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-macb";
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			reg = <0x0 0x10090000 0x0 0x2000
+			       0x0 0x100a0000 0x0 0x1000>;
+			reg-names = "control";
+			local-mac-address = [00 00 00 00 00 00];
+			phy-mode = "gmii";
+			phy-handle = <&phy1>;
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy1: ethernet-phy@0 {
+				reg = <0>;
+			};
+		};
+
 	};
 };
-- 
1.9.1
