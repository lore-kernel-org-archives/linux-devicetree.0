Return-Path: <SRS0=Eo6U=FY=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] dt-bindings: pwm: renesas-tpu: Correct SoC part numbers and family names
Date: Fri,  2 Mar 2018 15:39:45 +0100
Message-Id: <1520001585-12899-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1520001585-12899-1-git-send-email-geert+renesas@glider.be>
References: <1520001585-12899-1-git-send-email-geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

R8A73A4 (not R8A77A4) is R-Mobile APE6,
R8A7740 is R-Mobile (not R-Car) A1.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
index 641b5b4c648340ee..fb633129d845a893 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
@@ -3,7 +3,7 @@
 Required Properties:
 
   - compatible: should be one of the following.
-    - "renesas,tpu-r8a73a4": for R8A77A4 (R-Mobile APE6) compatible PWM controller.
+    - "renesas,tpu-r8a73a4": for R8A73A4 (R-Mobile APE6) compatible PWM controller.
     - "renesas,tpu-r8a7740": for R8A7740 (R-Mobile A1) compatible PWM controller.
     - "renesas,tpu-r8a7790": for R8A7790 (R-Car H2) compatible PWM controller.
     - "renesas,tpu": for generic R-Car TPU PWM controller.
@@ -18,7 +18,7 @@ Required Properties:
 Please refer to pwm.txt in this directory for details of the common PWM bindings
 used by client devices.
 
-Example: R8A7740 (R-Car A1) TPU controller node
+Example: R8A7740 (R-Mobile A1) TPU controller node
 
 	tpu: pwm@e6600000 {
 		compatible = "renesas,tpu-r8a7740", "renesas,tpu";
-- 
2.7.4
