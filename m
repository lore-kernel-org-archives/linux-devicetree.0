From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 6/6] dt-bindings: pwm-regulator: Document enable-gpio property
Date: Wed, 22 Jun 2016 17:25:58 +0900
Message-ID: <20160622082558.20935-7-acourbot@nvidia.com>
References: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622082558.20935-1-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add and document the enable-gpio property. Its behavior is similar to
the property of the same name found in GPIO regulator and fixed
regulator.

Cc: devicetree@vger.kernel.org
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index ed936f0f34f2..4f9dd27f52f5 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -38,13 +38,18 @@ NB: To be clear, if voltage-table is provided, then the device will be used
 in Voltage Table Mode.  If no voltage-table is provided, then the device will
 be used in Continuous Voltage Mode.
 
+Optional properties:
+--------------------
+- enable-gpio:		GPIO to use to enable/disable the regulator
+
 Any property defined as part of the core regulator binding can also be used.
 (See: ../regulator/regulator.txt)
 
-Continuous Voltage Example:
+Continuous Voltage With Enable GPIO Example:
 	pwm_regulator {
 		compatible = "pwm-regulator;
 		pwms = <&pwm1 0 8448 0>;
+		enable-gpio = <&gpio0 23 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <1016000>;
 		regulator-max-microvolt = <1114000>;
 		regulator-name = "vdd_logic";
-- 
2.8.3
