From: Sylvain Chouleur <sylvain.chouleur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Documentation: device-tree Fix typos and formatting
Date: Sun, 22 Nov 2015 14:44:34 +0100
Message-ID: <1448199874-27204-1-git-send-email-sylvain.chouleur@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylvain Chouleur <sylvain.chouleur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Also remove reference to a mandatory platform type field in /chosen
which is wrong per ePAPR v1.1 spec.

Signed-off-by: Sylvain Chouleur <sylvain.chouleur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/booting-without-of.txt | 40 ++++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 04d34f6a58f3..3a3707c7eb65 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -191,6 +191,7 @@ it with special cases.
    device tree block magic value (0xd00dfeed) or the ATAG_CORE value at
    offset 0x4 from r2 (0x54410001).
 
+
 2) Entry point for arch/powerpc
 -------------------------------
 
@@ -269,6 +270,7 @@ it with special cases.
   cannot support both configurations with Book E and configurations
   with classic Powerpc architectures.
 
+
 3) Entry point for arch/x86
 -------------------------------
 
@@ -289,6 +291,7 @@ it with special cases.
   or initrd address. It simply holds information which can not be retrieved
   otherwise like interrupt routing or a list of devices behind an I2C bus.
 
+
 4) Entry point for arch/mips/bmips
 ----------------------------------
 
@@ -316,10 +319,10 @@ it with special cases.
   This convention is defined for 32-bit systems only, as there are not
   currently any 64-bit BMIPS implementations.
 
+
 II - The DT block format
 ========================
 
-
 This chapter defines the actual format of the flattened device-tree
 passed to the kernel. The actual content of it and kernel requirements
 are described later. You can find example of code manipulating that
@@ -626,8 +629,8 @@ This tree is almost a minimal tree. It pretty much contains the
 minimal set of required nodes and properties to boot a linux kernel;
 that is, some basic model information at the root, the CPUs, and the
 physical memory layout.  It also includes misc information passed
-through /chosen, like in this example, the platform type (mandatory)
-and the kernel command line arguments (optional).
+through /chosen, like in this example, the kernel command line
+arguments (optional).
 
 The /cpus/PowerPC,970@0/64-bit property is an example of a
 property without a value. All other properties have a value. The
@@ -637,6 +640,7 @@ properties and their content.
 
 
 3) Device tree "structure" block
+--------------------------------
 
 The structure of the device tree is a linearized tree structure. The
 "OF_DT_BEGIN_NODE" token starts a new node, and the "OF_DT_END_NODE"
@@ -674,7 +678,9 @@ properties come first (up until at least 2.6.22).  Any tools
 manipulating a flattened tree must take care to preserve this
 constraint.
 
+
 4) Device tree "strings" block
+------------------------------
 
 In order to save space, property names, which are generally redundant,
 are stored separately in the "strings" block. This block is simply the
@@ -779,6 +785,7 @@ registers are visible on the parent bus using an identity mapping
 translation.  In other words, the parent bus address space is the same
 as the child bus address space.
 
+
 2) Note about "compatible" properties
 -------------------------------------
 
@@ -789,6 +796,7 @@ compatibility with a family of similar devices, in some cases,
 allowing a single driver to match against several devices regardless
 of their actual names.
 
+
 3) Note about "name" properties
 -------------------------------
 
@@ -810,6 +818,7 @@ used to reconstruct the name. That is, the part of the unit name
 before the "@" sign is used (or the entire unit name if no "@" sign
 is present).
 
+
 4) Note about node and property names and character set
 -------------------------------------------------------
 
@@ -831,6 +840,7 @@ address which can extend beyond that limit.
 
 5) Required nodes and properties
 --------------------------------
+
   These are all that are currently required. However, it is strongly
   recommended that you expose PCI host bridges as documented in the
   PCI binding to Open Firmware, and your interrupt tree as documented
@@ -930,7 +940,6 @@ compatibility.
   lines in there as a "soft-reset" property since they start secondary
   CPUs by soft-resetting them.
 
-
   d) the /memory node(s)
 
   To define the physical memory layout of your board, you should
@@ -1051,11 +1060,9 @@ compatibility.
 	}
 
 
-
 IV - "dtc", the device tree compiler
 ====================================
 
-
 dtc source code can be found at
 <http://git.jdl.com/gitweb/?p=dtc.git>
 
@@ -1171,7 +1178,6 @@ definitions to the compiler...
 V - Recommendations for a bootloader
 ====================================
 
-
 Here are some various ideas/recommendations that have been proposed
 while all this has been defined and implemented.
 
@@ -1200,7 +1206,6 @@ while all this has been defined and implemented.
     (reference needed; who is 'I' here? ---gcl Jan 31, 2011)
 
 
-
 VI - System-on-a-chip devices and nodes
 =======================================
 
@@ -1250,7 +1255,7 @@ more SoCs.
 
 
 VII - Specifying interrupt information for devices
-===================================================
+==================================================
 
 The device tree represents the buses and devices of a hardware
 system in a form similar to the physical bus topology of the
@@ -1264,6 +1269,7 @@ document "Open Firmware Recommended Practice: Interrupt
 Mapping Version 0.9".  The document is available at:
 <http://www.openfirmware.org/ofwg/practice/>
 
+
 1) interrupts property
 ----------------------
 
@@ -1271,8 +1277,8 @@ Devices that generate interrupts to a single interrupt controller
 should use the conventional OF representation described in the
 OF interrupt mapping documentation.
 
-Each device which generates interrupts must have an 'interrupt'
-property.  The interrupt property value is an arbitrary number of
+Each device which generates interrupts must have an 'interrupts'
+property.  The interrupts property value is an arbitrary number of
 of 'interrupt specifier' values which describe the interrupt or
 interrupts for the device.
 
@@ -1289,7 +1295,7 @@ number and level/sense information. All interrupt children in an
 OpenPIC interrupt domain use 2 cells per interrupt in their interrupts
 property.
 
-The PCI bus binding specifies a #interrupt-cell value of 1 to encode
+The PCI bus binding specifies a #interrupt-cells value of 1 to encode
 which interrupt pin (INTA,INTB,INTC,INTD) is used.
 
 2) interrupt-parent property
@@ -1304,6 +1310,7 @@ If the interrupt-parent property is not defined for a node, its
 interrupt parent is assumed to be an ancestor in the node's
 _device tree_ hierarchy.
 
+
 3) OpenPIC Interrupt Controllers
 --------------------------------
 
@@ -1319,6 +1326,7 @@ Sense and level information should be encoded as follows:
 	2 = active high level sensitive type enabled
 	3 = high to low edge sensitive type enabled
 
+
 4) ISA Interrupt Controllers
 ----------------------------
 
@@ -1335,11 +1343,12 @@ encodings listed below:
 	2 =  high to low edge sensitive type enabled
 	3 =  low to high edge sensitive type enabled
 
+
 VIII - Specifying Device Power Management Information (sleep property)
-===================================================================
+======================================================================
 
 Devices on SOCs often have mechanisms for placing devices into low-power
-states that are decoupled from the devices' own register blocks.  Sometimes,
+states that are decoupled from the devices's own register blocks.  Sometimes,
 this information is more complicated than a cell-index property can
 reasonably describe.  Thus, each device controlled in such a manner
 may contain a "sleep" property which describes these connections.
@@ -1366,7 +1375,9 @@ reasonably grouped in this manner, then create a virtual sleep controller
 (similar to an interrupt nexus, except that defining a standardized
 sleep-map should wait until its necessity is demonstrated).
 
+
 IX - Specifying dma bus information
+===================================
 
 Some devices may have DMA memory range shifted relatively to the beginning of
 RAM, or even placed outside of kernel RAM. For example, the Keystone 2 SoC
@@ -1417,6 +1428,7 @@ soc {
 		};
 };
 
+
 Appendix A - Sample SOC node for MPC8540
 ========================================
 
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
