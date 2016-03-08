From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 5/5] regulator: pwm: Add DT binding details for Linear Equal Step Mode
Date: Tue, 8 Mar 2016 16:23:25 +0530
Message-ID: <1457434405-30372-6-git-send-email-ldewangan@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com
Cc: lgirdwood@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add support for Linear Equal Step mode  in pwm regulators on which
specified regulator's minimum and maximum voltages are divided into
specified equal steps. The number of steps must divided the range of
minimum to maximum as well as PWM periods in equal parts.

Add DT property to specify number of steps and its details.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 .../bindings/regulator/pwm-regulator.txt           | 32 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index ed936f0..b61ff59 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -1,7 +1,7 @@
 Bindings for the Generic PWM Regulator
 ======================================
 
-Currently supports 2 modes of operation:
+Currently supports following modes of operation:
 
 Voltage Table:		When in this mode, a voltage table (See below) of
 			predefined voltage <=> duty-cycle values must be
@@ -23,20 +23,34 @@ Continuous Voltage:	This mode uses the regulator's maximum and minimum
 			regulator voltage to run at half way between the
 			supplied max_uV and min_uV values.
 
+Linear Equal Step:	This modes divides the regulator's maximum and minimum
+			supplied voltages into specified equal steps. The
+			number of steps must equally divides the PWM periods.
+			On this case, step is translated into number of pulse
+			in PWM periods and then multiplied by voltage
+			selectors number to get the duty cycles of PWM.
+
 Required properties:
 --------------------
 - compatible:		Should be "pwm-regulator"
 
 - pwms:			PWM specification (See: ../pwm/pwm.txt)
 
-Only required for Voltage Table Mode:
+Optional properties:
+--------------------
+For Voltage Table Mode, following properties must be supplied:
 - voltage-table: 	Voltage and Duty-Cycle table consisting of 2 cells
 			    First cell is voltage in microvolts (uV)
 			    Second cell is duty-cycle in percent (%)
 
+For Linear Equal Steps, following properties must be supplied:
+- regulator-n-voltages:	Number of voltage steps between regulator's minimum
+			and maximum.
+
 NB: To be clear, if voltage-table is provided, then the device will be used
-in Voltage Table Mode.  If no voltage-table is provided, then the device will
-be used in Continuous Voltage Mode.
+in Voltage Table Mode.  If regulator-n-voltages is provided then the device
+will be used in Linear Equal Step Mode. If both properties are not provided,
+then the device will be used in Continuous Voltage Mode.
 
 Any property defined as part of the core regulator binding can also be used.
 (See: ../regulator/regulator.txt)
@@ -66,3 +80,13 @@ Voltage Table Example:
 				<1036000 40>,
 				<1016000 50>;
 	};
+
+Linear Equal Step Mode Example:
+	pwm-regulator@1 {
+		compatible = "pwm-regulator";
+		pwms = <&pwm 1 4880>;
+		regulator-name = "vdd-gpu";
+		regulator-min-microvolt = <710000>;
+		regulator-max-microvolt = <1320000>;
+		regulator-n-voltages = <62>;
+	};
-- 
2.1.4
