From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/4] dt-bindings: memory: jz4780: Add compatible string for JZ4725B SoC
Date: Fri, 18 Jan 2019 12:13:26 -0300
Message-ID: <20190118151329.8040-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add a compatible string to support the memory controller built into the
JZ4725B SoC from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---

v2: No change

 .../devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
index f936b5589b19..7cce6d761f2d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
@@ -5,6 +5,7 @@ controller in Ingenic JZ4780
 
 Required properties:
 - compatible: Should be set to one of:
+    "ingenic,jz4725b-nemc" (JZ4725B)
     "ingenic,jz4780-nemc" (JZ4780)
 - reg: Should specify the NEMC controller registers location and length.
 - clocks: Clock for the NEMC controller.
-- 
2.11.0
