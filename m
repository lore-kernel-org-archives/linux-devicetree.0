Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Date: Wed, 25 Jul 2018 16:22:20 -0500
Message-Id: <20180725212220.44525-4-chris.brandt@renesas.com>
In-Reply-To: <20180725212220.44525-1-chris.brandt@renesas.com>
References: <20180725212220.44525-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/A2 (r7s9210) SoC.
Also document new option for "renesas,bsid"

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
 * added Reviewed-by
 * added renesas,bsid comment
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 89b4a389fbc7..1b2e32171924 100644
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
@@ -148,7 +150,7 @@ product and revision information.  If present, a device node for this register
 should be added.
 
 Required properties:
-  - compatible: Must be "renesas,prr".
+  - compatible: Must be "renesas,prr" or "renesas,bsid"
   - reg: Base address and length of the register block.
 
 
-- 
2.16.1
