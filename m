From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 05/16] video: Add THC63LVDM83D DT bindings documentation
Date: Wed, 27 Aug 2014 18:41:02 +0200
Message-ID: <1409157673-4154-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
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

The THC63LVDM83D is a video LVDS serializer described by an input port,
an output port, and an optional power down GPIO.

Cc: devicetree@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/video/thine,thc63lvdm83d   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/thine,thc63lvdm83d

diff --git a/Documentation/devicetree/bindings/video/thine,thc63lvdm83d b/Documentation/devicetree/bindings/video/thine,thc63lvdm83d
new file mode 100644
index 0000000..527e236
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/thine,thc63lvdm83d
@@ -0,0 +1,50 @@
+THine Electronics THC63LVDM83D LVDS serializer
+----------------------------------------------
+
+The THC63LVDM83D is an LVDS serializer designed to support pixel data
+transmission between a host and a flat panel.
+
+Required properties:
+
+- compatible: Should be "thine,thc63lvdm83d"
+
+Optional properties:
+
+- pwdn-gpios: Power down control GPIO
+
+Required nodes:
+
+The THC63LVDM83D has two video ports. Their connections are modeled using the
+OFgraph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 for CMOS/TTL input
+- Video port 1 for LVDS output
+
+
+Example
+-------
+
+	lvds_enc: encoder@0 {
+		compatible = "thine,thc63lvdm83d";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_enc_in: endpoint@0 {
+					remote-endpoint = <&rgb_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_enc_out: endpoint@0 {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
-- 
1.8.5.5
