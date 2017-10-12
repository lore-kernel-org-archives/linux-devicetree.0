From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rz: clk-rz is meant for RZ/A1
Date: Thu, 12 Oct 2017 11:37:48 +0200
Message-ID: <1507801068-12024-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The RZ family of Renesas SoCs has several different subfamilies (RZ/A,
RZ/G, RZ/N, and RZ/T).  Clarify that the renesas,rz-cpg-clocks DT
bindings and clk-rz driver apply to RZ/A1 only.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.15.

 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt | 4 ++--
 drivers/clk/renesas/clk-rz.c                                      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
index bb5d942075fbf0bf..8ff3e2774ed8d1d0 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
@@ -1,6 +1,6 @@
-* Renesas RZ Clock Pulse Generator (CPG)
+* Renesas RZ/A1 Clock Pulse Generator (CPG)
 
-The CPG generates core clocks for the RZ SoCs. It includes the PLL, variable
+The CPG generates core clocks for the RZ/A1 SoCs. It includes the PLL, variable
 CPU and GPU clocks, and several fixed ratio dividers.
 The CPG also provides a Clock Domain for SoC devices, in combination with the
 CPG Module Stop (MSTP) Clocks.
diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index 5adb934326d1f5be..127c58135c8fec76 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -1,5 +1,5 @@
 /*
- * rz Core CPG Clocks
+ * RZ/A1 Core CPG Clocks
  *
  * Copyright (C) 2013 Ideas On Board SPRL
  * Copyright (C) 2014 Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
-- 
2.7.4

