From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/4] dt-bindings: memory: jz4780: Add compatible string for JZ4740 SoC
Date: Tue,  5 Feb 2019 00:52:37 -0300
Message-ID: <20190205035240.31410-2-paul@crapouillou.net>
References: <20190205035240.31410-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205035240.31410-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add a compatible string to support the memory controller built into the
JZ4740 SoC from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v2: No change

v3: Change compatible string for jz4740 instead of j4725b

 .../devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
index f936b5589b19..59b8dcc118ee 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
@@ -5,6 +5,7 @@ controller in Ingenic JZ4780
 
 Required properties:
 - compatible: Should be set to one of:
+    "ingenic,jz4740-nemc" (JZ4740)
     "ingenic,jz4780-nemc" (JZ4780)
 - reg: Should specify the NEMC controller registers location and length.
 - clocks: Clock for the NEMC controller.
-- 
2.11.0
