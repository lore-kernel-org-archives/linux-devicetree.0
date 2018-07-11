Return-Path: <SRS0=m83C=J3=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] clk: renesas: mstp: Document R7S9210 support
Date: Wed, 11 Jul 2018 12:03:13 -0500
Message-Id: <20180711170313.80321-3-chris.brandt@renesas.com>
In-Reply-To: <20180711170313.80321-1-chris.brandt@renesas.com>
References: <20180711170313.80321-1-chris.brandt@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Renesas R7S9210 SoC also has the CPG MSTP clocks.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
index da578ebdda28..bb470d9bc07f 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
@@ -11,6 +11,7 @@ Required Properties:
 
   - compatible: Must be one of the following
     - "renesas,r7s72100-mstp-clocks" for R7S72100 (RZ) MSTP gate clocks
+    - "renesas,r7s9210-mstp-clocks" for R7S9210 (RZ A2) MSTP gate clocks
     - "renesas,r8a73a4-mstp-clocks" for R8A73A4 (R-Mobile APE6) MSTP gate clocks
     - "renesas,r8a7740-mstp-clocks" for R8A7740 (R-Mobile A1) MSTP gate clocks
     - "renesas,r8a7778-mstp-clocks" for R8A7778 (R-Car M1) MSTP gate clocks
-- 
2.16.1
