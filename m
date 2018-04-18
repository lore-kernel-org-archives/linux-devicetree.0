Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 03/11] dt-bindings: usb: add Renesas R-Car USB 3.0 role switch driver
Date: Wed, 18 Apr 2018 17:09:57 +0900
Message-Id: <1524039005-30618-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a new documentation for Renesas R-Car USB 3.0 role
switch driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../bindings/usb/renesas,rcar-usb3-role-sw.txt     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
new file mode 100644
index 0000000..ed60f66
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
@@ -0,0 +1,56 @@
+Renesas Electronics R-Car USB 3.0 role switch driver
+
+A renesas_usb3's node can contain this node.
+
+Required properties:
+ - compatible: Must contain "renesas,rcar-usb3-role-switch".
+
+Required nodes:
+
+The connection to a USB connector node and USB role switch node need by
+using OF graph bindings. Please refer to the usb-role-switch.txt about
+port number of the OF graph. Note that port@3 is connected to
+the usb-connector.
+
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
+				port@1 {
+					reg = <1>;
+
+					usb3_host_sw0: endpoint {
+						remote-endpoint = <&usb3_host_ep0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usb3_peri_sw0: endpoint {
+						remote-endpoint = <&usb3_peri_ep0>;
+						device-connection-id = "usb-role-switch";
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					usb3_role_sw0_ep: endpoint {
+					};
+				};
+			};
+		};
+	};
-- 
1.9.1
