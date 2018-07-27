Return-Path: <SRS0=Pf9O=KL=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Date: Fri, 27 Jul 2018 11:53:33 -0500
Message-Id: <20180727165333.60598-3-chris.brandt@renesas.com>
In-Reply-To: <20180727165333.60598-1-chris.brandt@renesas.com>
References: <20180727165333.60598-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/A2 (r7s9210) SoC.
Also document new option for "renesas,bsid"

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
* added "or Boundary Scan ID Register" to description
v2:
 * added Reviewed-by
 * added renesas,bsid comment
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 89b4a389fbc7..882fe5a71db8 100644
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
@@ -143,12 +145,12 @@ Boards:
     compatible = "renesas,wheat", "renesas,r8a7792"
 
 
-Most Renesas ARM SoCs have a Product Register that allows to retrieve SoC
-product and revision information.  If present, a device node for this register
-should be added.
+Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
+allows to retrieve SoC product and revision information.  If present, a device
+node for this register should be added.
 
 Required properties:
-  - compatible: Must be "renesas,prr".
+  - compatible: Must be "renesas,prr" or "renesas,bsid"
   - reg: Base address and length of the register block.
 
 
-- 
2.16.1
