From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 8/9] devicetree: bindings: Remove deprecated properties
Date: Tue, 29 Aug 2017 11:34:26 +0200
Message-ID: <1503999271-15712-8-git-send-email-daniel.lezcano@linaro.org>
References: <20170829093354.GA2572@mai>
 <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

The deprecated DT properties are part of the GIT history,
no need to keep them around any longer.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index d79293a..6ca6b9e 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -36,16 +36,12 @@ Required Properties:
 		These are fallbacks for r8a73a4 and all the R-Car Gen2
 		entries	listed above.
 
-    - "renesas,cmt-48-gen2" is <deprecated>, use "renesas,cmt[01]-*" instead.
-
   - reg: base address and length of the registers block for the timer module.
   - interrupts: interrupt-specifier for the timer, one per channel.
   - clocks: a list of phandle + clock-specifier pairs, one for each entry
     in clock-names.
   - clock-names: must contain "fck" for the functional clock.
 
-  - renesas,channels-mask: <deprecated>, information kept in device driver.
-
 
 Example: R8A7790 (R-Car H2) CMT0 and CMT1 nodes
 
-- 
2.7.4
