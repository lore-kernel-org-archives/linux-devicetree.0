From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 2/5] dt-bindings: usb: add binding for the DWC3
 controller on Allwinner SoC
Date: Mon,  7 May 2018 23:18:14 +0800
Message-ID: <20180507151817.55663-3-icenowy@aosc.io>
References: <20180507151817.55663-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBYO6YHLQKGQE23CW4RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180507151817.55663-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner H6 SoC uses DWC3 controller for USB3.

Add its device tree binding document.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 .../bindings/usb/allwinner,dwc3.txt           | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/allwinner,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/allwinner,dwc3.txt b/Documentation/devicetree/bindings/usb/allwinner,dwc3.txt
new file mode 100644
index 000000000000..3f7714636785
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/allwinner,dwc3.txt
@@ -0,0 +1,39 @@
+Allwinner SuperSpeed DWC3 USB SoC controller
+
+Required properties:
+- compatible:	should contain "allwinner,sun50i-h6-dwc3" for H6 SoC
+- clocks:	A list of phandle + clock-specifier pairs for the
+		clocks listed in clock-names
+- clock-names:	Should contain the following:
+  "bus"		The bus clock of the DWC3 part
+- resets:	A list of phandle + reset-specifier pairs for the
+		resets listed in reset-names
+- reset-names:	Should contain the following:
+  "bus"		The bus reset of the DWC3 part
+
+Required child node:
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+Phy documentation is provided in the following places:
+Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
+
+Example device nodes:
+	usb3: usb@5200000 {
+		compatible = "allwinner,sun50i-h6-dwc3";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&ccu CLK_BUS_XHCI>;
+		clock-names = "bus";
+		resets = <&ccu RST_BUS_XHCI>;
+		reset-names = "bus";
+
+		dwc3: dwc3 {
+			compatible = "snps,dwc3";
+			reg = <0x5200000 0x10000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb3phy>;
+			phy-names = "usb3-phy";
+		};
+	};
-- 
2.17.0
