Return-Path: <SRS0=eFPy=R4=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] dt-bindings: media: Renesas R-Car IMR bindings
Message-ID: <b2964da9-4389-b277-0e6f-df41f39326b7@cogentembedded.com>
Date: Mon, 25 Mar 2019 21:14:00 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

The image renderer (IMR), or the distortion correction engine, is a
drawing processor with a simple instruction system capable of referencing
video capture data or data in an external memory as the 2D texture data
and performing texture mapping and drawing with respect to any shape that
is split into triangular objects.

Document  the device tree bindings for the image renderer light extended 4
(IMR-LX4) found in the R-Car gen3 SoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Rob Herring <robh@kernel.org>

---
This patch is against the 'master' branch of the 'media_tree.git' repo.

This patch has been split from the large IMR driver patch (which would need
much more work), it fixes checkpatch.pl's warnings on the SoC .dtsi files
which have been already merged (the bindings didn't change since v1 of the
driver patch).

Documentation/devicetree/bindings/media/rcar_imr.txt |   27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

Index: media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
===================================================================
--- /dev/null
+++ media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
@@ -0,0 +1,27 @@
+Renesas R-Car Image Renderer (Distortion Correction Engine)
+-----------------------------------------------------------
+
+The image renderer, or the distortion correction engine, is a drawing processor
+with a simple instruction system capable of referencing video capture data or
+data in an external memory as 2D texture data and performing texture mapping
+and drawing with respect to any shape that is split into triangular objects.
+
+Required properties:
+
+- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a fallback for
+  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
+  where the examples with <soctype> are:
+  - "renesas,r8a7795-imr-lx4" for R-Car H3,
+  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.
+- reg: offset and length of the register block;
+- interrupts: single interrupt specifier;
+- clocks: single clock phandle/specifier pair.
+
+Example:
+
+	imr-lx4@fe860000 {
+		compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
+		reg = <0 0xfe860000 0 0x2000>;
+		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 823>;
+	};
