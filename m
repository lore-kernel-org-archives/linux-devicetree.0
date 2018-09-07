Return-Path: <SRS0=NUHq=LV=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0
 bindings
Message-ID: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
Date: Fri, 7 Sep 2018 23:02:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
the TMU hardware in those is the Renesas standard 3-channel timer unit.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'tip.git' repo's 'timers/core' branch.

 Documentation/devicetree/bindings/timer/renesas,tmu.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: tip/Documentation/devicetree/bindings/timer/renesas,tmu.txt
===================================================================
--- tip.orig/Documentation/devicetree/bindings/timer/renesas,tmu.txt
+++ tip/Documentation/devicetree/bindings/timer/renesas,tmu.txt
@@ -12,6 +12,8 @@ Required Properties:
     - "renesas,tmu-r8a7740" for the r8a7740 TMU
     - "renesas,tmu-r8a7778" for the r8a7778 TMU
     - "renesas,tmu-r8a7779" for the r8a7779 TMU
+    - "renesas,tmu-r8a77970" for the r8a77970 TMU
+    - "renesas,tmu-r8a77980" for the r8a77980 TMU
     - "renesas,tmu" for any TMU.
       This is a fallback for the above renesas,tmu-* entries
 
