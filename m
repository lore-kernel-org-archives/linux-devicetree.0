From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH v2 11/17] ARM: dts: mvebu: armada-39x: add missing nodes
 describing USB2.0 and USB3.0
Date: Thu,  4 Aug 2016 12:14:14 +0200
Message-ID: <1470305660-6601-12-git-send-email-jaz@semihalf.com>
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

The whole Armada 39x SoC family of processors has one USB2.0 and one
USB3.0 which all can be supported with existing drivers.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-39x.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
index 0749878..1225cd8 100644
--- a/arch/arm/boot/dts/armada-39x.dtsi
+++ b/arch/arm/boot/dts/armada-39x.dtsi
@@ -381,6 +381,14 @@
 				reg = <0x22000 0x1000>;
 			};
 
+			usb@58000 {
+				compatible = "marvell,orion-ehci";
+				reg = <0x58000 0x500>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gateclk 18>;
+				status = "disabled";
+			};
+
 			xor@60800 {
 				compatible = "marvell,armada-380-xor", "marvell,orion-xor";
 				reg = <0x60800 0x100
@@ -457,6 +465,14 @@
 				reg = <0xe4078 0x4>, <0xe4074 0x4>;
 				status = "okay";
 			};
+
+			usb3@f8000 {
+				compatible = "marvell,armada-380-xhci";
+				reg = <0xf8000 0x4000>,<0xfc000 0x4000>;
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gateclk 10>;
+				status = "disabled";
+			};
 		};
 
 		pcie-controller {
-- 
1.8.3.1
