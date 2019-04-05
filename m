Return-Path: <SRS0=5T1w=SH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 10/13] media: dt-bindings: tvp5150: cleanup bindings stlye
Date: Fri,  5 Apr 2019 08:03:14 +0200
Message-Id: <20190405060317.11240-11-m.felsch@pengutronix.de>
In-Reply-To: <20190405060317.11240-1-m.felsch@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Use underlines to highlight optional and required properties. This is
quite common for all bindings. Align descriptions and start sentence
with uppercase letter. Also reword the usage of the required
endpoint properties for the output port in case BT.656 should be used.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/media/i2c/tvp5150.txt | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index bdd273d8b44d..82fff80fa63a 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -5,12 +5,14 @@ The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
 with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
 
 Required Properties:
-- compatible: value must be "ti,tvp5150"
-- reg: I2C slave address
+====================
+- compatible:	Value must be "ti,tvp5150".
+- reg:		I2C slave address.
 
 Optional Properties:
-- pdn-gpios: phandle for the GPIO connected to the PDN pin, if any.
-- reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
+====================
+- pdn-gpios:	Phandle for the GPIO connected to the PDN pin, if any.
+- reset-gpios:	Phandle for the GPIO connected to the RESETB pin, if any.
 
 The device node must contain one 'port' child node per device physical input
 and output port, in accordance with the video interface bindings defined in
@@ -24,9 +26,8 @@ are numbered as follows
 	  Y-OUT		src		2
 
 The device node must contain at least one sink port and the src port. Each input
-port must be linked to an endpoint defined in
-Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt. The
-port/connector layout is as follows
+port must be linked to an endpoint defined in [1]. The port/connector layout is
+as follows
 
 tvp-5150 port@0 (AIP1A)
 	endpoint@0 -----------> Comp0-Con  port
@@ -37,14 +38,17 @@ tvp-5150 port@2
 	endpoint (video bitstream output at YOUT[0-7] parallel bus)
 
 Required Endpoint Properties for parallel synchronization on output port:
+=========================================================================
 
-- hsync-active: active state of the HSYNC signal. Must be <1> (HIGH).
-- vsync-active: active state of the VSYNC signal. Must be <1> (HIGH).
-- field-even-active: field signal level during the even field data
-  transmission. Must be <0>.
+- hsync-active:		Active state of the HSYNC signal. Must be <1> (HIGH).
+- vsync-active:		Active state of the VSYNC signal. Must be <1> (HIGH).
+- field-even-active:	Field signal level during the even field data
+			transmission. Must be <0>.
 
-If none of hsync-active, vsync-active and field-even-active is specified,
-the endpoint is assumed to use embedded BT.656 synchronization.
+Note: Do not specify any of these properties if you want to use the embedded
+      BT.656 synchronization.
+
+[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
 
 Example - three input sources:
 
-- 
2.20.1
