Return-Path: <SRS0=qEOi=H5=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH 1/2] dt-bindings: arm: document Renesas V3HSK board bindings
References: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <24039c74-d6d3-cac3-6c68-5dcd88ef8ecc@cogentembedded.com>
Date: Thu, 10 May 2018 21:09:40 +0300
MIME-Version: 1.0
In-Reply-To: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Document the V3H Starter Kit device tree bindings, listing it as
a supported board.

This allows to use checkpatch.pl to validate .dts files referring to
the V3HSK board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -132,6 +132,8 @@ Boards:
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
     compatible = "renesas,stout", "renesas,r8a7790"
+  - V3HSK (Y-ASK-RCAR-V3H-WS10)
+    compatible = "renesas,v3hsk", "renesas,r8a77980"
   - V3MSK (Y-ASK-RCAR-V3M-WS10)
     compatible = "renesas,v3msk", "renesas,r8a77970"
   - Wheat (RTP0RC7792ASKB0000JE)
