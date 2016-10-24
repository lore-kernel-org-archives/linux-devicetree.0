From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH v4.1 2/4] dt-bindings: Add Renesas R-Car FDP1 bindings
Date: Mon, 24 Oct 2016 14:47:21 +0300
Message-ID: <1477309641-14369-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1477299818-31935-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477299818-31935-3-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran+renesas-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>

The FDP1 is a de-interlacing module which converts interlaced video to
progressive video. It is also capable of performing pixel format conversion
between YCbCr/YUV formats and RGB formats.

Signed-off-by: Kieran Bingham <kieran+renesas-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
Changes since v4:

- Rewrote the power-domains property documentation
- Added a reference to the clocks and power domains providers
- Made the renesas,fcp property optional on Gen2
---
 .../devicetree/bindings/media/renesas,fdp1.txt     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt

diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.txt b/Documentation/devicetree/bindings/media/renesas,fdp1.txt
new file mode 100644
index 000000000000..8dd1007bb573
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,fdp1.txt
@@ -0,0 +1,37 @@
+Renesas R-Car Fine Display Processor (FDP1)
+-------------------------------------------
+
+The FDP1 is a de-interlacing module which converts interlaced video to
+progressive video. It is capable of performing pixel format conversion between
+YCbCr/YUV formats and RGB formats. Only YCbCr/YUV formats are supported as
+an input to the module.
+
+Required properties:
+
+ - compatible: must be "renesas,fdp1"
+ - reg: the register base and size for the device registers
+ - interrupts : interrupt specifier for the FDP1 instance
+ - clocks: reference to the functional clock
+
+Optional properties:
+
+ - power-domains: reference to the power domain that the FDP1 belongs to, if
+                  any.
+ - renesas,fcp: a phandle referencing the FCP that handles memory accesses
+                for the FDP1. Not needed on Gen2, mandatory on Gen3.
+
+Please refer to the binding documentation for the clock and/or power domain
+providers for more details.
+
+
+Device node example
+-------------------
+
+	fdp1@fe940000 {
+		compatible = "renesas,fdp1";
+		reg = <0 0xfe940000 0 0x2400>;
+		interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 119>;
+		power-domains = <&sysc R8A7795_PD_A3VP>;
+		renesas,fcp = <&fcpf0>;
+	};
-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
