From: Domenico Andreoli <cavokz@gmail.com>
Subject: [PATCH 6/6] ARM: bcm476x: Instantiate console UART
Date: Sun, 07 Oct 2012 03:53:06 +0200
Message-ID: <20121007015407.840781689@gmail.com>
References: <20121007015300.828366635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline;
 filename=arm-bcm476x-instantiate-console-uart.patch
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Domenico Andreoli <domenico.andreoli@linux.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli@linux.com>

The BCM476x sports standard PL011 UARTs which are fully described and
put to use with these few changes.

Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
---
 arch/arm/Kconfig.debug         |   16 ++++++++++++++++
 arch/arm/boot/dts/bcm476x.dtsi |   23 ++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

Index: b/arch/arm/boot/dts/bcm476x.dtsi
===================================================================
--- a/arch/arm/boot/dts/bcm476x.dtsi
+++ b/arch/arm/boot/dts/bcm476x.dtsi
@@ -5,7 +5,7 @@
 	model = "Broadcom BCM476x";
 
 	chosen {
-		bootargs = "earlyprintk";
+		bootargs = "console=ttyAMA1";
 	};
 
 	amba {
@@ -41,5 +41,26 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		uart0@c0000 {
+			compatible = "brcm,bcm476x-pl011", "arm,pl011", "arm,primecell";
+			reg = <0xc0000 0x1000>;
+			interrupt-parent = <&vic0>;
+			interrupts = <14>;
+		};
+
+		uart1@c1000 {
+			compatible = "brcm,bcm476x-pl011", "arm,pl011", "arm,primecell";
+			reg = <0xc1000 0x1000>;
+			interrupt-parent = <&vic0>;
+			interrupts = <15>;
+		};
+
+		uart2@b2000 {
+			compatible = "brcm,bcm476x-pl011", "arm,pl011", "arm,primecell";
+			reg = <0xb2000 0x1000>;
+			interrupt-parent = <&vic0>;
+			interrupts = <16>;
+		};
 	};
 };
Index: b/arch/arm/Kconfig.debug
===================================================================
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -89,6 +89,18 @@ choice
 		bool "Kernel low-level debugging on 9263 and 9g45"
 		depends on HAVE_AT91_DBGU1
 
+	config DEBUG_BCM476X_UART0
+		depends on ARCH_BCM476X
+		bool "Kernel low-level debugging on BCM476x UART 0"
+
+	config DEBUG_BCM476X_UART1
+		depends on ARCH_BCM476X
+		bool "Kernel low-level debugging on BCM476x UART 1"
+
+	config DEBUG_BCM476X_UART2
+		depends on ARCH_BCM476X
+		bool "Kernel low-level debugging on BCM476x UART 2"
+
 	config DEBUG_CLPS711X_UART1
 		bool "Kernel low-level debugging messages via UART1"
 		depends on ARCH_CLPS711X
@@ -404,6 +416,8 @@ endchoice
 
 config DEBUG_LL_INCLUDE
 	string
+	default "debug/bcm476x.S" if DEBUG_BCM476X_UART0 || \
+		DEBUG_BCM476X_UART1 || DEBUG_BCM476X_UART2
 	default "debug/icedcc.S" if DEBUG_ICEDCC
 	default "debug/highbank.S" if DEBUG_HIGHBANK_UART
 	default "debug/mvebu.S" if DEBUG_MVEBU_UART
@@ -416,6 +430,8 @@ config DEBUG_LL_INCLUDE
 
 config UNCOMPRESS_INCLUDE
 	string
+	default "debug/bcm476x-uncompress.h" if DEBUG_BCM476X_UART0 || \
+		DEBUG_BCM476X_UART1 || DEBUG_BCM476X_UART2
 	default "debug/icedcc-uncompress.h" if DEBUG_ICEDCC
 	default "debug/mvebu-uncompress.h" if DEBUG_MVEBU_UART
 	default "debug/tegra-uncompress.h" if DEBUG_TEGRA_UART
