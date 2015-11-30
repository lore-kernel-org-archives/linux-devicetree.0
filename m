From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree binding
Date: Mon, 30 Nov 2015 20:30:07 +0000
Message-ID: <565CB1CF.5040306@simon.arlott.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151130121043.GX1929@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

The BCM63xx has one or more registers with bits that act as regulators
to enable/disable power to individual chip peripherals.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 .../bindings/regulator/brcm,bcm63xx-regulator.txt  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm63xx-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm63xx-regulator.txt b/Documentation/devicetree/bindings/regulator/brcm,bcm63xx-regulator.txt
new file mode 100644
index 0000000..e905241
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm63xx-regulator.txt
@@ -0,0 +1,33 @@
+BCM63xx regulators
+
+The BCM63xx has one or more registers with bits that act as regulators
+to enable/disable power to individual chip peripherals.
+
+Required properties:
+- compatible: Must be "brcm,bcm<soc>-regulator", "brcm,bcm63xx-regulator";
+- regmap: regmap phandle to use for enable control
+- offset: register offset
+- mask: register enable mask
+- startup-delay-us: startup time in microseconds
+
+Any property defined as part of the core regulator
+binding, defined in regulator.txt, can also be used.
+
+However the regulator is expected to have the same values
+for regulator-min-microvolt and regulator-max-microvolt.
+
+Example:
+
+misc: syscon@10001800 {
+	compatible = "syscon";
+	reg = <0x10001800 0xd0>;
+};
+
+robosw_power: robosw {
+	compatible = "brcm,bcm63168-regulator", "brcm,bcm63xx-regulator";
+	regulator-name = "robosw_power";
+	regmap = <&misc>;
+	offset = <0x4c>;
+	mask = <0x40>;
+	startup-delay-us = <100000>;
+};
-- 
2.1.4

-- 
Simon Arlott
