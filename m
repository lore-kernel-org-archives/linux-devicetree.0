From: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3] powerpc/fsl: Added binding for Freescale CoreNet coherency fabric (CCF)
Date: Mon, 5 May 2014 18:58:19 +0300
Message-ID: <1399305499-6612-1-git-send-email-diana.craciun@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

The CoreNet coherency fabric is a fabric-oriented, conectivity
infrastructure that enables the implementation of coherent, multicore
systems. The CCF acts as a central interconnect for cores,
platform-level caches, memory subsystem, peripheral devices and I/O host
bridges in the system.

Signed-off-by: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
v3:
	- added port ID mapping
	- removed fsl,corenetx-cf

 .../devicetree/bindings/powerpc/fsl/ccf.txt        | 42 ++++++++++++++++++++++
 .../devicetree/bindings/powerpc/fsl/cpus.txt       |  8 +++++
 .../devicetree/bindings/powerpc/fsl/pamu.txt       |  8 +++++
 3 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/ccf.txt

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
new file mode 100644
index 0000000..1263c29
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
@@ -0,0 +1,42 @@
+Freescale CoreNet Coherency Fabric(CCF) Device Tree Binding
+
+DESCRIPTION
+
+The CoreNet coherency fabric is a fabric-oriented, connectivity infrastructure
+that enables the implementation of coherent, multicore systems.
+
+Required properties:
+
+- compatible : <string>
+		fsl,corenet1-cf - CoreNet coherency fabric version 1. Example chips: T4240,
+		B4860
+		fsl,corenet2-cf - CoreNet coherency fabric version 2. Example chips: P5020,
+		P4080, P3041, P2041
+		fsl,corenet-cf - It is used to represent the common registers between
+		CCF version 1 and CCF version 2. This compatible is retained for
+		compatibility reasons as it was already used for both CCF version 1 chips
+		and CCF version 2 chips.
+
+- reg : <prop-encoded-array>
+		A standard property. Represents the CCF registers.
+
+- interrupts : <prop-encoded-array>
+		Interrupt mapping for CCF error interrupt.
+
+- fsl,ccf-num-csdids: <u32>
+		Specifies the number of Coherency Subdomain ID Port Mapping
+		Registers that are supported by the CCF.
+
+- fsl,ccf-num-snoopids: <u32>
+		Specifies the number of Snoop ID Port Mapping Registers that
+		are supported by CCF.
+
+Example:
+
+	corenet-cf@18000 {
+		compatible = "fsl,corenet2-cf", "fsl,corenet-cf";
+		reg = <0x18000 0x1000>;
+		interrupts = <16 2 1 31>;
+		fsl,ccf-num-csdids = <32>;
+		fsl,ccf-num-snoopids = <32>;
+	};
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt
index 922c30a..09dbc5f 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt
@@ -20,3 +20,11 @@ PROPERTIES
 	a property named fsl,eref-[CAT], where [CAT] is the abbreviated category
 	name with all uppercase letters converted to lowercase, indicates that
 	the category is supported by the implementation.
+
+	- fsl,portid-mapping : <u32>
+	The Coherency Subdomain ID Port Mapping Registers and Snoop ID Port Mapping
+	registers which are part of the CoreNet Coherency fabric (CCF) provide a
+	CoreNet Coherency Subdomain ID/CoreNet Snoop ID to cpu mapping functions.
+	Certain bits from these registers should be set if the coresponding CPU
+	should be snooped. This property defines a bitmask which selects the bit that
+	should be set if this cpu should be snooped.
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt b/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt
index 1f5e329..827c637 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt
@@ -26,6 +26,13 @@ Required properties:
 		  A standard property.
 - #size-cells	: <u32>
 		  A standard property.
+- fsl,portid-mapping : <u32>
+	The Coherency Subdomain ID Port Mapping Registers and Snoop ID Port Mapping
+	registers which are part of the CoreNet Coherency fabric (CCF) provide a
+	CoreNet Coherency Subdomain ID/CoreNet Snoop ID to pamu mapping functions.
+	Certain bits from these registers should be set if PAMUs should be snooped.
+	This property defines a bitmask which selects the bits that should be set
+	if PAMUs should be snooped.
 
 Optional properties:
 - reg		: <prop-encoded-array>
@@ -88,6 +95,7 @@ Example:
 		compatible = "fsl,pamu-v1.0", "fsl,pamu";
 		reg = <0x20000 0x5000>;
 		ranges = <0 0x20000 0x5000>;
+		fsl,portid-mapping = <0xf80000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		interrupts = <
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
