From: Suresh Rajashekara <sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/2] iio:light:ap3223: Add DT support
Date: Tue, 29 Sep 2015 18:36:21 -0700
Message-ID: <1443576981-1210-2-git-send-email-sureshraj@google.com>
References: <1443576981-1210-1-git-send-email-sureshraj@google.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443576981-1210-1-git-send-email-sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Suresh Rajashekara <sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Add Device Tree support for the Dyna Image AP3223 ambient light sensor and
* proximity driver,
* Document the binding and
* Add a vendor prefix for Dyna Image

v3
* Fixing typo in comment
v2
* Seperating the device tree changes from code

Signed-off-by: Suresh Rajashekara <sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/light/ap3223.txt | 18 ++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt  |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ap3223.txt

diff --git a/Documentation/devicetree/bindings/iio/light/ap3223.txt b/Documentation/devicetree/bindings/iio/light/ap3223.txt
new file mode 100644
index 0000000..b255d27
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ap3223.txt
@@ -0,0 +1,18 @@
+* Dyna Image AP3223 ambient light sensor and proximity sensor
+
+http://www.dyna-image.com/english/product/optical-sensor-detail.php?cpid=2&dpid=8
+
+Required properties:
+
+  - compatible : should be "dynaimage,ap3223"
+  - reg : the I2C address of the sensor
+
+Example:
+
+ap3223@1c {
+	compatible = "dynaimage,ap3223";
+	reg = <0x1c>;
+
+	pinctrl-0 = <&ap3223_pins>;
+	pinctrl-names = "default";
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 5f20add..704da45 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -46,6 +46,7 @@ digilent	Diglent, Inc.
 dlg	Dialog Semiconductor
 dlink	D-Link Corporation
 dmo	Data Modul AG
+dynaimage	Dyna-Image
 ebv	EBV Elektronik
 edt	Emerging Display Technologies
 elan	Elan Microelectronic Corp.
-- 
2.6.0.rc2.230.g3dd15c0
