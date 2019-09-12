From: allen <allen.chen@ite.com.tw>
Subject: [PATCH v3 1/2] dt-bindings: Add binding for IT6505.
Date: Thu, 12 Sep 2019 11:32:28 +0800
Message-ID: <1568259199-5827-2-git-send-email-allen.chen@ite.com.tw>
References: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Allen Chen <allen.chen@ite.com.tw>, Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Icenowy Zheng <icenowy@aosc.io>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, moderated list:ARM/Mediatek SoC
List-Id: devicetree@vger.kernel.org

From: Allen Chen <allen.chen@ite.com.tw>

Add a DT binding documentation for IT6505.

Signed-off-by: Allen Chen <allen.chen@ite.com.tw>

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

---
cros-ec does not have an associated driver that uses the standard Linux USB-C driver class.
extcon is used to model the Type-C connector.(crbug.com/982932)
---
 .../bindings/display/bridge/ite,it6505.txt         | 28 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
new file mode 100644
index 0000000..72da0c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
@@ -0,0 +1,28 @@
+iTE it6505 DP bridge bindings
+
+Required properties:
+        - compatible: "ite,it6505"
+        - reg: i2c address of the bridge
+        - ovdd-supply: I/O voltage
+        - pwr18-supply: Core voltage
+        - interrupts: interrupt specifier of INT pin
+        - reset-gpios: gpio specifier of RESET pin
+	- hpd-gpios:
+		Hotplug detect GPIO.
+		Indicates which GPIO should be used for hotplug detection
+	- port@[x]: SoC specific port nodes with endpoint definitions as defined
+		in Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+
+Example:
+	dp-bridge@5c {
+                compatible = "ite,it6505";
+                interrupts = <152 IRQ_TYPE_EDGE_RISING 152 0>;
+                reg = <0x5c>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&it6505_pins>;
+                ovdd-supply = <&mt6358_vsim1_reg>;
+                pwr18-supply = <&it6505_pp18_reg>;
+                reset-gpios = <&pio 179 1>;
+                hpd-gpios = <&pio 9 0>;
+                extcon = <&usbc_extcon>;
+        };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c..fb3b643 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -461,6 +461,8 @@ patternProperties:
     description: Intersil
   "^issi,.*":
     description: Integrated Silicon Solutions Inc.
+  "^ite,.*":
+    description: ITE Tech. Inc.
   "^itead,.*":
     description: ITEAD Intelligent Systems Co.Ltd
   "^iwave,.*":
-- 
1.9.1
