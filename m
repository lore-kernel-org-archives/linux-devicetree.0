From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am654: Populate power-domain property for
 UART nodes
Date: Wed, 12 Dec 2018 10:48:06 +0530
Message-ID: <20181212051806.21879-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Populate power-domain property for UART nodes, this is required for
Linux to enable UART clocks via PM calls. Without this UART instances
not initialized by bootloader (like main_uart1) fails to work in Linux.
Also, drop current-speed property from main_uart1 and main_uart2 nodes
as these UARTs are not initialized before Linux boots up and current
speed is unknown.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 5 +++--
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi    | 1 +
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 6c71e67b8988..272cf8fc8d30 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -48,6 +48,7 @@
 		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
 		current-speed = <115200>;
+		power-domains = <&k3_pds 146>;
 	};
 
 	main_uart1: serial@2810000 {
@@ -57,7 +58,7 @@
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
-		current-speed = <115200>;
+		power-domains = <&k3_pds 147>;
 	};
 
 	main_uart2: serial@2820000 {
@@ -67,7 +68,7 @@
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
-		current-speed = <115200>;
+		power-domains = <&k3_pds 148>;
 	};
 
 	main_pmx0: pinmux@11c000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 1aeae52fb239..593f718e8fb5 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -14,6 +14,7 @@
 			interrupts = <GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <96000000>;
 			current-speed = <115200>;
+			power-domains = <&k3_pds 149>;
 	};
 
 	mcu_i2c0: i2c@40b00000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index 9e8467ce7ad8..7cbdc0912ab7 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -50,6 +50,7 @@
 		interrupts = <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
 		current-speed = <115200>;
+		power-domains = <&k3_pds 150>;
 	};
 
 	wkup_i2c0: i2c@42120000 {
-- 
2.19.2
