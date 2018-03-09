From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: Document LVDS to parallel decoder
Date: Fri,  9 Mar 2018 14:51:38 +0100
Message-ID: <1520603500-15218-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document transparent LVDS to CMOS/TTL decoder that do not require any
configuration.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/display/bridge/lvds-decoder.txt       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-decoder.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-decoder.txt b/Documentation/devicetree/bindings/display/bridge/lvds-decoder.txt
new file mode 100644
index 0000000..a9b1d9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-decoder.txt
@@ -0,0 +1,42 @@
+LVDS to Parallel CMOS/TTL decoder
+---------------------------------
+
+Bindings for transparent LVDS to CMOS/TTL parallel data decoder that don't
+require any configuration.
+
+Required properties:
+- compatible: shall be "lvds-decoder"
+
+The LVDS decoder has two video ports, whose connections are modeled according
+to OF graph bindings specified by Documentation/devicetree/bindings/graph.txt
+
+- Port@0: LVDS input port
+- Port@1: Digital CMOS/TTL parallel output
+
+Example:
+-------
+
+	lvds,decoder: decoder-0 {
+		compatible = "lvds-decoder";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_dec_in: endpoint {
+					remote-endpoint = <&lvds_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+
+				lvds_dec_out: endpoint {
+					remote-endpoint = <&adv7511_in>;
+				};
+			};
+		};
+	};
-- 
2.7.4
