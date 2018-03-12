Return-Path: <SRS0=Fxpb=GC=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v5 1/2] dt-bindings: phy: Add support for the USB3 PHY on Amlogic Meson GXL SoCs
Date: Mon, 12 Mar 2018 22:11:12 +0100
Message-Id: <20180312211113.26784-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180312211113.26784-1-martin.blumenstingl@googlemail.com>
References: <20180312211113.26784-1-martin.blumenstingl@googlemail.com>
To: kishon@ti.com, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, carlo@caione.org, khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com, yixun.lan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
for GXL, has three) USB2 ports. The first USB2 port supports host and
peripheral (also called "device") mode.
While the dwc3 controller has no USB3 port enabled we still need the
USB3 PHY to be initialized. Otherwise high-speed USB transfers (for
example with a USB flash drive) may time out (most often seen on boards
with mainline u-boot, where the bootloader does not initialize the USB3
PHY registers).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Yixun Lan <yixun.lan@amlogic.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.con>
---
 .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
new file mode 100644
index 000000000000..114947e1de3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
@@ -0,0 +1,31 @@
+* Amlogic Meson GXL and GXM USB3 PHY and OTG detection binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb3-phy"
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+- reg:		The base address and length of the registers
+- interrupts:	the interrupt specifier for the OTG detection
+- clocks:	phandles to the clocks for
+		- the USB3 PHY
+		- and peripheral mode/OTG detection
+- clock-names:	must contain "phy" and "peripheral"
+- resets:	phandle to the reset lines for:
+		- the USB3 PHY and
+		- peripheral mode/OTG detection
+- reset-names:	must contain "phy" and "peripheral"
+
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb3_phy0: phy@78080 {
+		compatible = "amlogic,meson-gxl-usb3-phy";
+		#phy-cells = <0>;
+		reg = <0x0 0x78080 0x0 0x20>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clkc CLKID_USB_OTG>, <&clkc_AO CLKID_AO_CEC_32K>;
+		clock-names = "phy", "peripheral";
+		resets = <&reset RESET_USB_OTG>, <&reset RESET_USB_OTG>;
+		reset-names = "phy", "peripheral";
+	};
-- 
2.16.2
