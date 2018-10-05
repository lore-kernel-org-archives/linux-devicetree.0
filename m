From: Rob Herring <robh@kernel.org>
Subject: [PATCH 03/36] dt-bindings: arm: atmel: Move various sys registers out of SoC binding doc
Date: Fri,  5 Oct 2018 11:58:15 -0500
Message-ID: <20181005165848.3474-4-robh@kernel.org>
References: <20181005165848.3474-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005165848.3474-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

In preparation to convert board-level bindings to json-schema, move
various misc SoC bindings out to their own file.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/atmel-at91.txt    | 170 -----------------
 .../devicetree/bindings/arm/atmel-sysregs.txt | 171 ++++++++++++++++++
 2 files changed, 171 insertions(+), 170 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel-sysregs.txt

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/Documentation/devicetree/bindings/arm/atmel-at91.txt
index 31220b54d85d..4bf1b4da7659 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
@@ -70,173 +70,3 @@ compatible: must be one of:
        - "atmel,samv71q19"
        - "atmel,samv71q20"
        - "atmel,samv71q21"
-
-Chipid required properties:
-- compatible: Should be "atmel,sama5d2-chipid"
-- reg : Should contain registers location and length
-
-PIT Timer required properties:
-- compatible: Should be "atmel,at91sam9260-pit"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the PIT which is the IRQ line
-  shared across all System Controller members.
-
-System Timer (ST) required properties:
-- compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the ST which is the IRQ line
-  shared across all System Controller members.
-- clocks: phandle to input clock.
-Its subnodes can be:
-- watchdog: compatible should be "atmel,at91rm9200-wdt"
-
-RSTC Reset Controller required properties:
-- compatible: Should be "atmel,<chip>-rstc".
-  <chip> can be "at91sam9260" or "at91sam9g45" or "sama5d3"
-- reg: Should contain registers location and length
-- clocks: phandle to input clock.
-
-Example:
-
-	rstc@fffffd00 {
-		compatible = "atmel,at91sam9260-rstc";
-		reg = <0xfffffd00 0x10>;
-		clocks = <&clk32k>;
-	};
-
-RAMC SDRAM/DDR Controller required properties:
-- compatible: Should be "atmel,at91rm9200-sdramc", "syscon"
-			"atmel,at91sam9260-sdramc",
-			"atmel,at91sam9g45-ddramc",
-			"atmel,sama5d3-ddramc",
-- reg: Should contain registers location and length
-
-Examples:
-
-	ramc0: ramc@ffffe800 {
-		compatible = "atmel,at91sam9g45-ddramc";
-		reg = <0xffffe800 0x200>;
-	};
-
-SHDWC Shutdown Controller
-
-required properties:
-- compatible: Should be "atmel,<chip>-shdwc".
-  <chip> can be "at91sam9260", "at91sam9rl" or "at91sam9x5".
-- reg: Should contain registers location and length
-- clocks: phandle to input clock.
-
-optional properties:
-- atmel,wakeup-mode: String, operation mode of the wakeup mode.
-  Supported values are: "none", "high", "low", "any".
-- atmel,wakeup-counter: Counter on Wake-up 0 (between 0x0 and 0xf).
-
-optional at91sam9260 properties:
-- atmel,wakeup-rtt-timer: boolean to enable Real-time Timer Wake-up.
-
-optional at91sam9rl properties:
-- atmel,wakeup-rtc-timer: boolean to enable Real-time Clock Wake-up.
-- atmel,wakeup-rtt-timer: boolean to enable Real-time Timer Wake-up.
-
-optional at91sam9x5 properties:
-- atmel,wakeup-rtc-timer: boolean to enable Real-time Clock Wake-up.
-
-Example:
-
-	shdwc@fffffd10 {
-		compatible = "atmel,at91sam9260-shdwc";
-		reg = <0xfffffd10 0x10>;
-		clocks = <&clk32k>;
-	};
-
-SHDWC SAMA5D2-Compatible Shutdown Controller
-
-1) shdwc node
-
-required properties:
-- compatible: should be "atmel,sama5d2-shdwc".
-- reg: should contain registers location and length
-- clocks: phandle to input clock.
-- #address-cells: should be one. The cell is the wake-up input index.
-- #size-cells: should be zero.
-
-optional properties:
-
-- debounce-delay-us: minimum wake-up inputs debouncer period in
-  microseconds. It's usually a board-related property.
-- atmel,wakeup-rtc-timer: boolean to enable Real-Time Clock wake-up.
-
-The node contains child nodes for each wake-up input that the platform uses.
-
-2) input nodes
-
-Wake-up input nodes are usually described in the "board" part of the Device
-Tree. Note also that input 0 is linked to the wake-up pin and is frequently
-used.
-
-Required properties:
-- reg: should contain the wake-up input index [0 - 15].
-
-Optional properties:
-- atmel,wakeup-active-high: boolean, the corresponding wake-up input described
-  by the child, forces the wake-up of the core power supply on a high level.
-  The default is to be active low.
-
-Example:
-
-On the SoC side:
-	shdwc@f8048010 {
-		compatible = "atmel,sama5d2-shdwc";
-		reg = <0xf8048010 0x10>;
-		clocks = <&clk32k>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		atmel,wakeup-rtc-timer;
-	};
-
-On the board side:
-	shdwc@f8048010 {
-		debounce-delay-us = <976>;
-
-		input@0 {
-			reg = <0>;
-		};
-
-		input@1 {
-			reg = <1>;
-			atmel,wakeup-active-high;
-		};
-	};
-
-Special Function Registers (SFR)
-
-Special Function Registers (SFR) manage specific aspects of the integrated
-memory, bridge implementations, processor and other functionality not controlled
-elsewhere.
-
-required properties:
-- compatible: Should be "atmel,<chip>-sfr", "syscon" or
-	"atmel,<chip>-sfrbu", "syscon"
-  <chip> can be "sama5d3", "sama5d4" or "sama5d2".
-- reg: Should contain registers location and length
-
-	sfr@f0038000 {
-		compatible = "atmel,sama5d3-sfr", "syscon";
-		reg = <0xf0038000 0x60>;
-	};
-
-Security Module (SECUMOD)
-
-The Security Module macrocell provides all necessary secure functions to avoid
-voltage, temperature, frequency and mechanical attacks on the chip. It also
-embeds secure memories that can be scrambled
-
-required properties:
-- compatible: Should be "atmel,<chip>-secumod", "syscon".
-  <chip> can be "sama5d2".
-- reg: Should contain registers location and length
-
-	secumod@fc040000 {
-		compatible = "atmel,sama5d2-secumod", "syscon";
-		reg = <0xfc040000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
new file mode 100644
index 000000000000..4b96608ad692
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -0,0 +1,171 @@
+Atmel system registers
+
+Chipid required properties:
+- compatible: Should be "atmel,sama5d2-chipid"
+- reg : Should contain registers location and length
+
+PIT Timer required properties:
+- compatible: Should be "atmel,at91sam9260-pit"
+- reg: Should contain registers location and length
+- interrupts: Should contain interrupt for the PIT which is the IRQ line
+  shared across all System Controller members.
+
+System Timer (ST) required properties:
+- compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
+- reg: Should contain registers location and length
+- interrupts: Should contain interrupt for the ST which is the IRQ line
+  shared across all System Controller members.
+- clocks: phandle to input clock.
+Its subnodes can be:
+- watchdog: compatible should be "atmel,at91rm9200-wdt"
+
+RSTC Reset Controller required properties:
+- compatible: Should be "atmel,<chip>-rstc".
+  <chip> can be "at91sam9260" or "at91sam9g45" or "sama5d3"
+- reg: Should contain registers location and length
+- clocks: phandle to input clock.
+
+Example:
+
+	rstc@fffffd00 {
+		compatible = "atmel,at91sam9260-rstc";
+		reg = <0xfffffd00 0x10>;
+		clocks = <&clk32k>;
+	};
+
+RAMC SDRAM/DDR Controller required properties:
+- compatible: Should be "atmel,at91rm9200-sdramc", "syscon"
+			"atmel,at91sam9260-sdramc",
+			"atmel,at91sam9g45-ddramc",
+			"atmel,sama5d3-ddramc",
+- reg: Should contain registers location and length
+
+Examples:
+
+	ramc0: ramc@ffffe800 {
+		compatible = "atmel,at91sam9g45-ddramc";
+		reg = <0xffffe800 0x200>;
+	};
+
+SHDWC Shutdown Controller
+
+required properties:
+- compatible: Should be "atmel,<chip>-shdwc".
+  <chip> can be "at91sam9260", "at91sam9rl" or "at91sam9x5".
+- reg: Should contain registers location and length
+- clocks: phandle to input clock.
+
+optional properties:
+- atmel,wakeup-mode: String, operation mode of the wakeup mode.
+  Supported values are: "none", "high", "low", "any".
+- atmel,wakeup-counter: Counter on Wake-up 0 (between 0x0 and 0xf).
+
+optional at91sam9260 properties:
+- atmel,wakeup-rtt-timer: boolean to enable Real-time Timer Wake-up.
+
+optional at91sam9rl properties:
+- atmel,wakeup-rtc-timer: boolean to enable Real-time Clock Wake-up.
+- atmel,wakeup-rtt-timer: boolean to enable Real-time Timer Wake-up.
+
+optional at91sam9x5 properties:
+- atmel,wakeup-rtc-timer: boolean to enable Real-time Clock Wake-up.
+
+Example:
+
+	shdwc@fffffd10 {
+		compatible = "atmel,at91sam9260-shdwc";
+		reg = <0xfffffd10 0x10>;
+		clocks = <&clk32k>;
+	};
+
+SHDWC SAMA5D2-Compatible Shutdown Controller
+
+1) shdwc node
+
+required properties:
+- compatible: should be "atmel,sama5d2-shdwc".
+- reg: should contain registers location and length
+- clocks: phandle to input clock.
+- #address-cells: should be one. The cell is the wake-up input index.
+- #size-cells: should be zero.
+
+optional properties:
+
+- debounce-delay-us: minimum wake-up inputs debouncer period in
+  microseconds. It's usually a board-related property.
+- atmel,wakeup-rtc-timer: boolean to enable Real-Time Clock wake-up.
+
+The node contains child nodes for each wake-up input that the platform uses.
+
+2) input nodes
+
+Wake-up input nodes are usually described in the "board" part of the Device
+Tree. Note also that input 0 is linked to the wake-up pin and is frequently
+used.
+
+Required properties:
+- reg: should contain the wake-up input index [0 - 15].
+
+Optional properties:
+- atmel,wakeup-active-high: boolean, the corresponding wake-up input described
+  by the child, forces the wake-up of the core power supply on a high level.
+  The default is to be active low.
+
+Example:
+
+On the SoC side:
+	shdwc@f8048010 {
+		compatible = "atmel,sama5d2-shdwc";
+		reg = <0xf8048010 0x10>;
+		clocks = <&clk32k>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		atmel,wakeup-rtc-timer;
+	};
+
+On the board side:
+	shdwc@f8048010 {
+		debounce-delay-us = <976>;
+
+		input@0 {
+			reg = <0>;
+		};
+
+		input@1 {
+			reg = <1>;
+			atmel,wakeup-active-high;
+		};
+	};
+
+Special Function Registers (SFR)
+
+Special Function Registers (SFR) manage specific aspects of the integrated
+memory, bridge implementations, processor and other functionality not controlled
+elsewhere.
+
+required properties:
+- compatible: Should be "atmel,<chip>-sfr", "syscon" or
+	"atmel,<chip>-sfrbu", "syscon"
+  <chip> can be "sama5d3", "sama5d4" or "sama5d2".
+- reg: Should contain registers location and length
+
+	sfr@f0038000 {
+		compatible = "atmel,sama5d3-sfr", "syscon";
+		reg = <0xf0038000 0x60>;
+	};
+
+Security Module (SECUMOD)
+
+The Security Module macrocell provides all necessary secure functions to avoid
+voltage, temperature, frequency and mechanical attacks on the chip. It also
+embeds secure memories that can be scrambled
+
+required properties:
+- compatible: Should be "atmel,<chip>-secumod", "syscon".
+  <chip> can be "sama5d2".
+- reg: Should contain registers location and length
+
+	secumod@fc040000 {
+		compatible = "atmel,sama5d2-secumod", "syscon";
+		reg = <0xfc040000 0x100>;
+	};
-- 
2.17.1
