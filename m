From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv6 10/14] ov2640: update bindings
Date: Tue, 28 Mar 2017 10:23:43 +0200
Message-ID: <20170328082347.11159-11-hverkuil@xs4all.nl>
References: <20170328082347.11159-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170328082347.11159-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Update the bindings for this device based on a working DT example.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 .../devicetree/bindings/media/i2c/ov2640.txt       | 23 +++++++++-------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2640.txt b/Documentation/devicetree/bindings/media/i2c/ov2640.txt
index c429b5bdcaa0..989ce6cb6ac3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov2640.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov2640.txt
@@ -1,8 +1,8 @@
 * Omnivision OV2640 CMOS sensor
 
-The Omnivision OV2640 sensor support multiple resolutions output, such as
-CIF, SVGA, UXGA. It also can support YUV422/420, RGB565/555 or raw RGB
-output format.
+The Omnivision OV2640 sensor supports multiple resolutions output, such as
+CIF, SVGA, UXGA. It also can support the YUV422/420, RGB565/555 or raw RGB
+output formats.
 
 Required Properties:
 - compatible: should be "ovti,ov2640"
@@ -20,26 +20,21 @@ Documentation/devicetree/bindings/media/video-interfaces.txt.
 Example:
 
 	i2c1: i2c@f0018000 {
-		ov2640: camera@0x30 {
+		ov2640: camera@30 {
 			compatible = "ovti,ov2640";
 			reg = <0x30>;
-
 			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_pck1 &pinctrl_ov2640_pwdn &pinctrl_ov2640_resetb>;
-
-			resetb-gpios = <&pioE 24 GPIO_ACTIVE_LOW>;
-			pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
-
-			clocks = <&pck1>;
+			pinctrl-0 = <&pinctrl_pck0_as_isi_mck &pinctrl_sensor_power &pinctrl_sensor_reset>;
+			resetb-gpios = <&pioE 11 GPIO_ACTIVE_LOW>;
+			pwdn-gpios = <&pioE 13 GPIO_ACTIVE_HIGH>;
+			clocks = <&pck0>;
 			clock-names = "xvclk";
-
-			assigned-clocks = <&pck1>;
+			assigned-clocks = <&pck0>;
 			assigned-clock-rates = <25000000>;
 
 			port {
 				ov2640_0: endpoint {
 					remote-endpoint = <&isi_0>;
-					bus-width = <8>;
 				};
 			};
 		};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
