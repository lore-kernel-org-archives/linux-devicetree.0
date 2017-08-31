From: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v1 1/3] dt-bindings: nvmem: add description for UniPhier eFuse
Date: Fri,  1 Sep 2017 08:20:18 +0900
Message-ID: <1504221620-358-2-git-send-email-hayashibara.keiji@socionext.com>
References: <1504221620-358-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504221620-358-1-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add uniphier-efuse dt-bindings documentation.

Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 .../devicetree/bindings/nvmem/uniphier-efuse.txt   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt b/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
new file mode 100644
index 0000000..09024a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
@@ -0,0 +1,45 @@
+= UniPhier eFuse device tree bindings =
+
+This UniPhier eFuse must be under soc-glue.
+
+Required properties:
+- compatible: should be "socionext,uniphier-efuse"
+- reg: should contain the register base and length
+
+= Data cells =
+Are child nodes of efuse, bindings of which as described in
+bindings/nvmem/nvmem.txt
+
+Example:
+
+	soc-glue@5f900000 {
+		compatible = "socionext,uniphier-ld20-soc-glue-debug",
+			     "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x5f900000 0x2000>;
+
+		efuse {
+			compatible = "socionext,uniphier-efuse",
+				     "syscon";
+			reg = <0x100 0xf00>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			/* Data cells */
+			usb_mon: usb_mon {
+				reg = <0x154 0xc>;
+			};
+		};
+	};
+
+= Data consumers =
+Are device nodes which consume nvmem data cells.
+
+Example:
+
+	usb {
+		...
+		nvmem-cells = <&usb_mon>;
+		nvmem-cell-names = "usb_mon";
+	}
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
