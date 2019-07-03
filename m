Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 7/7] dt-bindings: usb: ehci: Fix example warnings
Date: Wed,  3 Jul 2019 11:55:13 +0200
Message-Id: <20190703095513.12340-7-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The example of the EHCI binding generates a bunch of warnings now that the
examples are validated too.

Most notably, phy-names isn't used at all, and the node name should be USB.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index d3b4f6415920..059f6ef1ad4a 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,7 +74,7 @@ additionalProperties: false
 
 examples:
   - |
-    ehci@e0000300 {
+    usb@e0000300 {
         compatible = "ibm,usb-ehci-440epx", "generic-ehci";
         interrupt-parent = <&UIC0>;
         interrupts = <0x1a 4>;
@@ -89,7 +89,6 @@ examples:
         interrupts = <39>;
         clocks = <&ahb_gates 1>;
         phys = <&usbphy 1>;
-        phy-names = "usb";
     };
 
 ...
-- 
2.21.0
