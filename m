From: andy.tang@nxp.com
Subject: [PATCH 1/2] dt-bindings: qoriq-clock: add more PLL divider clocks support
Date: Mon, 22 Apr 2019 17:15:08 +0800
Message-ID: <20190422091509.3181-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

More PLL divider clocks are needed by clock consumer IP. So update
the PLL divider description to make it more general.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
 .../devicetree/bindings/clock/qoriq-clock.txt      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index c655f28..27aeed0 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -83,8 +83,8 @@ second cell is the clock index for the specified type.
 	1	cmux		index (n in CLKCnCSR)
 	2	hwaccel		index (n in CLKCGnHWACSR)
 	3	fman		0 for fm1, 1 for fm2
-	4	platform pll	0=pll, 1=pll/2, 2=pll/3, 3=pll/4
-				4=pll/5, 5=pll/6, 6=pll/7, 7=pll/8
+	4	platform pll	n=pll/(n+1). For example, when n=1,
+				that means output_freq=PLL_freq/2.
 	5	coreclk		must be 0
 
 3. Example
-- 
1.7.1
