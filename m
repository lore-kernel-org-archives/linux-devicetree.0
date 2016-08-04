From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH v2 10/17] ARM: dts: mvebu: armada-39x: add missing nodes
 describing GPIO's
Date: Thu,  4 Aug 2016 12:14:13 +0200
Message-ID: <1470305660-6601-11-git-send-email-jaz@semihalf.com>
References: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, jason@lakedaemon.net, jaz@semihalf.com, linux@armlinux.org.uk, nadavh@marvell.com, alior@marvell.com, robh+dt@kernel.org, gregory.clement@free-electrons.com, mw@semihalf.com, thomas.petazzoni@free-electrons.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

The whole Armada 39x SoC family of processors has GPIO's which all can be
supported with existing driver.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-39x.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
index 5e01438..0749878 100644
--- a/arch/arm/boot/dts/armada-39x.dtsi
+++ b/arch/arm/boot/dts/armada-39x.dtsi
@@ -55,6 +55,8 @@
 	compatible = "marvell,armada390";
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -274,6 +276,34 @@
 				};
 			};
 
+			gpio0: gpio@18100 {
+				compatible = "marvell,orion-gpio";
+				reg = <0x18100 0x40>;
+				ngpios = <32>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			gpio1: gpio@18140 {
+				compatible = "marvell,orion-gpio";
+				reg = <0x18140 0x40>;
+				ngpios = <28>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			system-controller@18200 {
 				compatible = "marvell,armada-390-system-controller",
 					     "marvell,armada-370-xp-system-controller";
-- 
1.8.3.1
