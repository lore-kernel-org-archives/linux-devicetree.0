From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 11/25] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT support
Date: Tue, 18 Dec 2018 22:28:29 +0100
Message-ID: <20181218212844.30445-11-daniel.lezcano@linaro.org>
References: <d3f1255a-592d-13d9-5d3f-bd3ec7a36742@linaro.org>
 <20181218212844.30445-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218212844.30445-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Document SoC specific compatible strings for r8a77470. No driver change
is needed as the fallback strings will activate the right code.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 6de27b60b51a..eb602c599341 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -28,6 +28,8 @@ Required Properties:
     - "renesas,r8a7744-cmt1" for the 48-bit CMT1 device included in r8a7744.
     - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
     - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
+    - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a77470.
+    - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
-- 
2.17.1
