From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/4] dt-bindings: memory: jz4780-nemc: Add compatible string for JZ4725B
Date: Wed, 22 Aug 2018 19:29:50 +0200
Message-ID: <20180822172953.11281-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alex Smith <alex@alex-smith.me.uk>
Cc: od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The jz4780-nemc driver was modified to be compatible with the JZ4725B
SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/memory-controllers/ingenic,jz4780-nemc.txt          | 1 +
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
2.18.0
