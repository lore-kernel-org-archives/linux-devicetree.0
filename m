From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 03/16] video: Add DT binding documentation for VGA connector
Date: Wed, 27 Aug 2014 18:41:00 +0200
Message-ID: <1409157673-4154-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1409157673-4154-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1409157673-4154-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The VGA connector is described by a single input port and an optional
DDC bus.

Cc: devicetree@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/video/vga-connector.txt    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/vga-connector.txt

diff --git a/Documentation/devicetree/bindings/video/vga-connector.txt b/Documentation/devicetree/bindings/video/vga-connector.txt
new file mode 100644
index 0000000..9a45ec1
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/vga-connector.txt
@@ -0,0 +1,28 @@
+VGA Connector
+==============
+
+Required properties:
+- compatible: "vga-connector"
+
+Optional properties:
+- label: a symbolic name for the connector
+- ddc-i2c-bus: phandle to the I2C bus that is connected to VGA DDC
+
+Required nodes:
+- Video port for VGA input
+
+Example
+-------
+
+vga0: connector@0 {
+	compatible = "vga-connector";
+	label = "vga";
+
+	ddc-i2c-bus = <&i2c3>;
+
+	port {
+		vga_connector_in: endpoint {
+			remote-endpoint = <&adv7123_out>;
+		};
+	};
+};
-- 
1.8.5.5
