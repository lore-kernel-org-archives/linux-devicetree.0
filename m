From: <sean.wang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: clock: mediatek: add binding for fixed-factor clock axisel_d4
Date: Thu, 1 Mar 2018 11:27:50 +0800
Message-ID: <cd26a3bdc9f29e237089395fbba93e28549ddf25.1519874655.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com, robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Just add binding for a fixed-factor clock axisel_d4, which would be
referenced by PWM devices on MT7623 or MT2701 SoC.

Cc: stable@vger.kernel.org
Fixes: 1de9b21633d6 ("clk: mediatek: Add dt-bindings for MT2701 clocks")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
---
 include/dt-bindings/clock/mt2701-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt2701-clk.h b/include/dt-bindings/clock/mt2701-clk.h
index 551f760..24e93df 100644
--- a/include/dt-bindings/clock/mt2701-clk.h
+++ b/include/dt-bindings/clock/mt2701-clk.h
@@ -176,7 +176,8 @@
 #define CLK_TOP_AUD_EXT1			156
 #define CLK_TOP_AUD_EXT2			157
 #define CLK_TOP_NFI1X_PAD			158
-#define CLK_TOP_NR				159
+#define CLK_TOP_AXISEL_D4			159
+#define CLK_TOP_NR				160
 
 /* APMIXEDSYS */
 
-- 
2.7.4
