From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 05/10] Documentation: devicetree: brcmstb_nand: add 'brcm,nand-soc' bindings
Date: Wed,  6 May 2015 10:59:49 -0700
Message-ID: <1430935194-7579-6-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
index 662c857e74fe..6a3ab751db99 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
@@ -30,7 +30,10 @@ Required properties:
                      "flash-dma" and/or "nand-cache".
 - interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
                      FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done"
+- interrupt-names  : For hardware without a dedicated 'brcm,nand-soc' node, may
+                     be "nand_ctlrdy" or "flash_dma_done"
+                     For hardware with a dedicated 'brcm,nand-soc' node for
+                     breaking out individual interrupt types, may be "nand"
 - interrupt-parent : See standard interrupt bindings
 - #address-cells   : <1> - subnodes give the chip-select number
 - #size-cells      : <0>
@@ -40,6 +43,10 @@ Optional properties:
                               (WP) control bit. It is always available on >=
                               v7.0. Use this property to describe the rare
                               earlier versions of this core that include WP
+- brcm,nand-soc             : Phandle to SoC control node. This is necessary
+                              for SoCs where NAND interrupts and bus
+                              infrastructure are integrated in non-standard
+                              ways.
 
 * NAND chip-select
 
@@ -74,6 +81,36 @@ Optional properties:
 Each nandcs device node may optionally contain sub-nodes describing the flash
 partition mapping. See partition.txt for more detail.
 
+
+* NAND SoC control node:
+
+The NAND controller is integrated differently on the variety of SoCs on which it
+is found. Part of this integration involves providing status and enable bits
+with which to control the 8 exposed NAND interrupts, as well as hardware for
+configuring the endianness of the data bus. On some SoCs, these features are
+handled via standard, modular components (e.g., their interrupts look like a
+normal IRQ chip), but on others, they are controlled in unique and interesting
+ways, sometimes with registers that lump multiple NAND-related functions
+together. The former case can be described simply by the standard interrupts
+properties in the main controller node. But for the latter exceptional cases,
+we can describe these extra SoC-specific integration hardware via the following
+node, referenced from the brcm,brcmnand node above.
+
+ - compatible: Can be one of several SoC-specific strings. Each SoC may have
+   different requirements for its additional properties, as described below each
+   bullet point below.
+
+   * "brcm,nand-soc-bcm63138"
+     - reg: (required) the 'NAND_INT_BASE' register range, with separate status
+       and enable registers
+
+   * "brcm,nand-soc-iproc"
+     - reg: (required) the "IDM" register range, for interrupt enable and APB
+       bus access endianness configuration, and the "EXT" register range,
+       for interrupt status/ack.
+     - reg-names: (required) a list of the names corresponding to the previous
+       register ranges. Should contain "idm" and "ext".
+
 Example:
 
 nand@f0442800 {
-- 
1.9.1
