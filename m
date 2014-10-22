From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: [PATCH 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan portal(s)
Date: Wed, 22 Oct 2014 09:09:30 -0500
Message-ID: <1413986972-621-2-git-send-email-Emilian.Medve@Freescale.com>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: scottwood@Freescale.com, galak@kernel.crashing.org, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Emil Medve <Emilian.Medve@Freescale.com>
List-Id: devicetree@vger.kernel.org

Portals are used by software running on processor cores, accelerators and
network interfaces to communicate with the BMan

Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
Change-Id: I6d245ffc14ba3d0e91d403ac7c3b91b75a9e6a95
---
 .../bindings/powerpc/fsl/bman-portals.txt          | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
new file mode 100644
index 0000000..40e607e
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
@@ -0,0 +1,50 @@
+QorIQ DPAA Buffer Manager Portals Device Tree Binding
+
+Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
+
+CONTENTS
+
+	- BMan Portal
+	- Example
+
+NOTE:	The bindings described in this document are preliminary and subject to
+	change
+
+BMan Portal Node
+
+PROPERTIES
+
+- compatible
+	Usage:		Required
+	Value type:	<stringlist>
+	Definition:	Must include "fsl,bman-portal-<hardware revision>"
+			May include "fsl,<SoC>-bman-portal" or "fsl,bman-portal"
+
+- reg
+	Usage:		Required
+	Value type:	<prop-encoded-array>
+	Definition:	Two regions. The first is the cache-enabled region of
+			the portal. The second is the cache-inhibited region of
+			the portal
+
+EXAMPLE
+
+The example below shows a (P4080) BMan portals container/bus node with two portals
+
+	bman-portals@ff4000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <0 0xf 0xf4000000 0x200000>;
+
+		bman-portal@0 {
+			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
+			reg = <0x0 0x4000 0x100000 0x1000>;
+			interrupts = <105 2 0 0>;
+		};
+		bman-portal@4000 {
+			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
+			reg = <0x4000 0x4000 0x101000 0x1000>;
+			interrupts = <107 2 0 0>;
+		};
+	};
-- 
2.1.2

