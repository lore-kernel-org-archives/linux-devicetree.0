Return-Path: <SRS0=pcha=WL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v7 11/13] media: dt-bindings: tvp5150: add optional tvnorms documentation
Date: Thu, 15 Aug 2019 13:57:45 +0200
Message-Id: <20190815115747.24018-12-m.felsch@pengutronix.de>
In-Reply-To: <20190815115747.24018-1-m.felsch@pengutronix.de>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Document the optional binding to limit the possible tv-norms on the
input connectors.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/tvp5150.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index cc98b38c7e73..93731638b509 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -49,6 +49,13 @@ Required Endpoint Properties for parallel synchronization on output port:
 Note: Do not specify any of these properties if you want to use the embedded
       BT.656 synchronization.
 
+Optional Connector Properties:
+==============================
+
+- tvnorms: Set the possible signals to which the hardware tries to lock instead
+	   of using the autodetection mechnism. Please look at [1] for more
+	   information.
+
 [1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
 
 Example - three input sources:
@@ -56,6 +63,7 @@ Example - three input sources:
 comp_connector_0 {
 	compatible = "composite-video-connector";
 	label = "Composite0";
+	tvnorms = <TVNORM_PAL_M>; /* limit to pal-m signals */
 
 	port {
 		composite0_to_tvp5150: endpoint {
@@ -67,6 +75,7 @@ comp_connector_0 {
 comp_connector_1 {
 	compatible = "composite-video-connector";
 	label = "Composite1";
+	tvnorms = <TVNORM_NTSC_M>; /* limit to ntsc-m signals */
 
 	port {
 		composite1_to_tvp5150: endpoint {
-- 
2.20.1
