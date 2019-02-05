From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 2/2] dt-bindings: panel: td028ttec1: add backlight property
Date: Tue,  5 Feb 2019 07:38:13 +0100
Message-ID: <20190205063813.14873-3-andreas@kemnade.info>
References: <20190205063813.14873-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205063813.14873-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This adds an additional backlight property as described
in panel-common.txt

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
index ed34253d9fb1..898e06ecf4ef 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
@@ -6,6 +6,7 @@ Required properties:
 
 Optional properties:
 - label: a symbolic name for the panel
+- backlight: phandle of the backlight device
 
 Required nodes:
 - Video port for DPI input
@@ -21,6 +22,7 @@ lcd-panel: td028ttec1@0 {
 	spi-cpha;
 
 	label = "lcd";
+	backlight = <&backlight>;
 	port {
 		lcd_in: endpoint {
 			remote-endpoint = <&dpi_out>;
-- 
2.11.0
