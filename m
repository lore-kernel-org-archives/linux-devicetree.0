From: Andrea Merello <andrea.merello@gmail.com>
Subject: [PATCH 2/2] drm: Add DT bindings documentation for OpenCores VGA/LCD controller
Date: Thu,  9 Jun 2016 15:33:19 +0200
Message-ID: <1465479199-9810-1-git-send-email-andrea.merello@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, airlied@linux.ie
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrea Merello <andrea.merello@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Francesco Diotalevi <francesco.diotalevi@iit.it>, Claudio Lorini <claudio.lorini@iit.it>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Francesco Diotalevi <francesco.diotalevi@iit.it>
Cc: Claudio Lorini <claudio.lorini@iit.it>
---
 .../bindings/display/opencores,ocdrm.txt           | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/opencores,ocdrm.txt

diff --git a/Documentation/devicetree/bindings/display/opencores,ocdrm.txt b/Documentation/devicetree/bindings/display/opencores,ocdrm.txt
new file mode 100644
index 0000000..8d36de5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/opencores,ocdrm.txt
@@ -0,0 +1,27 @@
+OpenCores VGA/LCD controller
+
+Required properties:
+- compatible: "opencores,ocdrm"
+- reg: Physical base address and length of the controller's registers.
+- clocks: Must contain an entry for the pixelclock generator.
+  See ../clocks/clock-bindings.txt for details.
+
+Required sub-nodes:
+- port: the connection to a DRM bridge.  The connection is modelled
+  using the OF graph bindings specified in
+  Documentation/devicetree/bindings/graph.txt.
+
+Example:
+
+ocdrm@43c10000 {
+	compatible = "opencores,ocfb-drm";
+	reg = <0x43c10000 0x10000>;
+	clocks = <&pix_clock>;
+	ports {
+		port@0 {
+			rgb_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
+};
-- 
1.9.1
