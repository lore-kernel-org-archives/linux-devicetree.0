From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/4] Documentation: devicetree: add binding doc for Broadcom NAND controller
Date: Wed, 18 Mar 2015 19:49:16 -0700
Message-ID: <1426733358-15596-3-git-send-email-computersforpeace@gmail.com>
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426733358-15596-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
new file mode 100644
index 000000000000..933d44943cbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
@@ -0,0 +1,109 @@
+* Broadcom STB NAND Controller
+
+The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
+flash chips. It has a memory-mapped register interface for both control
+registers and for its data input/output buffer. On some SoCs, this controller is
+paired with a custom DMA engine (inventively named "Flash DMA") which supports
+basic PROGRAM and READ functions, among other features.
+
+This controller was originally designed for STB SoCs (BCM7xxx) but is now
+available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
+iProc/Cygnus. Its history includes several similar (but not fully register
+compatible) versions.
+
+Required properties:
+- compatible       : should contain "brcm,brcmnand" and an appropriate version
+                      compatibility string, like "brcm,brcmnand-v7.0"
+                      Possible values:
+                         brcm,brcmnand-v4.0
+                         brcm,brcmnand-v5.0
+                         brcm,brcmnand-v6.0
+                         brcm,brcmnand-v7.0
+                         brcm,brcmnand-v7.1
+                         brcm,brcmnand
+- reg              : the register start and length for NAND register region.
+                     (optional) Flash DMA register range (if present)
+                     (optional) NAND flash cache range (if at non-standard offset)
+- reg-names        : a list of the names corresponding to the previous register
+                     ranges. Should contain "nand" and (optionally)
+                     "flash-dma" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
+                     FLASH_DMA_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done"
+- interrupt-parent : See standard interrupt bindings
+- #address-cells   : <1> - subnodes give the chip-select number
+- #size-cells      : <0>
+
+Optional properties:
+- brcm,nand-has-wp          : Some versions of this IP include a write-protect
+                              (WP) control bit. It is always available on >=
+                              v7.0. Use this property to describe the rare
+                              earlier versions of this core that include WP
+
+* NAND chip-select
+
+Each controller (compatible: "brcm,brcmnand") may contain one or more subnodes
+to represent enabled chip-selects which (may) contain NAND flash chips. Their
+properties are as follows.
+
+Required properties:
+- compatible                : should contain "brcm,nandcs"
+- reg                       : a single integer representing the chip-select
+                              number (e.g., 0, 1, 2, etc.)
+- #address-cells            : see partition.txt
+- #size-cells               : see partition.txt
+- nand-ecc-strength         : see nand.txt
+- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
+
+Optional properties:
+- nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
+                              chip-select. See nand.txt
+- brcm,nand-oob-sector-size : integer, to denote the spare area sector size
+                              expected for the ECC layout in use. This size, in
+                              addition to the strength and step-size,
+                              determines how the hardware BCH engine will lay
+                              out the parity bytes it stores on the flash.
+                              This property can be automatically determined by
+                              the flash geometry (particularly the NAND page
+                              and OOB size) in many cases, but when booting
+                              from NAND, the boot controller has only a limited
+                              number of available options for its default ECC
+                              layout.
+
+Each nandcs device node may optionally contain sub-nodes describing the flash
+partition mapping. See partition.txt for more detail.
+
+Example:
+
+nand@f0442800 {
+	compatible = "brcm,brcmnand-v7.0", "brcm,brcmnand";
+	reg = <0xF0442800 0x600>,
+	      <0xF0443000 0x100>;
+	reg-names = "nand", "flash-dma";
+	interrupt-parent = <&hif_intr2_intc>;
+	interrupts = <24>, <4>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>; // Chip select 1
+		nand-on-flash-bbt;
+		nand-ecc-strength = <12>;
+		nand-ecc-step-size = <512>;
+
+		// Partitions
+		#address-cells = <1>;  // <2>, for 64-bit offset
+		#size-cells = <1>;     // <2>, for 64-bit length
+		flash0.rootfs@0 {
+			reg = <0 0x10000000>;
+		};
+		flash0@0 {
+			reg = <0 0>; // MTDPART_SIZ_FULL
+		};
+		flash0.kernel@10000000 {
+			reg = <0x10000000 0x400000>;
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
