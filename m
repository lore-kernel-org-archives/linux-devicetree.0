From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] devicetree: Move NS2 LEDs binding into LEDs directory
Date: Thu,  7 Feb 2013 12:22:56 +0000
Message-ID: <1360239776-14889-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

leds-ns2.txt is a binding for LEDs, not GPIOs. Move the documentation in
with the rest of the LEDs bindings.

Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 .../devicetree/bindings/gpio/leds-ns2.txt          |   26 --------------------
 .../devicetree/bindings/leds/leds-ns2.txt          |   26 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/leds-ns2.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/gpio/leds-ns2.txt b/Documentation/devicetree/bindings/gpio/leds-ns2.txt
deleted file mode 100644
index aef3aca..0000000
--- a/Documentation/devicetree/bindings/gpio/leds-ns2.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Binding for dual-GPIO LED found on Network Space v2 (and parents).
-
-Required properties:
-- compatible: "lacie,ns2-leds".
-
-Each LED is represented as a sub-node of the ns2-leds device.
-
-Required sub-node properties:
-- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
-- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-ns2-leds {
-	compatible = "lacie,ns2-leds";
-
-	blue-sata {
-		label = "ns2:blue:sata";
-		slow-gpio = <&gpio0 29 0>;
-		cmd-gpio = <&gpio0 30 0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/leds-ns2.txt b/Documentation/devicetree/bindings/leds/leds-ns2.txt
new file mode 100644
index 0000000..aef3aca
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ns2.txt
@@ -0,0 +1,26 @@
+Binding for dual-GPIO LED found on Network Space v2 (and parents).
+
+Required properties:
+- compatible: "lacie,ns2-leds".
+
+Each LED is represented as a sub-node of the ns2-leds device.
+
+Required sub-node properties:
+- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
+- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
+
+Optional sub-node properties:
+- label: Name for this LED. If omitted, the label is taken from the node name.
+- linux,default-trigger: Trigger assigned to the LED.
+
+Example:
+
+ns2-leds {
+	compatible = "lacie,ns2-leds";
+
+	blue-sata {
+		label = "ns2:blue:sata";
+		slow-gpio = <&gpio0 29 0>;
+		cmd-gpio = <&gpio0 30 0>;
+	};
+};
-- 
1.7.10.4
