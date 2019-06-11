From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
Date: Tue, 11 Jun 2019 14:06:40 +0100
Message-ID: <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document RZ/G2M (R8A774A1) SoC in the Renesas TMU bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
index 13ad074..9dff7e5 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
@@ -10,6 +10,7 @@ Required Properties:
 
   - compatible: must contain one or more of the following:
     - "renesas,tmu-r8a7740" for the r8a7740 TMU
+    - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
     - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
     - "renesas,tmu-r8a7778" for the r8a7778 TMU
     - "renesas,tmu-r8a7779" for the r8a7779 TMU
-- 
2.7.4
