From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] regulator: tps65132: add device-tree binding
Date: Wed, 12 Apr 2017 15:45:04 +0530
Message-ID: <1491992104-21921-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add tps65132 regulator device-tree binding documentation

Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes for v2:
 - change dts property names
 - add reg dts property
--- 
 .../bindings/regulator/tps65132-regulator.txt      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65132-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
new file mode 100644
index 0000000..3a35055
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
@@ -0,0 +1,46 @@
+TPS65132 regulators
+
+Required properties:
+- compatible: "ti,tps65132"
+- reg: I2C slave address
+
+Optional Subnode:
+Device supports two regulators OUTP and OUTN. A sub node within the
+   device node describe the properties of these regulators. The sub-node
+   names must be as follows:
+	-For regulator outp, the sub node name should be "outp".
+	-For regulator outn, the sub node name should be "outn".
+
+-enable-gpios:(active high, output) Regulators are controlled by the input pins.
+   If it is connected to GPIO through host system then provide the
+   gpio number as per gpio.txt.
+-active-discharge-gpios: (active high, output) Some configurations use delay mechanisms
+  on the enable pin, to keep the regulator enabled for some time after
+  the enable signal goes low. This GPIO is used to actively discharge
+  the delay mechanism. Requires specification of ti,active-discharge-time-us
+-ti,active-discharge-time-us: how long the active discharge gpio should be
+  asserted for during active discharge, in microseconds.
+
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	tps65132@3e {
+		compatible = "ti,tps65132";
+		reg = <0x3e>;
+
+		outp {
+			regulator-name = "outp";
+			regulator-boot-on;
+			regulator-always-on;
+			enable-gpios = <&gpio 23 0>;
+		};
+
+		outn {
+			regulator-name = "outn";
+			regulator-boot-on;
+			regulator-always-on;
+			regulator-active-discharge = <0>;
+			enable-gpios = <&gpio 40 0>;
+		};
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
