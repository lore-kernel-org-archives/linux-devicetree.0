From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
Date: Tue, 20 Aug 2019 21:35:25 +0900
Message-ID: <156630452545.17444.4277682052018128256.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen2 V2H (r8a7792) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0004/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 18:23:48.256013425 +0900
@@ -35,6 +35,8 @@ Required Properties:
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
     - "renesas,r8a7791-cmt1" for the 48-bit CMT1 device included in r8a7791.
+    - "renesas,r8a7792-cmt0" for the 32-bit CMT0 device included in r8a7792.
+    - "renesas,r8a7792-cmt1" for the 48-bit CMT1 device included in r8a7792.
     - "renesas,r8a7793-cmt0" for the 32-bit CMT0 device included in r8a7793.
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
