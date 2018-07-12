Return-Path: <SRS0=LrHL=J4=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Date: Wed, 11 Jul 2018 22:01:49 -0500
Message-Id: <20180712030149.91385-3-chris.brandt@renesas.com>
In-Reply-To: <20180712030149.91385-1-chris.brandt@renesas.com>
References: <20180712030149.91385-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/A2 (r7s9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 89b4a389fbc7..7288c2081cd5 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -7,6 +7,8 @@ SoCs:
     compatible = "renesas,emev2"
   - RZ/A1H (R7S72100)
     compatible = "renesas,r7s72100"
+  - RZ/A2 (R7S9210)
+    compatible = "renesas,r7s9210"
   - SH-Mobile AG5 (R8A73A00/SH73A0)
     compatible = "renesas,sh73a0"
   - R-Mobile APE6 (R8A73A40)
-- 
2.16.1
