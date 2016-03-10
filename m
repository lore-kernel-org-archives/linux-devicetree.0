From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH v4 1/2] ARM: dts: at91: shdwc binding: add new shutdown controller documentation
Date: Thu, 10 Mar 2016 16:37:39 +0100
Message-ID: <1457624260-30350-2-git-send-email-nicolas.ferre@atmel.com>
References: <1457624260-30350-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457624260-30350-1-git-send-email-nicolas.ferre@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, sre@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

The new shutdown controller compatible with sama5d2 has a new binding
documentation and properties.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
---

Changes in v4:
- change property to debounce-delay-us so that we can use a generic property
  and we can have the unit explicitly included it the name according to
  Documentation/devicetree/bindings/property-units.txt.
- move to atmel,wakeup-active-high boolean property instead of a "high", "low"
  string comparison.

Changes in v3:
- get and use slow clock and specify its handler in binding

Changes in v2: None

 .../devicetree/bindings/arm/atmel-at91.txt         | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/Documentation/devicetree/bindings/arm/atmel-at91.txt
index 7fd64ec9ee1d..cfeb161cb0ae 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
@@ -147,6 +147,65 @@ Example:
 		clocks = <&clk32k>;
 	};
 
+SHDWC Shutdown Controller (Alternative)
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
 Special Function Registers (SFR)
 
 Special Function Registers (SFR) manage specific aspects of the integrated
-- 
2.1.3
