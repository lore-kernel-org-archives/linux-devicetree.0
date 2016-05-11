From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH v2.1] dt-bindings: Add Renesas R-Car FCP DT bindings
Date: Wed, 11 May 2016 15:36:30 +0300
Message-ID: <1462970190-588-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1461620198-13428-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461620198-13428-2-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The FCP is a companion module of video processing modules in the Renesas
R-Car Gen3 SoCs. It provides data compression and decompression, data
caching, and conversion of AXI transactions in order to reduce the
memory bandwidth.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 .../devicetree/bindings/media/renesas,fcp.txt      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
new file mode 100644
index 000000000000..6a12960609d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -0,0 +1,32 @@
+Renesas R-Car Frame Compression Processor (FCP)
+-----------------------------------------------
+
+The FCP is a companion module of video processing modules in the Renesas R-Car
+Gen3 SoCs. It provides data compression and decompression, data caching, and
+conversion of AXI transactions in order to reduce the memory bandwidth.
+
+There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
+for FDP (FCPF). Their configuration and behaviour depend on the module they
+are paired with. These DT bindings currently support the FCPV only.
+
+ - compatible: Must be one or more of the following
+
+   - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
+   - "renesas,fcpv" for generic compatible 'FCP for VSP'
+
+   When compatible with the generic version, nodes must list the
+   SoC-specific version corresponding to the platform first, followed by the
+   family-specific and/or generic versions.
+
+ - reg: the register base and size for the device registers
+ - clocks: Reference to the functional clock
+
+
+Device node example
+-------------------
+
+	fcpvd1: fcp@fea2f000 {
+		compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+		reg = <0 0xfea2f000 0 0x200>;
+		clocks = <&cpg CPG_MOD 602>;
+	};
-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
