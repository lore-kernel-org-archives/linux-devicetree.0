Return-Path: <SRS0=wcnV=LM=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] dt-bindings: timer: ostm: Add R7S9210 support
Date: Wed, 29 Aug 2018 08:29:54 -0500
Message-Id: <20180829132954.64862-3-chris.brandt@renesas.com>
In-Reply-To: <20180829132954.64862-1-chris.brandt@renesas.com>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The R7S9210 belongs to the RZ/A2 SoC series

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,ostm.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
index be3ae0fdf775..81a78f8bcf17 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
@@ -9,7 +9,8 @@ Channels are independent from each other.
 Required Properties:
 
   - compatible: must be one or more of the following:
-    - "renesas,r7s72100-ostm" for the r7s72100 OSTM
+    - "renesas,r7s72100-ostm" for the R7S72100 (RZ/A1) OSTM
+    - "renesas,r7s9210-ostm" for the R7S9210 (RZ/A2) OSTM
     - "renesas,ostm" for any OSTM
 		This is a fallback for the above renesas,*-ostm entries
 
-- 
2.16.1
