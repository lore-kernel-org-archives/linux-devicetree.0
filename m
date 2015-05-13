From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 05/11] Documentation: devicetree: brcmstb_nand: add BCM63138 and Cygnus/iProc
Date: Tue, 12 May 2015 17:53:38 -0700
Message-ID: <1431478424-29230-6-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add notes to describe how some SoCs integrate this NAND core a little
differently, and so we define extra compatibility strings and register
resources/names.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v4: reworked to include all NAND + SoC info directly in the NAND controller
    node

 .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 48 ++++++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 662c857e74fe..4ff7128ee3b2 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -12,9 +12,14 @@ iProc/Cygnus. Its history includes several similar (but not fully register
 compatible) versions.
 
 Required properties:
-- compatible       : should contain "brcm,brcmnand" and an appropriate version
-                      compatibility string, like "brcm,brcmnand-v7.0"
-                      Possible values:
+- compatible       : May contain an SoC-specific compatibility string (see below)
+                     to account for any SoC-specific hardware bits that may be
+                     added on top of the base core controller.
+                     In addition, must contain compatibility information about
+                     the core NAND controller, of the following form:
+                     "brcm,brcmnand" and an appropriate version compatibility
+                     string, like "brcm,brcmnand-v7.0"
+                     Possible values:
                          brcm,brcmnand-v4.0
                          brcm,brcmnand-v5.0
                          brcm,brcmnand-v6.0
@@ -30,7 +35,11 @@ Required properties:
                      "flash-dma" and/or "nand-cache".
 - interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
                      FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done"
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done", if broken out as
+                     individual interrupts.
+                     May be "nand", if the SoC has the individual NAND
+                     interrupts multiplexed behind another custom piece of
+                     hardware
 - interrupt-parent : See standard interrupt bindings
 - #address-cells   : <1> - subnodes give the chip-select number
 - #size-cells      : <0>
@@ -41,6 +50,36 @@ Optional properties:
                               v7.0. Use this property to describe the rare
                               earlier versions of this core that include WP
 
+ -- Additonal SoC-specific NAND controller properties --
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
+we define additional 'compatible' properties and associated register resources within the NAND controller node above.
+
+ - compatible: Can be one of several SoC-specific strings. Each SoC may have
+   different requirements for its additional properties, as described below each
+   bullet point below.
+
+   * "brcm,nand-bcm63138"
+     - reg: (required) the 'NAND_INT_BASE' register range, with separate status
+       and enable registers
+     - reg-names: (required) "nand-int-base"
+
+   * "brcm,nand-iproc"
+     - reg: (required) the "IDM" register range, for interrupt enable and APB
+       bus access endianness configuration, and the "EXT" register range,
+       for interrupt status/ack.
+     - reg-names: (required) a list of the names corresponding to the previous
+       register ranges. Should contain "iproc-idm" and "iproc-ext".
+
+
 * NAND chip-select
 
 Each controller (compatible: "brcm,brcmnand") may contain one or more subnodes
@@ -74,6 +113,7 @@ Optional properties:
 Each nandcs device node may optionally contain sub-nodes describing the flash
 partition mapping. See partition.txt for more detail.
 
+
 Example:
 
 nand@f0442800 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
