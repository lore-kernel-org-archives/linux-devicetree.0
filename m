From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 6/8] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
Date: Thu, 2 Jun 2016 12:52:26 -0500
Message-ID: <1464889948-28793-7-git-send-email-tthayer@opensource.altera.com>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Thor Thayer <tthayer@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the Altera Arria10 System Resource node. This is a Multi-Function
device with GPIO expander support.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  Addition of irq controller tags to match with bindings.
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 567df98..4638870 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -70,6 +70,27 @@
 	status = "okay";
 };
 
+&spi1 {
+	status = "okay";
+
+	resource-manager@0 {
+		compatible = "altr,a10sr";
+		reg = <0>;
+		spi-max-frequency = <100000>;
+		/* low-level active IRQ at GPIO1_5 */
+		interrupt-parent = <&portb>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		a10sr_gpio: gpio-controller {
+			compatible = "altr,a10sr-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
+};
+
 &i2c1 {
 	speed-mode = <0>;
 	status = "okay";
-- 
1.7.9.5

