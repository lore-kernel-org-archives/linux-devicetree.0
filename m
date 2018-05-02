From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH] ARM: dts: stm32: Fix DTC warnings for stm32mp157
Date: Wed, 2 May 2018 09:51:38 +0200
Message-ID: <1525247498-12834-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix DTC warnings for stm32mp157:

Warning (unit_address_vs_reg): /soc/pin-controller: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /soc/pin-controller/uart4@0: node has a unit name, but no reg property
Warning (unit_address_vs_reg): /soc/pin-controller-z: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 6f044100..8534371 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -7,7 +7,7 @@
 
 / {
 	soc {
-		pinctrl: pin-controller {
+		pinctrl: pin-controller@50002000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-pinctrl";
@@ -146,7 +146,7 @@
 				gpio-ranges = <&pinctrl 0 160 8>;
 			};
 
-			uart4_pins_a: uart4@0 {
+			uart4_pins_a: uart4-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
 					bias-disable;
@@ -160,7 +160,7 @@
 			};
 		};
 
-		pinctrl_z: pin-controller-z {
+		pinctrl_z: pin-controller-z@54004000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-z-pinctrl";
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 9f90337a..86ede40 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -16,7 +16,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		reg = <0xC0000000 0x40000000>;
 	};
 
-- 
2.7.4
