From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 3/5] overlay: a.dts, example of an old style dts file to be converted
Date: Tue, 27 Dec 2016 23:20:15 -0800
Message-ID: <1482909617-31950-4-git-send-email-frowand.list@gmail.com>
References: <1482909617-31950-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482909617-31950-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Requires a dtc that supports the new syntactic sugar.
One such version is commit: 6f4db2fc2354 DTBO magic and dtbo format options
in url = https://github.com/pantoniou/dtc

$ export PATH="$PATH:/path/dtc/"
$ ./overlay_convert_old_to_new a.dts b.dts


Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 a.dts | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 a.dts

diff --git a/a.dts b/a.dts
new file mode 100644
index 000000000000..ec21206a081f
--- /dev/null
+++ b/a.dts
@@ -0,0 +1,37 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target = <&am3353x_pinmux>;
+
+		__overlay__ {
+
+			i2c1_pins: pinmux_i2c1_pins {
+				pinctrl-single,pins = <
+					0x158 0x72
+					0x15c 0x72
+				>;
+			};
+		};
+	};
+
+	fragment@1 {
+		target = <&i2c1>;
+
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pins>;
+			clock-frequency = <400000>;
+			status = "okay";
+
+			at24@50 {
+				compatible = "at,24c256";
+				pagesize = <64>;
+				reg = <0x50>;
+			};
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
