From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/2] arm64: dts: add USB1-related nodes of Allwinner A64
Date: Sat,  5 Nov 2016 22:38:29 +0800
Message-ID: <20161105143830.10099-1-icenowy@aosc.xyz>
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
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allwinner A64 have two HCI USB controllers, a OTG controller and a USB
PHY device which have two ports. One of the port is wired to both a HCI
USB controller and the OTG controller, which is currently not supported.
The another one is only wired to a HCI controller, and the device node of
OHCI/EHCI controller of the port can be added now.

Also the A64 USB PHY device node is also added for the HCI controllers to
work.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 3d70be3..c2b6dc8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -259,5 +259,55 @@
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		usbphy: phy@01c19400 {
+			compatible = "allwinner,sun50i-a64-usb-phy";
+			reg = <0x01c19400 0x14>,
+			      <0x01c1b800 0x4>;
+			reg-names = "phy_ctrl",
+				    "pmu1";
+			clocks = <&ccu CLK_USB_PHY0>,
+				 <&ccu CLK_USB_PHY1>;
+			clock-names = "usb0_phy",
+				      "usb1_phy";
+			resets = <&ccu RST_USB_PHY0>,
+				 <&ccu RST_USB_PHY1>;
+			reset-names = "usb0_reset",
+				      "usb1_reset";
+			status = "disabled";
+			#phy-cells = <1>;
+		};
+
+		ohci1: usb@01c1a400 {
+			compatible = "allwinner,sun50i-a64-ohci", "generic-ohci";
+			reg = <0x01c1b400 0x100>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * According to the user manual, OHCI1 USB clock
+			 * depends on OHCI0 clock.
+			 */
+			clocks = <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_USB_OHCI0>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci1: usb@01c1a000 {
+			compatible = "allwinner,sun50i-a64-ehci", "generic-ehci";
+			reg = <0x01c1b000 0x100>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_BUS_EHCI1>,
+				 <&ccu CLK_USB_OHCI0>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>,
+				 <&ccu RST_BUS_EHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
 	};
 };
-- 
2.10.1
