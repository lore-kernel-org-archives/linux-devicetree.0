From: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to cpu0/cpu1 nodes
Date: Tue,  6 Aug 2019 23:22:40 -0700
Message-ID: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
for consistency with other cpu nodes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 42b5ec2..4befc70 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -22,6 +22,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		cpu0: cpu@0 {
+			clock-frequency = <0>;
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -37,6 +38,7 @@
 			};
 		};
 		cpu1: cpu@1 {
+			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
-- 
2.7.4
