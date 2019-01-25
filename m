From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 09/10] ARM64: dts: marvell: armada-37xx: declare USB2 UTMI
 PHYs
Date: Fri, 25 Jan 2019 11:39:23 +0100
Message-ID: <20190125103925.15753-10-miquel.raynal@bootlin.com>
References: <20190125103925.15753-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125103925.15753-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-usb@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Marvell Armada 3700 SoCs there are two USB2 UTMI PHYs. They are
both very similar but only one has OTG/charging capabilities.

Because there are USB host registers and PHY registers mixed in a
single area, a system controller is also created and referenced from
both the USB host node and the PHY node.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 5cfd1b920f31..d2d8ef00c592 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -344,18 +344,46 @@
 				compatible = "marvell,armada3700-xhci",
 				"generic-xhci";
 				reg = <0x58000 0x4000>;
+				marvell,usb-misc-reg = <&usb32_syscon>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
 				status = "disabled";
 			};
 
+			usb2_utmi_otg_phy: phy@5d000 {
+				compatible = "marvell,a3700-utmi-otg-phy";
+				reg = <0x5d000 0x800>;
+				marvell,usb-misc-reg = <&usb32_syscon>;
+				#phy-cells = <0>;
+			};
+
+			usb32_syscon: system-controller@5d800 {
+				compatible = "marvell,armada-3700-usb2-host-device-misc",
+				"syscon";
+				reg = <0x5d800 0x800>;
+			};
+
 			usb2: usb@5e000 {
 				compatible = "marvell,armada-3700-ehci";
 				reg = <0x5e000 0x1000>;
+				marvell,usb-misc-reg = <&usb2_syscon>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
+			usb2_utmi_host_phy: phy@5f000 {
+				compatible = "marvell,a3700-utmi-host-phy";
+				reg = <0x5f000 0x800>;
+				marvell,usb-misc-reg = <&usb2_syscon>;
+				#phy-cells = <0>;
+			};
+
+			usb2_syscon: system-controller@5f800 {
+				compatible = "marvell,armada-3700-usb2-host-misc",
+				"syscon";
+				reg = <0x5f800 0x800>;
+			};
+
 			xor@60900 {
 				compatible = "marvell,armada-3700-xor";
 				reg = <0x60900 0x100>,
-- 
2.19.1
