From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] mtd: nand: pxa3xx: add optional dma for pxa architecture
Date: Sun, 30 Aug 2015 21:44:12 +0200
Message-ID: <1440963852-17936-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

The PXA architecture provides a DMA to pump data from the nand
controller to memory and the other way around. Add it to the binding
description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
index 4f833e3c4f51..d9b655f11048 100644
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
@@ -11,6 +11,7 @@ Required properties:
 
 Optional properties:
 
+ - dmas:			dma data channel, see dma.txt binding doc
  - marvell,nand-enable-arbiter:	Set to enable the bus arbiter
  - marvell,nand-keep-config:	Set to keep the NAND controller config as set
 				by the bootloader
@@ -32,6 +33,8 @@ Example:
 		compatible = "marvell,pxa3xx-nand";
 		reg = <0x43100000 90>;
 		interrupts = <45>;
+		dmas = <&pdma 97 0>;
+		dma-names = "data";
 		#address-cells = <1>;
 
 		marvell,nand-enable-arbiter;
-- 
2.1.4
