From: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
Subject: [PATCH] Add device tree bindings for Altera FPGA Manager GPIO
Date: Sat, 7 Oct 2017 18:13:49 +0000
Message-ID: <AM5PR0701MB26572E57A1787CD9684B7FC1E4760@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Altera FPGA Manager GPIO.

Signed-off-by: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
---
 .../bindings/gpio/gpio-altera-fpgamgr.txt          | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
new file mode 100644
index 0000000..7e9434f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
@@ -0,0 +1,45 @@
+Altera FPGA Manager GPIO controller bindings
+
+Required controller properties:
+- #address-cells : Should be 1
+- #size-cells : Should be 0
+- compatible:
+  - "altr,fpgamgr-gpio"
+- reg: Physical base address and length of the controller's registers.
+- status : "okay" or "disabled".
+
+The FPGA Manager has two 32-bit ports, one for input and one for output.
+
+Port properties:
+- compatible:
+  - "altr,fpgamgr-gpio-output"
+  - "altr,fpgamgr-gpio-input"
+- #gpio-cells : Should be 2
+  - The first cell is the gpio offset number.
+  - The second cell is reserved and is currently unused.
+- gpio-controller : Marks the device node as a GPIO controller.
+- reg : Port number, 0 for output, 1 for input.
+
+Example:
+
+gpio3: gpio@ff706010 {
+  #address-cells = <1>;
+  #size-cells = <0>;
+  compatible = "altr,fpgamgr-gpio";
+  reg = <0xff706010 0x8>;
+  status = "okay";
+
+  portd: gpio-controller@0 {
+    compatible = "altr,fpgamgr-gpio-output";
+    gpio-controller;
+    #gpio-cells = <2>;
+    reg = <0>;
+  };
+
+  porte: gpio-controller@1 {
+    compatible = "altr,fpgamgr-gpio-input";
+    gpio-controller;
+    #gpio-cells = <2>;
+    reg = <1>;
+  };
+};
-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
