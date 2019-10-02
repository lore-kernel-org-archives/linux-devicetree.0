From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] dt-bindings: usb: Bring back phy-names
Date: Wed,  2 Oct 2019 13:26:51 +0200
Message-ID: <20191002112651.100504-2-mripard@kernel.org>
References: <20191002112651.100504-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191002112651.100504-1-mripard@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Emmanuel Vadot <manu@bidouilliste.com>, linux-usb@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

While the original bindings that were superseeded by the YAML schemas
didn't mention that phy-names was needed, it turns out that phy-names is
required if phys is set according to phy/phy-bindings.txt.

Let's add back those properties.

Fixes: 14ec072a19ad ("dt-bindings: usb: Convert USB HCD generic binding to YAML")
Fixes: c93bcace1098 ("dt-bindings: usb: Convert the generic OHCI binding to YAML")
Fixes: c3e2485d5f4f ("dt-bindings: usb: Convert the generic EHCI binding to YAML")
Reported-by: Emmanuel Vadot <manu@bidouilliste.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 ++++++-
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 7 ++++++-
 Documentation/devicetree/bindings/usb/usb-hcd.yaml      | 5 +++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 059f6ef1ad4a..1ca64c85191a 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -63,7 +63,11 @@ properties:
     description:
       Set this flag to force EHCI reset after resume.
 
-  phys: true
+  phys:
+    description: PHY specifier for the USB PHY
+
+  phy-names:
+    const: usb
 
 required:
   - compatible
@@ -89,6 +93,7 @@ examples:
         interrupts = <39>;
         clocks = <&ahb_gates 1>;
         phys = <&usbphy 1>;
+        phy-names = "usb";
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index da5a14becbe5..bcffec1f1341 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -67,7 +67,11 @@ properties:
     description:
       Overrides the detected port count
 
-  phys: true
+  phys:
+    description: PHY specifier for the USB PHY
+
+  phy-names:
+    const: usb
 
 required:
   - compatible
@@ -84,6 +88,7 @@ examples:
           interrupts = <64>;
           clocks = <&usb_clk 6>, <&ahb_gates 2>;
           phys = <&usbphy 1>;
+          phy-names = "usb";
       };
 
 ...
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 9c8c56d3a792..7263b7f2b510 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -18,8 +18,13 @@ properties:
     description:
       List of all the USB PHYs on this HCD
 
+  phy-names:
+    description:
+      Name specifier for the USB PHY
+
 examples:
   - |
     usb {
         phys = <&usb2_phy1>, <&usb3_phy1>;
+        phy-names = "usb";
     };
-- 
2.23.0
