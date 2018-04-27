From: <sean.wang@mediatek.com>
Subject: [PATCH v2 3/6] dt-bindings: clock: mediatek: add entry for Mali-450 node to refer
Date: Fri, 27 Apr 2018 16:14:44 +0800
Message-ID: <082c3040e2be27d30e0642943f6df35ff4de5666.1524816502.git.sean.wang@mediatek.com>
References: <cover.1524816502.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1524816502.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com, robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Just add binding for a required clock referenced by Mali-450 on MT7623
or MT2701 SoC.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 include/dt-bindings/clock/mt2701-clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/mt2701-clk.h b/include/dt-bindings/clock/mt2701-clk.h
index 24e93df..2ac62a6 100644
--- a/include/dt-bindings/clock/mt2701-clk.h
+++ b/include/dt-bindings/clock/mt2701-clk.h
@@ -431,6 +431,10 @@
 #define CLK_ETHSYS_CRYPTO			8
 #define CLK_ETHSYS_NR				9
 
+/* G3DSYS */
+#define CLK_G3DSYS_CORE				1
+#define CLK_G3DSYS_NR				2
+
 /* BDP */
 
 #define CLK_BDP_BRG_BA				1
-- 
2.7.4
