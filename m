From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 10/18] ARM64: dts: meson-gxbb: Reorder nodes
Date: Fri, 20 Jan 2017 23:21:10 +0100
Message-ID: <20170120222118.21476-11-afaerber@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120222118.21476-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sort nodes referenced by label alphabetically.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 76 ++++++++++++++---------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 39a774ad83ce..5c22c794ed95 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -97,24 +97,6 @@
 	};
 };
 
-&cbus {
-	spifc: spi@8c80 {
-		compatible = "amlogic,meson-gxbb-spifc";
-		reg = <0x0 0x08c80 0x0 0x80>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clkc CLKID_SPI>;
-		status = "disabled";
-	};
-};
-
-&ethmac {
-	clocks = <&clkc CLKID_ETH>,
-		 <&clkc CLKID_FCLK_DIV2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
-};
-
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
@@ -230,6 +212,44 @@
 	};
 };
 
+&cbus {
+	spifc: spi@8c80 {
+		compatible = "amlogic,meson-gxbb-spifc";
+		reg = <0x0 0x08c80 0x0 0x80>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clkc CLKID_SPI>;
+		status = "disabled";
+	};
+};
+
+&ethmac {
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_FCLK_DIV2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
+};
+
+&hiubus {
+	clkc: clock-controller@0 {
+		compatible = "amlogic,gxbb-clkc";
+		#clock-cells = <1>;
+		reg = <0x0 0x0 0x0 0x3db>;
+	};
+};
+
+&i2c_A {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_B {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_C {
+	clocks = <&clkc CLKID_I2C>;
+};
+
 &periphs {
 	pinctrl_periphs: pinctrl@4b0 {
 		compatible = "amlogic,meson-gxbb-periphs-pinctrl";
@@ -470,26 +490,6 @@
 	};
 };
 
-&hiubus {
-	clkc: clock-controller@0 {
-		compatible = "amlogic,gxbb-clkc";
-		#clock-cells = <1>;
-		reg = <0x0 0x0 0x0 0x3db>;
-	};
-};
-
-&i2c_A {
-	clocks = <&clkc CLKID_I2C>;
-};
-
-&i2c_B {
-	clocks = <&clkc CLKID_I2C>;
-};
-
-&i2c_C {
-	clocks = <&clkc CLKID_I2C>;
-};
-
 &sd_emmc_a {
 	clocks = <&clkc CLKID_SD_EMMC_A>,
 		 <&xtal>,
-- 
2.10.2
