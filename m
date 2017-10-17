From: Keiji Hayashibara <hayashibara.keiji@socionext.com>
Subject: [PATCH v4 1/3] dt-bindings: nvmem: add description for UniPhier eFuse
Date: Tue, 17 Oct 2017 14:20:29 +0900
Message-ID: <1508217631-19365-2-git-send-email-hayashibara.keiji@socionext.com>
References: <1508217631-19365-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508217631-19365-1-git-send-email-hayashibara.keiji@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, yamada.masahiro@socionext.com, hayashi.kunihiko@socionext.com, owada.kiyoshi@socionext.com, Keiji Hayashibara <hayashibara.keiji@socionext.com>
List-Id: devicetree@vger.kernel.org

Add uniphier-efuse dt-bindings documentation.

Signed-off-by: Keiji Hayashibara <hayashibara.keiji@socionext.com>
---
 .../devicetree/bindings/nvmem/uniphier-efuse.txt   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt b/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
new file mode 100644
index 0000000..eccf490
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
@@ -0,0 +1,49 @@
+= UniPhier eFuse device tree bindings =
+
+This UniPhier eFuse must be under soc-glue.
+
+Required properties:
+- compatible: should be "socionext,uniphier-efuse"
+- reg: should contain the register location and length
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
+		efuse@100 {
+			compatible = "socionext,uniphier-efuse";
+			reg = <0x100 0x28>;
+		};
+
+		efuse@200 {
+			compatible = "socionext,uniphier-efuse";
+			reg = <0x200 0x68>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			/* Data cells */
+			usb_mon: usb-mon@54 {
+				reg = <0x54 0xc>;
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
