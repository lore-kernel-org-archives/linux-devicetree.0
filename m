Return-Path: <SRS0=k+DT=RJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/9] dt-bindings: usb: hd3ss3220 device tree binding document
Date: Wed,  6 Mar 2019 09:07:18 +0000
Message-Id: <1551863246-11656-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add device tree binding document for TI HD3SS3220 Type-C DRP port
controller driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
new file mode 100644
index 0000000..1fcf6f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
@@ -0,0 +1,15 @@
+TI HD3SS3220 TypeC DRP Port Controller.
+
+Required properties:
+ - compatible: Must be "ti,hd3ss3220".
+ - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
+ - interrupts: <a b> where a is the interrupt number and b represents an
+   encoding of the sense and level information for the interrupt.
+
+Example:
+hd3ss3220@47 {
+	compatible = "ti,hd3ss3220";
+	reg = <0x47>;
+	interrupt-parent = <&gpio6>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.7.4
