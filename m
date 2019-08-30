Return-Path: <SRS0=ECyj=W2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49759 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfH3KQ5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Aug 2019 06:16:57 -0400
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v10 12/14] media: dt-bindings: tvp5150: add optional sdtv standards documentation
Date: Fri, 30 Aug 2019 12:16:44 +0200
Message-Id: <20190830101646.6530-13-m.felsch@pengutronix.de>
In-Reply-To: <20190830101646.6530-1-m.felsch@pengutronix.de>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Document the optional binding to limit the possible sdtv standards on the
input connectors.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v8:
- adapt to new sdtv-standards
- adapt commit message
- fix missing include within example code

 .../devicetree/bindings/media/i2c/tvp5150.txt          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index cc98b38c7e73..f876b79c335f 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -49,13 +49,22 @@ Required Endpoint Properties for parallel synchronization on output port:
 Note: Do not specify any of these properties if you want to use the embedded
       BT.656 synchronization.
 
+Optional Connector Properties:
+==============================
+
+- sdtv-standards: Set the possible signals to which the hardware tries to lock
+                  instead of using the autodetection mechnism. Please look at
+                  [1] for more information.
+
 [1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
 
 Example - three input sources:
+#include <dt-bindings/display/sdtv-standards.h>
 
 comp_connector_0 {
 	compatible = "composite-video-connector";
 	label = "Composite0";
+	sdtv-standards = <TVNORM_PAL_M>; /* limit to pal-m signals */
 
 	port {
 		composite0_to_tvp5150: endpoint {
@@ -67,6 +76,7 @@ comp_connector_0 {
 comp_connector_1 {
 	compatible = "composite-video-connector";
 	label = "Composite1";
+	sdtv-standards = <TVNORM_NTSC_M>; /* limit to ntsc-m signals */
 
 	port {
 		composite1_to_tvp5150: endpoint {
-- 
2.20.1
