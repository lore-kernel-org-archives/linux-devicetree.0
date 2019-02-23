From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 05/18] dt-bindings: timer: renesas, cmt: Document r8a774c0 CMT support
Date: Sat, 23 Feb 2019 14:06:53 +0100
Message-ID: <20190223130707.16704-5-daniel.lezcano@linaro.org>
References: <b5d75b05-b78c-535c-2b35-9a1f5a3a853f@linaro.org>
 <20190223130707.16704-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223130707.16704-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Document SoC specific bindings for RZ/G2E (r8a774c0) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 862a80f0380a..c0594450e9ef 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -32,6 +32,8 @@ Required Properties:
     - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
     - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
     - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in r8a774a1.
+    - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
+    - "renesas,r8a774c0-cmt1" for the 48-bit CMT1 device included in r8a774c0.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
-- 
2.17.1
