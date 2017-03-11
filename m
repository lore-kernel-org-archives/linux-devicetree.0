From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv5 01/16] ov7670: document device tree bindings
Date: Sat, 11 Mar 2017 12:23:13 +0100
Message-ID: <20170311112328.11802-2-hverkuil@xs4all.nl>
References: <20170311112328.11802-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311112328.11802-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Add binding documentation and add that file to the MAINTAINERS entry.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 .../devicetree/bindings/media/i2c/ov7670.txt       | 43 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov7670.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov7670.txt b/Documentation/devicetree/bindings/media/i2c/ov7670.txt
new file mode 100644
index 000000000000..826b6563b009
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov7670.txt
@@ -0,0 +1,43 @@
+* Omnivision OV7670 CMOS sensor
+
+The Omnivision OV7670 sensor supports multiple resolutions output, such as
+CIF, SVGA, UXGA. It also can support the YUV422/420, RGB565/555 or raw RGB
+output formats.
+
+Required Properties:
+- compatible: should be "ovti,ov7670"
+- clocks: reference to the xclk input clock.
+- clock-names: should be "xclk".
+
+Optional Properties:
+- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
+  Active is low.
+- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
+  Active is high.
+
+The device node must contain one 'port' child node for its digital output
+video port, in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	i2c1: i2c@f0018000 {
+		ov7670: camera@21 {
+			compatible = "ovti,ov7670";
+			reg = <0x21>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_pck0_as_isi_mck &pinctrl_sensor_power &pinctrl_sensor_reset>;
+			reset-gpios = <&pioE 11 GPIO_ACTIVE_LOW>;
+			powerdown-gpios = <&pioE 13 GPIO_ACTIVE_HIGH>;
+			clocks = <&pck0>;
+			clock-names = "xclk";
+			assigned-clocks = <&pck0>;
+			assigned-clock-rates = <25000000>;
+
+			port {
+				ov7670_0: endpoint {
+					remote-endpoint = <&isi_0>;
+				};
+			};
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 83a42ef1d1a7..93500928ca4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9273,6 +9273,7 @@ L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov7670.c
+F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
 
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
