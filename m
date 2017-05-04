From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 6/8] dt-bindings: mfd: Add TI tps6105x chip bindings
Date: Thu,  4 May 2017 01:21:05 -0400
Message-ID: <20170504052107.18995-7-javier@dowhile0.org>
References: <20170504052107.18995-1-javier@dowhile0.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504052107.18995-1-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are Device Tree source files defining a device node for the
tps61050/61052 I2C chip but there isn't a binding document for it.

Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>

---

Changes in v6: None
Changes in v5:
- Add Rob Herring's Acked-by tag.
- Add Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>'s Acked-by tag.

Changes in v4:
- Use "dt-bindings: mfd:" prefix in subject line (Rob Herring).
- Add information about what functions the device serve (Lee Jones).

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mfd/tps6105x.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt

diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
new file mode 100644
index 000000000000..93602c7a19c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
@@ -0,0 +1,17 @@
+* Device tree bindings for TI TPS61050/61052 Boost Converters
+
+The TP61050/TPS61052 is a high-power "white LED driver". The
+device provides LED, GPIO and regulator functionalities.
+
+Required properties:
+- compatible:		"ti,tps61050" or "ti,tps61052"
+- reg:			Specifies the I2C slave address
+
+Example:
+
+i2c0 {
+	tps61052@33 {
+		compatible = "ti,tps61052";
+		reg = <0x33>;
+	};
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
