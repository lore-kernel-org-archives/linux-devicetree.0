From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3] mmc: sh_mmcif: Document r7s72100 DT bindings
Date: Wed, 11 Jan 2017 23:14:52 -0500
Message-ID: <20170112041452.14136-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

---
v3:
* added list of how many interrupts each SOC has
v2:
* added interrupt description
---
 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
index e4ba92aa..c32dc5a 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
@@ -8,6 +8,7 @@ Required properties:
 
 - compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif" as a
   fallback. Examples with <soctype> are:
+	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
 	- "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
 	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
 	- "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
@@ -17,6 +18,13 @@ Required properties:
 	- "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
 	- "renesas,mmcif-sh73a0" for the MMCIF found in sh73a0 SoCs
 
+- interrupts: Some SoCs have only 1 shared interrupt, while others have either
+  2 or 3 individual interrupts (error, int, card detect). Below is the number
+  of interrupts for each SoC:
+    1: r8a73a4, r8a7778, r8a7790, r8a7791, r8a7793, r8a7794
+    2: r8a7740, sh73a0
+    3: r7s72100
+
 - clocks: reference to the functional clock
 
 - dmas: reference to the DMA channels, one per channel name listed in the
-- 
2.10.1
