From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 3/4] charger-manager: Add device tree binding for
 charger-manager
Date: Tue, 22 Oct 2013 21:51:56 +0900
Message-ID: <1382446317-32613-4-git-send-email-cw00.choi@samsung.com>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: anton@enomsg.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com
List-Id: devicetree@vger.kernel.org

This patch add binding file for charger-manager that this framework enables to
control and multiple chargers and to monitor charging event.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
---
 .../devicetree/bindings/power/charger-manager.txt  | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/charger-manager.txt

diff --git a/Documentation/devicetree/bindings/power/charger-manager.txt b/Documentation/devicetree/bindings/power/charger-manager.txt
new file mode 100644
index 0000000..b22c5526
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/charger-manager.txt
@@ -0,0 +1,106 @@
+Charger-manager framework
+
+THe devicetree bindings are for the charger-manager to control charging feature.
+
+This framework enables to control and multiple chargers and to monitor charging
+event in the context of suspend-to-RAM with an interface combining the chargers.
+
+Required Properties:
+- compatible:		Must be "charger-manager".
+- psy-name:		The name of power-supply class for charger-manager.
+- polling-mode:		Determine which polling mode will be used.
+- polling-invertal-ms:	Interval in millisecond at which charger-manager will
+			monitor battery health.
+- fullbatt-vchkdrop-ms
+- fullbatt-vchkdrop-uV:	Check voltage drop afer the battery is fully charged.
+			If it has dropped more than fullbatt_vchkdrop_uV after
+			fullbatt_vchkdrop_ms, charger-manager will restart
+			charging.
+- fullbatt-uV:		The standard voltage in microvolt for checking
+			fully charged. If VBATT >= fullbatt_uV, it is assumed to
+			be full.
+- fullbatt-soc:		The standard SOC(State Of Charger) for checking
+			fully charged. If state of Charge >= fullbatt_soc, it is
+			assumed to be full.
+- fullbatt-full-capacity: The standard capacity for checking fully charged.
+			If full capacity of battery >= fullbatt_full_capacity,
+			it is assumed to be full.
+- battery-present:	Specify where information for existance of battery
+			can be obtained.
+- measure-battery-temp:	Whether to measure battery or not
+
+- charging-max-duration-minute:		Maximum possible duration for charging.
+			If whole charging duration exceed 'charging-max-duration
+			-ms', charger-manager stop charging.
+- discharging-max-duration-minute:	Maximum possible duration for
+			discharging with charger cable after full-batt. If
+			discharging duration exceed 'discharging-max-duration-
+			ms', charger-manager start charging.
+- psy-fuelgauge-name:	The name of power-supply for fuel gauge
+- io-channels:		The iio channel data for ADC
+- iio-adc-overheat:	The value of the highest ADC for temperature
+- iio-adc-cold:		The value of the lowest ADC for temperature
+- psy-chargers:		Arrary of power-supply name for chargers.
+- charger-regulators:	Array of charger regulators. It include charger cable
+			data which need cable-name/extcon-name/min-current-uA
+			max-current-uA. When cable is attached/detached,
+			charger-manager change current limit of regulator
+			according to min-current-uA/max-current-uA.
+
+Examples: adding charger-desc data in dts file
+
+charger-manager@ {
+	compatible = "charger-manager";
+
+	psy-name = "battery";
+
+	polling-mode = <2>;		/* Polling external power */
+	polling-interval-ms = <30000>;	/* Polling period */
+
+	fullbatt-vchkdrop-ms = <30000>;
+	fullbatt-vchkdrop-uV = <150000>;
+	fullbatt-uV = <420000>;
+	fullbatt-soc = <100>;
+	fullbatt-full-capacity = <0>;
+
+	battery-present = <3>;		/* CM_CHARGER_STAT */
+
+	measure-battery-temp;
+
+	charging-max-duration-minute = <360>;
+	discharging-max-duration-minute = <90>;
+
+	psy-fuelgauge-name = "max17040";
+
+	io-channels = <&adc 2>;
+	iio-adc-overheat = <2500>;
+	iio-adc-cold = <0>;
+
+	psy-chargers {
+		psy-charger-max14577 {
+			psy-charger-name = "max14577-charger";
+		};
+	};
+
+	charger-regulators {
+		charger-vinchg1 {
+			regulator-name = "vinchg1";
+
+			charger-cables {
+				cable-USB {
+					cable-name = "USB";
+					extcon-name = "max14577-muic";
+					min-current-uA = <475000>;
+					max-current-uA = <500000>;
+				};
+
+				cable-TA {
+					cable-name = "TA";
+					extcon-name = "max14577-muic";
+					min-current-uA = <650000>;
+					max-current-uA = <675000>;
+				};
+			};
+		};
+	};
+};
-- 
1.8.0
