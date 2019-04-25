Return-Path: <SRS0=UBGr=S3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:23804 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfDYBZd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Apr 2019 21:25:33 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 5/5] dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
Date: Thu, 25 Apr 2019 10:25:17 +0900
Message-Id: <1556155517-5054-6-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, geert+renesas@glider.be, broonie@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Document the R-Car H3/M3-W/M3-N (R8A779{5|6|65}) SoC in the Renesas TPU bindings.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
index 848a92b..054ce4a 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
@@ -9,6 +9,9 @@ Required Properties:
     - "renesas,tpu-r8a7744": for R8A7744 (RZ/G1N) compatible PWM controller.
     - "renesas,tpu-r8a7745": for R8A7745 (RZ/G1E) compatible PWM controller.
     - "renesas,tpu-r8a7790": for R8A7790 (R-Car H2) compatible PWM controller.
+    - "renesas,tpu-r8a7795": for R8A7795 (R-Car H3) compatible PWM controller.
+    - "renesas,tpu-r8a7796": for R8A7796 (R-Car M3-W) compatible PWM controller.
+    - "renesas,tpu-r8a77965": for R8A77965 (R-Car M3-N) compatible PWM controller.
     - "renesas,tpu-r8a77970": for R8A77970 (R-Car V3M) compatible PWM
 			      controller.
     - "renesas,tpu-r8a77980": for R8A77980 (R-Car V3H) compatible PWM
-- 
2.7.4
