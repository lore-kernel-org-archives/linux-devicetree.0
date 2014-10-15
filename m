From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v6 1/4] hwmon: ltc2978: device tree bindings documentation
Date: Wed, 15 Oct 2014 13:55:07 -0500
Message-ID: <1413399310-19277-2-git-send-email-atull@opensource.altera.com>
References: <1413399310-19277-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413399310-19277-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org
Cc: lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Add device tree bindings documentation for ltc2978.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2: clean whitespace

v3: list compatible strings in single column
    add vendor as lltc
    mention regulators.txt instead of documenting regulator-name
    s/vout_en/vout/
    remove size_cells, address-cells
    use node name to identify regulators
---
 .../devicetree/bindings/hwmon/ltc2978.txt          |   39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2978.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltc2978.txt b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
new file mode 100644
index 0000000..16c1227
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
@@ -0,0 +1,39 @@
+ltc2978
+
+Required properties:
+- compatible: should contain one of:
+  * "lltc,ltc2974"
+  * "lltc,ltc2977"
+  * "lltc,ltc2978"
+  * "lltc,ltc3880"
+  * "lltc,ltc3883"
+  * "lltc,ltm4676"
+- reg: I2C slave address
+
+Optional properties:
+- regulators: A node that houses a sub-node for each regulator controlled by
+  the device. Each sub-node is identified using the node's name, with valid
+  values listed below. The content of each sub-node is defined by the
+  standard binding for regulators; see regulator.txt.
+
+Valid names of regulators depend on number of supplies supported per device:
+  * ltc2974 : vout0 - vout3
+  * ltc2977 : vout0 - vout7
+  * ltc2978 : vout0 - vout7
+  * ltc3880 : vout0 - vout1
+  * ltc3883 : vout0
+  * ltm4676 : vout0 - vout1
+
+Example:
+ltc2978@5e {
+	compatible = "ltc2978";
+	reg = <0x5e>;
+	regulators {
+		vout0 {
+			regulator-name = "FPGA-2.5V";
+		};
+		vout2 {
+			regulator-name = "FPGA-1.5V";
+		};
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
