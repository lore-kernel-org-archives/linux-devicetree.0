Return-Path: <SRS0=hMgQ=L2=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: timer: renesas: cmt: document R-Car gen3
 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Message-ID: <42923b22-9ce9-b9cc-c569-0e364b63b783@cogentembedded.com>
Date: Wed, 12 Sep 2018 23:15:28 +0300
MIME-Version: 1.0
In-Reply-To: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Document support for the R-Car gen3 CMT types 0/1 bindings -- they seem
to be the same CMT types 0/1 as in the R-Car gen2 SoCs.

Also document R8A779{7|8}0 bindings as these are the R-Car gen3 SoCs for
which the initial support was done.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch, split from the next one.

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    7 +++++++
 1 file changed, 7 insertions(+)

Index: tip/Documentation/devicetree/bindings/timer/renesas,cmt.txt
===================================================================
--- tip.orig/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ tip/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -34,6 +34,10 @@ Required Properties:
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
+    - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
+    - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
+    - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
+    - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
 
     - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
 		and RZ/G1.
@@ -41,6 +45,9 @@ Required Properties:
 		and RZ/G1.
 		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
 		listed above.
+    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3.
+    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3.
+		These are fallbacks for R-Car Gen3 entries listed above.
 
   - reg: base address and length of the registers block for the timer module.
   - interrupts: interrupt-specifier for the timer, one per channel.
