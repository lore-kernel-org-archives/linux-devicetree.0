Return-Path: <SRS0=Eo6U=FY=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] dt-bindings: pwm: renesas-tpu: Correct example TPU register block size
Date: Fri,  2 Mar 2018 15:39:44 +0100
Message-Id: <1520001585-12899-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1520001585-12899-1-git-send-email-geert+renesas@glider.be>
References: <1520001585-12899-1-git-send-email-geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The Timer Pulse Unit on R-Mobile A1 has registers that lie outside the
declared register block.  Enlarge the register block size to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <simon.horman@netronome.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
index 1aadc804dae4e30b..641b5b4c648340ee 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
@@ -22,6 +22,6 @@ Example: R8A7740 (R-Car A1) TPU controller node
 
 	tpu: pwm@e6600000 {
 		compatible = "renesas,tpu-r8a7740", "renesas,tpu";
-		reg = <0xe6600000 0x100>;
+		reg = <0xe6600000 0x148>;
 		#pwm-cells = <3>;
 	};
-- 
2.7.4
