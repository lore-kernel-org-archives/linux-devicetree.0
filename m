From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH 1/2] DT: pinctrl: Add binding documentation for Spreadtrum pin controller
Date: Sat, 27 May 2017 13:56:18 +0800
Message-ID: <a1fa5b612de318213bab4404997d133ed118f5d2.1495863824.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC9860 pin
controller device.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
 .../devicetree/bindings/pinctrl/sprd,pinctrl.txt   |   31 ++++++++++++++++++++
 .../bindings/pinctrl/sprd,sc9860-pinctrl.txt       |   26 ++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
new file mode 100644
index 0000000..2edf176
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
@@ -0,0 +1,31 @@
+* Spreadtrum Pin Controller
+
+The Spreadtrum pin controller are organized in 3 blocks (types).
+
+The first block comprises some global control registers, and each
+register contains several feilds with one bit or several bits to
+configurate for some global common configuration, such as domain
+pad driving level, system control select and so on. We recognise
+every feild comprising one bit or several bits in one global control
+register as one pin, thus we should record every pin's bit offset,
+bit width and register offset to configurate this feild (pin).
+
+The second block comprises some common registers which have unified
+register definition, and each register described one pin is used
+to configurate pin sleep mode and function select.
+
+The last block comprises some misc registers which also have unified
+register definition, and each register described one pin is used to
+configurate drive strength, pull up/down and so on.
+
+This driver supports the generic pin multiplexing and configuration
+bindings. For details on each properties, you can refer to
+./pinctrl-bindings.txt.
+
+Required properties for Spreadtrum pin controller:
+- compatible: "sprd,<soc>-pinctrl"
+  Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported SoCs.
+
+Required properties for pin configuration node:
+- sprd,pins: each entry consists of 2 integers and represents the pin
+  id and config setting for one pin.
diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
new file mode 100644
index 0000000..26fba5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
@@ -0,0 +1,26 @@
+* Spreadtrum SC9860 Pin Controller
+
+Please refer to sprd,pinctrl.txt in this directory for common binding part
+and usage.
+
+Required properties:
+- compatible: must be "sprd,sc9860-pinctrl".
+- reg: the register address of pin controller device.
+- sprd,pins: two integers array, represents a group of pins id and config
+  setting. The format is sprd,pins = <PIN_ID CONFIG>, PIN_ID can be found
+  from pinctrl-sprd-sc9860.c file or spec file, CONFIG is the pad setting
+  value like pull-up for this pin.
+
+Example:
+pin_controller: pinctrl@402a0000 {
+	compatible = "sprd,sc9860-pinctrl";
+	reg = <0x402a0000 0x10000>;
+
+	vio_sd0_ms_0: sd0_ms0 {
+		sprd,pins = <8 0x1>;
+	};
+
+	vbc_iis0_0: iis0_c {
+		sprd,pins = <34 0xc>;
+	};
+};
-- 
1.7.9.5

