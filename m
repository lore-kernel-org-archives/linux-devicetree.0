From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 1/2] regulator: Add regmap support to regulator-fixed device
 tree binding
Date: Sat, 28 Nov 2015 21:13:01 +0000
Message-ID: <565A18DD.60108@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

Add properties for regmap to the regulator-fixed device tree binding:
* Reference the regmap phandle
* Specify the enable offset and enable mask
* Reuse enable-active-high for regmap

This is required for Broadcom BCM63xx SoCs that enable power to
individual peripherals by clearing a bit in the miscIddqCtrl register.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 .../bindings/regulator/fixed-regulator.txt          | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
index 4fae41d..b499a65 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
@@ -5,13 +5,18 @@ Required properties:
 
 Optional properties:
 - gpio: gpio to use for enable control
+- regmap: regmap phandle to use for enable control
+- regmap-offset: register offset when using regmap for enable control
+- regmap-mask: register enable mask when using regmap for enable control
 - startup-delay-us: startup time in microseconds
-- enable-active-high: Polarity of GPIO is Active high
+- enable-active-high: Polarity of GPIO/regmap is Active high
 If this property is missing, the default assumed is Active low.
 - gpio-open-drain: GPIO is open drain type.
   If this property is missing then default assumption is false.
 -vin-supply: Input supply name.
 
+Only one of gpio/regmap should be specified.
+
 Any property defined as part of the core regulator
 binding, defined in regulator.txt, can also be used.
 However a fixed voltage regulator is expected to have the
@@ -32,3 +37,17 @@ Example:
 		gpio-open-drain;
 		vin-supply = <&parent_reg>;
 	};
+
+	xyz: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regmap = <&syscon>;
+		regmap-offset = <0x4>;
+		regmap-mask = <0x200>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+		regulator-boot-on;
+		vin-supply = <&parent_reg>;
+	};
-- 
2.1.4

-- 
Simon Arlott
