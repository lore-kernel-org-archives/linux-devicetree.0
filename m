Return-Path: <SRS0=+qJk=MW=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
Date: Wed, 10 Oct 2018 07:37:13 -0500
Message-Id: <20181010123713.67541-4-chris.brandt@renesas.com>
In-Reply-To: <20181010123713.67541-1-chris.brandt@renesas.com>
References: <20181010123713.67541-1-chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document support for the RZ/A2 (R7S9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
 * Documented that R7S9210 has 2 clocks
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index d39d5e46f7d2..cdfbcce34b97 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -13,6 +13,7 @@ Required properties:
 - compatible: should contain one or more of the following:
 		"renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
 		"renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
+		"renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
 		"renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
 		"renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
 		"renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
@@ -54,7 +55,7 @@ Required properties:
 	  "core" and "cd". If the controller only has 1 clock, naming is not
 	  required.
 	  Devices which have more than 1 clock are listed below:
-	  2: R7S72100
+	  2: R7S72100, R7S9210
 
 Optional properties:
 - pinctrl-names: should be "default", "state_uhs"
-- 
2.16.1
