Return-Path: <SRS0=oLYD=QI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/5] dt-bindings: timer: renesas: tmu: Document r8a774c0 bindings
Date: Fri,  1 Feb 2019 10:10:40 +0000
Message-Id: <1549015841-33536-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com>
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document RZ/G2E (R8A774C0) SoC in the Renesas TMU bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
index 4ddff85..13ad074 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
@@ -10,6 +10,7 @@ Required Properties:
 
   - compatible: must contain one or more of the following:
     - "renesas,tmu-r8a7740" for the r8a7740 TMU
+    - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
     - "renesas,tmu-r8a7778" for the r8a7778 TMU
     - "renesas,tmu-r8a7779" for the r8a7779 TMU
     - "renesas,tmu-r8a77970" for the r8a77970 TMU
-- 
2.7.4
