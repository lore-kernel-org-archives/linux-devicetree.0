From: Bernd Edlinger <bernd.edlinger@hotmail.de>
Subject: [PATCHv3 1/2] Add device tree bindings for Altera FPGA Manager GPIO
Date: Sun, 8 Oct 2017 11:30:27 +0000
Message-ID: <AM5PR0701MB2657FDDE2E0CE80D0EECB4B3E4770@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

These are the bindings for the gpio-altera-fpgamgr driver.

Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
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
