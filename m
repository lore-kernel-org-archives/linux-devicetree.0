From: kernel@martin.sperl.org
Subject: [PATCH 1/4] dt: bindings: add bcm2835-memory-controller documentation
Date: Thu, 12 May 2016 12:38:49 +0000
Message-ID: <1463056732-5607-2-git-send-email-kernel@martin.sperl.org>
References: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel@martin.sperl.org>

Add memory controller dt-binding documentation for the
bcm2835 soc.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 .../bindings/memory-controllers/brcm,bcm2835-sdram.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/brcm,bcm2835-sdram.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,bcm2835-sdram.txt b/Documentation/devicetree/bindings/memory-controllers/brcm,bcm2835-sdram.txt
new file mode 100644
index 0000000..d1cb151
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,bcm2835-sdram.txt
@@ -0,0 +1,16 @@
+Binding for SDRAM driver for BCM2835 SoCs.
+
+Required parameters:
+-------------------
+
+compatible : 	should be: "brcm,bcm2835-sdram"
+reg :		Address ranges of the ic1/ic2 registers.
+clocks : 	Phandle of the clock used by the sdram.
+
+Example:
+
+memory-conroller@7e002000 {
+	compatible = "brcm,bcm2835-sdram";
+	reg = <0x7e002000 0x58>, <0x7e002800 0x58>;
+	clocks = <&clocks BCM2835_CLOCK_SDRAM>;
+};
-- 
2.1.4
