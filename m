From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date: Fri,  5 Jul 2019 09:56:55 -0700
Message-ID: <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Cc: bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../display/panel/sharp,ld-d5116z01b.txt      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
new file mode 100644
index 000000000000..3938c2847fe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
@@ -0,0 +1,27 @@
+Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
+
+Required properties:
+- compatible: should be "sharp,ld-d5116z01b"
+- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
+
+This binding is compatible with the simple-panel binding.
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [1]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	panel: panel {
+		compatible = "sharp,ld-d5116z01b";
+		power-supply = <&vlcd_3v3>;
+		no-hpd
+
+		port {
+			panel_ep: endpoint {
+				remote-endpoint = <&bridge_out_ep>;
+			};
+		};
+	};
-- 
2.17.1
