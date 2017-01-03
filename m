From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 3/4] ARM: dts: sunxi: add usb_otg and usbphy node for V3s SoC
Date: Tue,  3 Jan 2017 23:25:33 +0800
Message-ID: <20170103152534.20118-4-icenowy@aosc.xyz>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170103152534.20118-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, Bin Liu <b-liu@ti.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

V3s SoC features a USB PHY controller and a MUSB OTG controller.

Add device nodes for them.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 084da7474afb..ebefc0fefef2 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -153,6 +153,33 @@
 			#size-cells = <0>;
 		};
 
+		usb_otg: usb@01c19000 {
+			compatible = "allwinner,sun8i-h3-musb";
+			reg = <0x01c19000 0x0400>;
+			clocks = <&ccu CLK_BUS_OTG>;
+			resets = <&ccu RST_BUS_OTG>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			extcon = <&usbphy 0>;
+			status = "disabled";
+		};
+
+		usbphy: phy@01c19400 {
+			compatible = "allwinner,sun8i-v3s-usb-phy";
+			reg = <0x01c19400 0x2c>,
+			      <0x01c1a800 0x4>;
+			reg-names = "phy_ctrl",
+				    "pmu0";
+			clocks = <&ccu CLK_USB_PHY0>;
+			clock-names = "usb0_phy";
+			resets = <&ccu RST_USB_PHY0>;
+			reset-names = "usb0_reset";
+			status = "disabled";
+			#phy-cells = <1>;
+		};
+
 		ccu: clock@01c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.11.0
