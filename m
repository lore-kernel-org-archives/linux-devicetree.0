From: slemieux.tyco@gmail.com
Subject: [PATCH 2/2] dt-bindings: clock: add lpc32xx clock frequency output
Date: Tue,  9 Feb 2016 13:47:50 -0500
Message-ID: <1455043670-19025-2-git-send-email-slemieux.tyco@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com
Cc: stigge@antcom.de, vz@mleia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux@tycoint.com>

This patch add an optional parameter to setup the
xtal clock frequency output.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
index 20cbca3..ce51759 100644
--- a/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
+++ b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
@@ -10,6 +10,9 @@ Required properties:
 - clock-names: list of external oscillator clock names, must contain
   "xtal_32k" and may have optional "xtal"
 
+Optional properties:
+- xtal,clock-output-frequency: define the "xtal" clock frequency output in Hz
+
 Examples:
 
 	/* System Control Block */
-- 
1.8.3.1

