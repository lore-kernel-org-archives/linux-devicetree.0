Return-Path: <SRS0=17fZ=JE=st.com=hugues.fruchet@kernel.org>
From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v2 2/3] dt-bindings: ov5640: Add "rotation" property
Date: Mon, 18 Jun 2018 12:29:18 +0200
Message-ID: <1529317759-28657-3-git-send-email-hugues.fruchet@st.com>
In-Reply-To: <1529317759-28657-1-git-send-email-hugues.fruchet@st.com>
References: <1529317759-28657-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>, "Mauro Carvalho Chehab  <mchehab@kernel.org>, Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, "Hugues Fruchet  <hugues.fruchet@st.com>, Benjamin Gaignard" <benjamin.gaignard@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Add the rotation property to the list of optional properties
for the OV5640 camera sensor.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
index 8e36da0..c97c2f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
@@ -13,6 +13,10 @@ Optional Properties:
 	       This is an active low signal to the OV5640.
 - powerdown-gpios: reference to the GPIO connected to the powerdown pin,
 		   if any. This is an active high signal to the OV5640.
+- rotation: as defined in
+	    Documentation/devicetree/bindings/media/video-interfaces.txt,
+	    valid values are 0 (sensor mounted upright) and 180 (sensor
+	    mounted upside down).
 
 The device node must contain one 'port' child node for its digital output
 video port, in accordance with the video interface bindings defined in
@@ -51,6 +55,7 @@ Examples:
 		DVDD-supply = <&vgen2_reg>;  /* 1.5v */
 		powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
 
 		port {
 			/* MIPI CSI-2 bus endpoint */
-- 
1.9.1
