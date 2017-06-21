From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: Add Spreadtrum SC9860 pin controller
Date: Wed, 21 Jun 2017 19:55:38 +0800
Message-ID: <09b72098c8fcce703b0ae7f757130ab1b0700f50.1498045588.git.baolin.wang@spreadtrum.com>
References: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC9860 pin
controller device.

Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
---
Changes since v3:
 - Use generic "bias-pull-up" instead of "sprd,pull-up".
 - Change subject name.
 - Use generic sleep related config.
 - Add more explanation for sleep related configuration and sleep mode.

Changes since v2:
 - No updates.

Changes since v1:
 - Remove magic numbers and get to use the standard bindings.
 - Fix some typos.
---
 .../devicetree/bindings/pinctrl/sprd,pinctrl.txt   |   90 ++++++++++++++++++++
 .../bindings/pinctrl/sprd,sc9860-pinctrl.txt       |   69 +++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
new file mode 100644
index 0000000..e33fb46
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
@@ -0,0 +1,90 @@
+* Spreadtrum Pin Controller
+
+The Spreadtrum pin controller are organized in 3 blocks (types).
+
+The first block comprises some global control registers, and each
+register contains several bit fields with one bit or several bits
+to configure for some global common configuration, such as domain
+pad driving level, system control select and so on ("domain pad
+driving level": One pin can output 3.0v or 1.8v, depending on the
+related domain pad driving selection, if the related domain pad
+slect 3.0v, then the pin can output 3.0v. "system control" is used
+to choose one function (like: UART0) for which system, since we
+have several systems (AP/CP/CM4) on one SoC.).
+
+There are too much various configuration that we can not list all
+of them, so we can not make every Spreadtrum-special configuration
+as one generic configuration, and maybe it will add more strange
+global configuration in future. Then we add one "sprd,control" to
+set these various global control configuration, and we need use
+magic number for this property.
+
+Moreover we recognise every fields comprising one bit or several
+bits in one global control register as one pin, thus we should
+record every pin's bit offset, bit width and register offset to
+configure this field (pin).
+
+The second block comprises some common registers which have unified
+register definition, and each register described one pin is used
+to configure the pin sleep mode, function select and sleep related
+configuration.
+
+Now we have 4 systems for sleep mode on SC9860 SoC: AP system,
+PUBCP system, TGLDSP system and AGDSP system. And the pin sleep
+related configuration are:
+- sleep-input-enable
+- sleep-input-disable
+- sleep-output-high
+- sleep-output-low
+- sleep-bias-pull-up
+- sleep-bias-pull-down
+
+In some situation we need set the pin sleep mode and pin sleep related
+configuration, to set the pin sleep related configuration automatically
+by hardware when the system specified by sleep mode goes into deep
+sleep mode. For example, if we set the pin sleep mode as PUBCP_SLEEP
+and set the pin sleep related configuration as "sleep-input-enable",
+which means when PUBCP system goes into deep sleep mode, this pin will
+be set input enable automatically.
+
+Moreover we can not use the "sleep" state, since some systems (like:
+PUBCP system) do not run linux kernel OS (only AP system run linux
+kernel on SC9860 platform), then we can not select "sleep" state
+when the PUBCP system goes into deep sleep mode. Thus we introduce
+"sprd,sleep-mode" property to set pin sleep mode.
+
+The last block comprises some misc registers which also have unified
+register definition, and each register described one pin is used to
+configure drive strength, pull up/down and so on. Especially for pull
+up, we have two kind pull up resistor: 20K and 4.7K.
+
+Required properties for Spreadtrum pin controller:
+- compatible: "sprd,<soc>-pinctrl"
+  Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported SoCs.
+- reg: The register address of pin controller device.
+- pins : An array of pin names.
+
+Optional properties:
+- function: Specified the function name.
+- drive-strength: Drive strength in mA.
+- input-schmitt-disable: Enable schmitt-trigger mode.
+- input-schmitt-enable: Disable schmitt-trigger mode.
+- bias-disable: Disable pin bias.
+- bias-pull-down: Pull down on pin.
+- bias-pull-up: Pull up on pin.
+- sleep-input-enable: Input enable when the system specified by sleep
+		      mode goes into deep sleep mode.
+- sleep-input-disable: Input disable when the system specified by sleep
+		       mode goes into deep sleep mode.
+- sleep-output-high: Output high enable when the system specified by
+		     sleep mode goes into deep sleep mode.
+- sleep-output-low: Output low enable when the system specified by sleep
+		    mode goes into deep sleep mode.
+- sleep-bias-pull-up: Pull up enable when the system specified by sleep
+		      mode goes into deep sleep mode.
+- sleep-bias-pull-down: Pull down enable when the system specified by
+			sleep mode goes into deep sleep mode.
+- sprd,control: Control values referring to databook for global control pins.
+- sprd,sleep-mode: Sleep mode selection.
+
+Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported values.
diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
new file mode 100644
index 0000000..067b7e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
@@ -0,0 +1,69 @@
+* Spreadtrum SC9860 Pin Controller
+
+Please refer to sprd,pinctrl.txt in this directory for common binding part
+and usage.
+
+Required properties:
+- compatible: Must be "sprd,sc9860-pinctrl".
+- reg: The register address of pin controller device.
+- pins : An array of strings, each string containing the name of a pin.
+
+Optional properties:
+- function: A string containing the name of the function, values must be
+  one of: "func1", "func2", "func3" and "func4".
+- drive-strength: Drive strength in mA. Supported values: 2, 4, 6, 8, 10,
+  12, 14, 16, 20, 21, 24, 25, 27, 29, 31 and 33.
+- input-schmitt-disable: Enable schmitt-trigger mode.
+- input-schmitt-enable: Disable schmitt-trigger mode.
+- bias-disable: Disable pin bias.
+- bias-pull-down: Pull down on pin.
+- bias-pull-up: Pull up on pin. Supported values: 20000 for pull-up resistor
+  is 20K and 4700 for pull-up resistor is 4.7K.
+- sleep-input-enable: Input enable when the system specified by sleep mode
+  goes into deep sleep mode.
+- sleep-input-disable: Input disable when the system specified by sleep mode
+  goes into deep sleep mode.
+- sleep-output-high: Output high enable when the system specified by sleep
+  mode goes into deep sleep mode.
+- sleep-output-low: Output low enable when the system specified by sleep mode
+  goes into deep sleep mode.
+- sleep-bias-pull-up: Pull up enable when the system specified by sleep mode
+  goes into deep sleep mode.
+- sleep-bias-pull-down: Pull down enable when the system specified by sleep
+  mode goes into deep sleep mode.
+- sprd,control: Control values referring to databook for global control pins.
+- sprd,sleep-mode: Choose the pin sleep mode, and supported values are:
+  AP_SLEEP, PUBCP_SLEEP, TGLDSP_SLEEP and AGDSP_SLEEP.
+
+Pin sleep mode definition:
+enum pin_sleep_mode {
+	AP_SLEEP = BIT(0),
+	PUBCP_SLEEP = BIT(1),
+	TGLDSP_SLEEP = BIT(2),
+	AGDSP_SLEEP = BIT(3),
+};
+
+Example:
+pin_controller: pinctrl@402a0000 {
+	compatible = "sprd,sc9860-pinctrl";
+	reg = <0x402a0000 0x10000>;
+
+	grp1: sd0 {
+		pins = "SC9860_VIO_SD2_IRTE", "SC9860_VIO_SD0_IRTE";
+		sprd,control = <0x1>;
+	};
+
+	grp2: rfctl_33 {
+		pins = "SC9860_RFCTL33";
+		function = "func2";
+		sprd,sleep-mode = <AP_SLEEP | PUBCP_SLEEP>;
+		sleep-output-low;
+	};
+
+	grp3: rfctl_misc_20 {
+		pins = "SC9860_RFCTL20_MISC";
+		drive-strength = <10>;
+		bias-pull-up = <4700>;
+		sleep-bias-pull-up;
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
