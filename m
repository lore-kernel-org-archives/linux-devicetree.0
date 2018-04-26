Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 1/6] dt-bindings: usb: add Renesas R-Car USB 3.0 role switch
Date: Thu, 26 Apr 2018 20:26:41 +0900
Message-Id: <1524742006-17984-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a new documentation for Renesas R-Car USB 3.0 role
switch that can change the USB 3.0 role to either host or peripheral
by a hardware register that is included in USB3.0 peripheral module.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../bindings/usb/renesas,rcar-usb3-role-sw.txt     | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
new file mode 100644
index 0000000..e074c03
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
@@ -0,0 +1,47 @@
+Renesas Electronics R-Car USB 3.0 role switch
+
+A renesas_usb3's node can contain this node.
+
+Required properties:
+ - compatible: Must contain "renesas,rcar-usb3-role-switch".
+
+Required nodes:
+ - The connection to a usb3.0 host node needs by using OF graph bindings.
+  - port@0 = USB 3.0 host port
+  - port@1 = USB 3.0 peripheral port
+
+Example of R-Car H3 ES2.0:
+	usb3_peri0: usb@ee020000 {
+		compatible = "renesas,r8a7795-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
+		reg = <0 0xee020000 0 0x400>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 328>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 328>;
+
+		usb3-role-sw {
+			compatible = "renesas,rcar-usb3-role-switch";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb3_host_sw: endpoint {
+						remote-endpoint = <&usb3_host_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb3_peri_sw: endpoint {
+						remote-endpoint = <&usb3_peri_ep>;
+					};
+				};
+			};
+		};
+	};
-- 
1.9.1
