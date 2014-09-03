From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/2] usb: renesas_usbhs: Add device tree bindings documentation
Date: Wed, 3 Sep 2014 14:25:40 +0900
Message-ID: <5406A654.3020806@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, SH-Linux <linux-sh@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Ulrich Hecht <ulrich.hecht@gmail.com>
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for the Renesas USBHS controller.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/usb/renesas_usbhs.txt      |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas_usbhs.txt

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
new file mode 100644
index 0000000..b08c903
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -0,0 +1,24 @@
+Renesas Electronics USBHS driver
+
+Required properties:
+  - compatible: Must contain one of the following:
+	- "renesas,usbhs-r8a7790"
+	- "renesas,usbhs-r8a7791"
+  - reg: Base address and length of the register for the USBHS
+  - interrupts: Interrupt specifier for the USBHS
+  - clocks: A list of phandle + clock specifier pairs
+
+Optional properties:
+  - renesas,buswait: Integer to use BUSWAIT register
+  - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
+			 function should be enabled
+  - phys: phandle + phy specifier pair
+  - phy-names: must be "usb"
+
+Example:
+	usbhs: usb@e6590000 {
+		compatible = "renesas,usbhs-r8a7790";
+		reg = <0 0xe6590000 0 0x100>;
+		interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp7_clks R8A7790_CLK_HSUSB>;
+	};
-- 
1.7.9.5

