From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/2] drm: bridge: add sil902x DT bindings doc
Date: Wed,  6 Jan 2016 12:25:51 +0100
Message-ID: <1452079551-30914-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Add Sil9022 DT bindings description.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/display/bridge/sil902x.txt | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil902x.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/sil902x.txt b/Documentation/devicetree/bindings/display/bridge/sil902x.txt
new file mode 100644
index 0000000..7f1339f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil902x.txt
@@ -0,0 +1,31 @@
+sil902x HDMI bridge bindings
+
+Required properties:
+	- compatible: "sil,sil9022"
+	- reg: i2c address of the bridge
+	- reset-gpios: OF device-tree gpio specification for RST_N pin.
+
+Optional properties:
+	- interrupts-extended or interrupt-parent + interrupts: describe
+	  the interrupt line used to inform the host about hotplug events.
+
+Optional subnodes:
+	- video input: Device node can contain video input port node to
+	  connect the bridge to a display controller output (See this
+	  documentation [1]).
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+	hdmi-bridge@39 {
+		compatible = "sil,sil9022";
+		reg = <0x39>;
+		reset-gpios = <&gpx1 5 1 0 0>;
+		ports {
+			port@0 {
+				bridge_in: endpoint {
+					remote-endpoint = <&dc_out>;
+				};
+			};
+		};
+	};
-- 
2.1.4
