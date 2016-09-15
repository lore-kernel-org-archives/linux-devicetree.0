From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/4] mmc: sh_mmcif: Document r7s72100 DT bindings
Date: Thu, 15 Sep 2016 15:34:04 -0400
Message-ID: <20160915193405.26943-4-chris.brandt@renesas.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160915193405.26943-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
index ff611fa..bf50a00 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
@@ -8,6 +8,7 @@ Required properties:
 
 - compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif" as a
   fallback. Examples with <soctype> are:
+	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
 	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
 	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
 	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
-- 
2.9.2
