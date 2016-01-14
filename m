From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH v5 11/14] dt/bindings: Add bindings for PIC32 SDHCI host controller
Date: Wed, 13 Jan 2016 18:15:44 -0700
Message-ID: <1452734299-460-12-git-send-email-joshua.henderson@microchip.com>
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Andrei Pistirica <andrei.pistirica@microchip.com>

Document the devicetree bindings for the SDHCI peripheral found on
Microchip PIC32 class devices.

Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v4: None
Changes since v3: None
Changes since v2: None
Changes since v1:
	- Drop usage of piomode and no-1-8-v DT properties
---
 .../bindings/mmc/microchip,sdhci-pic32.txt         |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt

diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
new file mode 100644
index 0000000..71ad57e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
@@ -0,0 +1,29 @@
+* Microchip PIC32 SDHCI Controller
+
+This file documents differences between the core properties in mmc.txt
+and the properties used by the sdhci-pic32 driver.
+
+Required properties:
+- compatible: Should be "microchip,pic32mzda-sdhci"
+- interrupts: Should contain interrupt
+- clock-names: Should be "base_clk", "sys_clk".
+               See: Documentation/devicetree/bindings/resource-names.txt
+- clocks: Phandle to the clock.
+          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
+- pinctrl-names: A pinctrl state names "default" must be defined.
+- pinctrl-0: Phandle referencing pin configuration of the SDHCI controller.
+             See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+
+Example:
+
+	sdhci@1f8ec000 {
+		compatible = "microchip,pic32mzda-sdhci";
+		reg = <0x1f8ec000 0x100>;
+		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&REFCLKO4>, <&PBCLK5>;
+		clock-names = "base_clk", "sys_clk";
+		bus-width = <4>;
+		cap-sd-highspeed;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdhc1>;
+	};
-- 
1.7.9.5
