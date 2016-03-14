From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 06/06] devicetree: bindings: Remove deprecated properties
Date: Mon, 14 Mar 2016 23:24:45 +0900
Message-ID: <20160314142445.17180.59134.sendpatchset@little-apple>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160314142342.17180.21352.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

The deprecated DT properties are part of the GIT history,
no need to keep them around any longer.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

 Changes since V3:
 - None

 Changes since V2:
 - Added Acked-by from Rob
 - Fixed properties typo - Thanks Geert
 - Added Acked-by from Geert

 Changes since V1:
 - New patch

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    4 ----
 1 file changed, 4 deletions(-)

--- 0007/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2016-03-14 22:49:53.260513000 +0900
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
 
