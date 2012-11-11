From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 05/14] ARM: SPEAr: DT: Fix existing DT support
Date: Sun, 11 Nov 2012 10:09:27 +0530
Message-ID: <54af2cac3d1b6c2d3470fccc1ce290855ca516e8.1352608333.git.viresh.kumar@linaro.org>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar@linaro.org>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>, Bhavna Yadav <bhavna.yadav@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, Vipin Kumar <vipin.kumar@st.com>, Rajeev Kumar <rajeev-dlh.kumar@st.com>, Deepak Sikri <deepak.sikri@st.com>, sr@denx.de, linux-arm-kernel@lists.infradead.org, Vijay Kumar Mishra <vijay.kumar@st.com>
List-Id: devicetree@vger.kernel.org

From: Vipul Kumar Samar <vipulkumar.samar@st.com>

This patch fixes existing DT support for all SPEAr SoC's. This includes:
- Removing few nodes from board files
- Updating DT data of few nodes
- Updating ranges of few busses
- Moving devices to correct parent bus

Signed-off-by: Bhavna Yadav <bhavna.yadav@st.com>
Signed-off-by: Deepak Sikri <deepak.sikri@st.com>
Signed-off-by: Rajeev Kumar <rajeev-dlh.kumar@st.com>
Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
Signed-off-by: Vijay Kumar Mishra <vijay.kumar@st.com>
Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear1310-evb.dts | 13 +++++--------
 arch/arm/boot/dts/spear1310.dtsi    | 14 +++++++-------
 arch/arm/boot/dts/spear1340-evb.dts |  9 +++++----
 arch/arm/boot/dts/spear1340.dtsi    |  1 +
 arch/arm/boot/dts/spear13xx.dtsi    | 33 ++++++++++++++++++++++-----------
 arch/arm/boot/dts/spear300.dtsi     |  2 +-
 arch/arm/boot/dts/spear320-evb.dts  |  5 +----
 arch/arm/boot/dts/spear320.dtsi     |  4 ++--
 arch/arm/boot/dts/spear3xx.dtsi     |  2 +-
 9 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 2e2887b..79a1654 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -192,10 +192,6 @@
 			};
 		};
 
-		spi0: spi@e0100000 {
-			status = "okay";
-		};
-
 		ehci@e4800000 {
 			status = "okay";
 		};
@@ -229,10 +225,6 @@
 			       status = "okay";
 			};
 
-			i2c1: i2c@5cd00000 {
-			       status = "okay";
-			};
-
 			kbd@e0300000 {
 				linux,keymap = < 0x00000001
 						 0x00010002
@@ -317,6 +309,7 @@
 						 0x08080052 >;
 			       autorepeat;
 			       st,mode = <0>;
+			       suspended_rate = <2000000>;
 			       status = "okay";
 			};
 
@@ -328,6 +321,10 @@
 			       status = "okay";
 			};
 
+			spi0: spi@e0100000 {
+				status = "okay";
+			};
+
 			wdt@ec800620 {
 			       status = "okay";
 			};
diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
index d5661ee..1e18f31 100644
--- a/arch/arm/boot/dts/spear1310.dtsi
+++ b/arch/arm/boot/dts/spear1310.dtsi
@@ -82,13 +82,6 @@
 			status = "disabled";
 		};
 
-		spi1: spi@5d400000 {
-			compatible = "arm,pl022", "arm,primecell";
-			reg = <0x5d400000 0x1000>;
-			interrupts = <0 99 0x4>;
-			status = "disabled";
-		};
-
 		apb {
 			i2c1: i2c@5cd00000 {
 				#address-cells = <1>;
@@ -153,6 +146,13 @@
 				status = "disabled";
 			};
 
+			spi1: spi@5d400000 {
+				compatible = "arm,pl022", "arm,primecell";
+				reg = <0x5d400000 0x1000>;
+				interrupts = <0 99 0x4>;
+				status = "disabled";
+			};
+
 			serial@5c800000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0x5c800000 0x1000>;
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index 8d6339d..4c5fa85 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -200,10 +200,6 @@
 			};
 		};
 
-		spi0: spi@e0100000 {
-			status = "okay";
-		};
-
 		ehci@e4800000 {
 			status = "okay";
 		};
@@ -325,6 +321,7 @@
 						 0x08080052 >;
 			       autorepeat;
 			       st,mode = <0>;
+			       suspended_rate = <2000000>;
 			       status = "okay";
 			};
 
@@ -340,6 +337,10 @@
 			       status = "okay";
 			};
 
+			spi0: spi@e0100000 {
+				status = "okay";
+			};
+
 			wdt@ec800620 {
 			       status = "okay";
 			};
diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index 1604425..1446f1b 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -52,6 +52,7 @@
 				compatible = "snps,designware-i2c";
 				reg = <0xb4000000 0x1000>;
 				interrupts = <0 104 0x4>;
+				write-16bit;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
index f7b84ac..4d35144 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -70,6 +70,8 @@
 		compatible = "simple-bus";
 		ranges = <0x50000000 0x50000000 0x10000000
 			  0xb0000000 0xb0000000 0x10000000
+			  0xd0000000 0xd0000000 0x02000000
+			  0xd8000000 0xd8000000 0x01000000
 			  0xe0000000 0xe0000000 0x10000000>;
 
 		sdhci@b3000000 {
@@ -81,7 +83,7 @@
 
 		cf@b2800000 {
 			compatible = "arasan,cf-spear1340";
-			reg = <0xb2800000 0x100>;
+			reg = <0xb2800000 0x1000>;
 			interrupts = <0 29 0x4>;
 			status = "disabled";
 		};
@@ -113,6 +115,7 @@
 				      0 23 0x4>;
 			st,ale-off = <0x20000>;
 			st,cle-off = <0x10000>;
+			st,mode = <2>;
 			status = "disabled";
 		};
 
@@ -134,17 +137,11 @@
 			status = "disabled";
 		};
 
-		spi0: spi@e0100000 {
-			compatible = "arm,pl022", "arm,primecell";
-			reg = <0xe0100000 0x1000>;
-			interrupts = <0 31 0x4>;
-			status = "disabled";
-		};
-
 		ehci@e4800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe4800000 0x1000>;
 			interrupts = <0 64 0x4>;
+			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -152,6 +149,7 @@
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe5800000 0x1000>;
 			interrupts = <0 66 0x4>;
+			usbh1_id = <1>;
 			status = "disabled";
 		};
 
@@ -159,6 +157,7 @@
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe4000000 0x1000>;
 			interrupts = <0 65 0x4>;
+			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -166,6 +165,7 @@
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe5000000 0x1000>;
 			interrupts = <0 67 0x4>;
+			usbh1_id = <1>;
 			status = "disabled";
 		};
 
@@ -175,6 +175,8 @@
 			compatible = "simple-bus";
 			ranges = <0x50000000 0x50000000 0x10000000
 				  0xb0000000 0xb0000000 0x10000000
+				  0xd0000000 0xd0000000 0x02000000
+				  0xd8000000 0xd8000000 0x01000000
 				  0xe0000000 0xe0000000 0x10000000>;
 
 			gpio0: gpio@e0600000 {
@@ -215,8 +217,15 @@
 				status = "disabled";
 			};
 
+			spi0: spi@e0100000 {
+				compatible = "arm,pl022", "arm,primecell";
+				reg = <0xe0100000 0x1000>;
+				interrupts = <0 31 0x4>;
+				status = "disabled";
+			};
+
 			rtc@e0580000 {
-				compatible = "st,spear-rtc";
+				compatible = "st,spear600-rtc";
 				reg = <0xe0580000 0x1000>;
 				interrupts = <0 36 0x4>;
 				status = "disabled";
@@ -232,7 +241,7 @@
 			adc@e0080000 {
 				compatible = "st,spear600-adc";
 				reg = <0xe0080000 0x1000>;
-				interrupts = <0 44 0x4>;
+				interrupts = <0 12 0x4>;
 				status = "disabled";
 			};
 
@@ -245,7 +254,8 @@
 			timer@ec800600 {
 				compatible = "arm,cortex-a9-twd-timer";
 				reg = <0xec800600 0x20>;
-				interrupts = <1 13 0x301>;
+				interrupts = <1 13 0x4>;
+				status = "disabled";
 			};
 
 			wdt@ec800620 {
@@ -257,6 +267,7 @@
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
+				thermal_flags = <0x7000>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/spear300.dtsi b/arch/arm/boot/dts/spear300.dtsi
index ed3627c..fdac871 100644
--- a/arch/arm/boot/dts/spear300.dtsi
+++ b/arch/arm/boot/dts/spear300.dtsi
@@ -27,7 +27,7 @@
 		};
 
 		clcd@60000000 {
-			compatible = "arm,clcd-pl110", "arm,primecell";
+			compatible = "arm,pl110", "arm,primecell";
 			reg = <0x60000000 0x1000>;
 			interrupts = <30>;
 			status = "disabled";
diff --git a/arch/arm/boot/dts/spear320-evb.dts b/arch/arm/boot/dts/spear320-evb.dts
index a3061ad..d62ee20 100644
--- a/arch/arm/boot/dts/spear320-evb.dts
+++ b/arch/arm/boot/dts/spear320-evb.dts
@@ -82,10 +82,6 @@
 			};
 		};
 
-		clcd@90000000 {
-			status = "okay";
-		};
-
 		dma@fc400000 {
 			status = "okay";
 		};
@@ -99,6 +95,7 @@
 		};
 
 		sdhci@70000000 {
+			power-gpio = <&gpiopinctrl 61 1>;
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
index 1f49d69..02113f3 100644
--- a/arch/arm/boot/dts/spear320.dtsi
+++ b/arch/arm/boot/dts/spear320.dtsi
@@ -27,7 +27,7 @@
 		};
 
 		clcd@90000000 {
-			compatible = "arm,clcd-pl110", "arm,primecell";
+			compatible = "arm,pl110", "arm,primecell";
 			reg = <0x90000000 0x1000>;
 			interrupts = <33>;
 			status = "disabled";
@@ -68,7 +68,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
-			ranges = <0xa0000000 0xa0000000 0x10000000
+			ranges = <0xa0000000 0xa0000000 0x20000000
 				  0xd0000000 0xd0000000 0x30000000>;
 
 			i2c1: i2c@a7000000 {
diff --git a/arch/arm/boot/dts/spear3xx.dtsi b/arch/arm/boot/dts/spear3xx.dtsi
index 3a8bb57..b02721f 100644
--- a/arch/arm/boot/dts/spear3xx.dtsi
+++ b/arch/arm/boot/dts/spear3xx.dtsi
@@ -120,7 +120,7 @@
 			};
 
 			rtc@fc900000 {
-				compatible = "st,spear-rtc";
+				compatible = "st,spear600-rtc";
 				reg = <0xfc900000 0x1000>;
 				interrupts = <10>;
 				status = "disabled";
-- 
1.7.12.rc2.18.g61b472e
