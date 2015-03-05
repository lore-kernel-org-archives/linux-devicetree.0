From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH v2 1/1] DT: video: atmel_lcdc: Add example of fixed framebuffer memory
Date: Thu,  5 Mar 2015 08:35:38 +0100
Message-ID: <1425540938-20538-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

This drivers allows a fixed framebuffer memory to be set by an additional
IORESOURCE_MEM resource. Thus add an example to the DT documentation.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
Changes in v2:
* Fix typo noticed by checkpatch.pl

 Documentation/devicetree/bindings/video/atmel,lcdc.txt | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/atmel,lcdc.txt b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
index f059dd0..ecb8da0 100644
--- a/Documentation/devicetree/bindings/video/atmel,lcdc.txt
+++ b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
@@ -10,7 +10,9 @@ Required properties:
 	"atmel,at91sam9g45es-lcdc" ,
 	"atmel,at91sam9rl-lcdc" ,
 	"atmel,at32ap-lcdc"
-- reg : Should contain 1 register ranges(address and length)
+- reg : Should contain 1 register ranges(address and length).
+	Can contain an additional register range(address and length)
+	for fixed framebuffer memory. Useful for dedicated memories.
 - interrupts : framebuffer controller interrupt
 - display: a phandle pointing to the display node
 
@@ -38,6 +40,14 @@ Example:
 
 	};
 
+Example for fixed framebuffer memory:
+
+	fb0: fb@0x00500000 {
+		compatible = "atmel,at91sam9263-lcdc";
+		reg = <0x00700000 0x1000 0x70000000 0x200000>;
+		[...]
+	};
+
 Atmel LCDC Display
 -----------------------------------------------------
 Required properties (as per of_videomode_helper):
-- 
2.0.5
