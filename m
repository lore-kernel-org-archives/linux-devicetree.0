Return-Path: <SRS0=5vdW=MI=renesas.com=chris.paterson2@kernel.org>
From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH] ARM: dts: iwg20d-q7-dbcm-ca: Improve model string
Date: Wed, 26 Sep 2018 11:01:22 +0100
Message-Id: <1537956082-17542-1-git-send-email-chris.paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <chris.paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Update the model string for this platform configuration and fix the
grammar at the same time.

This brings the syntax in line with the RZ/G1E iWave board.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
Perhaps this patch isn't really needed, but the current string annoys me.

Patch applies cleanly to renesas-devel-20180925-v4.19-rc5.
---
 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
index 0d006aea99da1b40..6811ddc4af6460ce 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
@@ -11,7 +11,7 @@
 #include "iwg20d-q7-dbcm-ca.dtsi"
 
 / {
-	model = "iW-RainboW-G20D-Q7 RZ/G1M based plus camera daughter board";
+	model = "iWave RainboW-G20D-Q7 RZ/G1M based board with camera add-on";
 	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
 };
 
-- 
1.9.1
