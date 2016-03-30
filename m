From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V10 3/6] pinctrl: add DT binding doc for pincontrol of PMIC max77620/max20024
Date: Wed, 30 Mar 2016 19:59:45 +0530
Message-ID: <1459348188-11726-4-git-send-email-ldewangan@nvidia.com>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Maxim Semiconductor's PMIC MAX77620/MAX20024 has 8 GPIO pins
which act as GPIO as well as special function mode.

Add DT binding document to configure pins in function mode as
well as pin configuration parameters.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>

---
Changes from V4:
- Separate out from pincontrol driver

Changes from V5:
- Starting patch title with pinctrl instead of DT:pinctrl

Changes from V6/V7:
- None

Changes on V8:
- Collected Ack from Linus.

Changes from V9:
None

 .../bindings/pinctrl/pinctrl-max77620.txt          | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
new file mode 100644
index 0000000..ad4fce3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
@@ -0,0 +1,127 @@
+Pincontrol driver for MAX77620 Power management IC from Maxim Semiconductor.
+
+Device has 8 GPIO pins which can be configured as GPIO as well as the
+special IO functions.
+
+Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
+for details of the common pinctrl bindings used by client devices,
+including the meaning of the phrase "pin configuration node".
+
+Optional Pinmux properties:
+--------------------------
+Following properties are required if default setting of pins are required
+at boot.
+- pinctrl-names: A pinctrl state named per <pinctrl-binding.txt>.
+- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
+		<pinctrl-binding.txt>.
+
+The pin configurations are defined as child of the pinctrl states node. Each
+sub-node have following properties:
+
+Required properties:
+------------------
+- pins: List of pins. Valid values of pins properties are:
+		      gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7.
+
+Optional properties:
+-------------------
+Following are optional properties defined as pinmux DT binding document
+<pinctrl-bindings.txt>. Absence of properties will leave the configuration
+on default.
+	function,
+	drive-push-pull,
+	drive-open-drain,
+	bias-pull-up,
+	bias-pull-down.
+
+Valid values for function properties are:
+	gpio, lpm-control-in, fps-out, 32k-out, sd0-dvs-in, sd1-dvs-in,
+	reference-out
+
+Theres is also customised properties for the GPIO1, GPIO2 and GPIO3. These
+customised properties are required to configure FPS configuration parameters
+of these GPIOs. Please refer <devicetree/bindings/mfd/max77620.txt> for more
+detail of Flexible Power Sequence (FPS).
+
+- maxim,active-fps-source:		FPS source for the GPIOs to get
+					enabled/disabled when system is in
+					active state.  Valid values are:
+					- MAX77620_FPS_SRC_0,
+						FPS source is FPS0.
+					- MAX77620_FPS_SRC_1,
+						FPS source is FPS1
+					- MAX77620_FPS_SRC_2 and
+						FPS source is FPS2
+					- MAX77620_FPS_SRC_NONE.
+						GPIO is not controlled
+						by FPS events and it gets
+						enabled/disabled by register
+						access.
+					Absence of this property will leave
+					the FPS configuration register for that
+					GPIO to default configuration.
+
+- maxim,active-fps-power-up-slot:	Sequencing event slot number on which
+					the GPIO get enabled when
+					master FPS input event set to HIGH.
+					Valid values are 0 to 7.
+					This is applicable if FPS source is
+					selected as FPS0, FPS1 or FPS2.
+
+- maxim,active-fps-power-down-slot:	Sequencing event slot number on which
+					the GPIO get disabled when master
+					FPS input event set to LOW.
+					Valid values are 0 to 7.
+					This is applicable if FPS source is
+					selected as FPS0, FPS1 or FPS2.
+
+- maxim,suspend-fps-source:		This is same as property
+					"maxim,active-fps-source" but value
+					get configured when system enters in
+					to suspend state.
+
+- maxim,suspend-fps-power-up-slot:	This is same as property
+					"maxim,active-fps-power-up-slot" but
+					this value get configured into FPS
+					configuration register when system
+					enters into suspend.
+					This is applicable if suspend state
+					FPS source is selected as FPS0, FPS1 or
+
+- maxim,suspend-fps-power-down-slot:	This is same as property
+					"maxim,active-fps-power-down-slot" but
+					this value get configured into FPS
+					configuration register when system
+					enters into suspend.
+					This is applicable if suspend state
+					FPS source is selected as FPS0, FPS1 or
+					FPS2.
+
+Example:
+--------
+#include <dt-bindings/mfd/max77620.h>
+...
+max77620@3c {
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spmic_default>;
+
+	spmic_default: pinmux@0 {
+		pin_gpio0 {
+			pins = "gpio0";
+			function = "gpio";
+		};
+
+		pin_gpio1 {
+			pins = "gpio1";
+			function = "fps-out";
+			maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+		};
+
+		pin_gpio2 {
+			pins = "gpio2";
+			function = "fps-out";
+			maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
+		};
+	};
+};
-- 
2.1.4
