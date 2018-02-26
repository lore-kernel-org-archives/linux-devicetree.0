Return-Path: <SRS0=yOxS=FU=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: sh_mobile: Document R-Car M3-N support
Date: Mon, 26 Feb 2018 16:26:43 +0100
Message-Id: <1519658803-23177-1-git-send-email-geert+renesas@glider.be>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Document support for the IIC Bus Interface for DVFS (IIC for DVFS) in
the Renesas M3-N (r8a77965) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
index 224390999e817f33..fc7e178027467bcd 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
@@ -13,6 +13,7 @@ Required properties:
 			- "renesas,iic-r8a7794" (R-Car E2)
 			- "renesas,iic-r8a7795" (R-Car H3)
 			- "renesas,iic-r8a7796" (R-Car M3-W)
+			- "renesas,iic-r8a77965" (R-Car M3-N)
 			- "renesas,iic-sh73a0" (SH-Mobile AG5)
 			- "renesas,rcar-gen2-iic" (generic R-Car Gen2 or RZ/G1
 							compatible device)
-- 
2.7.4
