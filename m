From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
Date: Tue, 20 Aug 2019 21:35:36 +0900
Message-ID: <156630453593.17444.15839904958810436985.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen3 D3 (r8a77995) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0006/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 18:25:04.331001914 +0900
@@ -53,6 +53,8 @@ Required Properties:
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
     - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
     - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
+    - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
+    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
     - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
