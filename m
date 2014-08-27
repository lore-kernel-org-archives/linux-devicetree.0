From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 04/16] video: Add ADV7123 DT bindings documentation
Date: Wed, 27 Aug 2014 18:41:01 +0200
Message-ID: <1409157673-4154-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
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

The ADV7123 is a video DAC described by an input port, an output port,
and an optional power save GPIO.

Cc: devicetree@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/video/adi,adv7123.txt      | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/adi,adv7123.txt

diff --git a/Documentation/devicetree/bindings/video/adi,adv7123.txt b/Documentation/devicetree/bindings/video/adi,adv7123.txt
new file mode 100644
index 0000000..a6b2b2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/adi,adv7123.txt
@@ -0,0 +1,50 @@
+Analog Device ADV7123 Video DAC
+-------------------------------
+
+The ADV7123 is a digital-to-analog converter that outputs VGA signals from a
+parallel video input.
+
+Required properties:
+
+- compatible: Should be "adi,adv7123"
+
+Optional properties:
+
+- psave-gpios: Power save control GPIO
+
+Required nodes:
+
+The ADV7123 has two video ports. Their connections are modeled using the OF
+graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 for DPI input
+- Video port 1 for VGA output
+
+
+Example
+-------
+
+	adv7123: encoder@0 {
+		compatible = "adi,adv7123";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7123_in: endpoint@0 {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7123_out: endpoint@0 {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
-- 
1.8.5.5
