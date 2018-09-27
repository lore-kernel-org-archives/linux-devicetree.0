Return-Path: <SRS0=BnTV=MJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] dt-bindings: spi: rspi: Add R7S9210 support
Date: Thu, 27 Sep 2018 09:13:24 -0500
Message-Id: <20180927141324.103146-1-chris.brandt@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for RZ/A2

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
FYI: No driver changes were needed
---
 Documentation/devicetree/bindings/spi/spi-rspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rspi.txt b/Documentation/devicetree/bindings/spi/spi-rspi.txt
index 96fd58548f69..35d74de9e6fd 100644
--- a/Documentation/devicetree/bindings/spi/spi-rspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-rspi.txt
@@ -11,6 +11,7 @@ Required properties:
 		     Examples with soctypes are:
 		        - "renesas,rspi-sh7757" (SH)
 			- "renesas,rspi-r7s72100" (RZ/A1H)
+			- "renesas,rspi-r7s9210" (RZ/A2)
 			- "renesas,qspi-r8a7743" (RZ/G1M)
 			- "renesas,qspi-r8a7745" (RZ/G1E)
 			- "renesas,qspi-r8a7790" (R-Car H2)
-- 
2.16.1
