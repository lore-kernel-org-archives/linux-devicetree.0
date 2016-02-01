From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 random number generator
Date: Mon, 1 Feb 2016 15:41:41 -0700
Message-ID: <1454366511-10640-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Joshua Henderson <joshua.henderson@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the devicetree bindings for the random number generator found
on Microchip PIC32 class devices.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 .../bindings/rng/microchip,pic32-rng.txt           |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt

diff --git a/Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt b/Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt
new file mode 100644
index 0000000..c6d1003
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt
@@ -0,0 +1,17 @@
+* Microchip PIC32 Random Number Generator
+
+The PIC32 RNG provides a pseudo random number generator which can be seeded by
+another true random number generator.
+
+Required properties:
+- compatible : should be "microchip,pic32mzda-rng"
+- reg : Specifies base physical address and size of the registers.
+- clocks: clock phandle.
+
+Example:
+
+	rng: rng@1f8e6000 {
+		compatible = "microchip,pic32mzda-rng";
+		reg = <0x1f8e6000 0x1000>;
+		clocks = <&PBCLK5>;
+	};
-- 
1.7.9.5
