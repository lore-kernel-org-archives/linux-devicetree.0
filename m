From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v5 3/4] clk: bd71837: Devicetree bindings for ROHM BD71837
 PMIC
Date: Mon, 4 Jun 2018 16:18:53 +0300
Message-ID: <da121dede6d79460c5653a5bc360d413cb988c74.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Document devicetree bindings for ROHM BD71837 PMIC clock output.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../bindings/clock/rohm,bd71837-clock.txt          | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rohm,bd71837-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/rohm,bd71837-clock.txt b/Documentation/devicetree/bindings/clock/rohm,bd71837-clock.txt
new file mode 100644
index 000000000000..771acfe34114
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rohm,bd71837-clock.txt
@@ -0,0 +1,38 @@
+ROHM BD71837 Power Management Integrated Circuit clock bindings
+
+This is a part of device tree bindings of ROHM BD71837 multi-function
+device. See generic BD71837 MFD bindings at:
+	Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
+
+BD71837 contains one 32,768 KHz clock output which can be enabled and
+disabled via i2c.
+
+Following properties should be present in main device node of the MFD chip.
+
+Required properties:
+- clock-frequency	: Should be 32768
+- #clock-cells		: Should be 0
+
+Optional properties:
+- clock-output-names	: Should contain name for output clock.
+
+Example:
+
+/* MFD node */
+
+pmic: pmic@4b {
+	compatible = "rohm,bd71837";
+	/* ... */
+	#clock-cells = <0>;
+	clock-frequency  = <32768>;
+	/* ... */
+};
+
+/* Clock consumer node */
+
+foo@0 {
+	compatible = "bar,foo";
+	/* ... */
+	clock-names = "my-clock";
+	clocks = <&pmic>;
+};
-- 
2.14.3
