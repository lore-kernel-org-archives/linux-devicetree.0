From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt-bindings: clock: jz4725b-cgu: Add UDC PHY clock
Date: Tue, 19 Mar 2019 15:05:35 +0100
Message-ID: <20190319140536.27945-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add macro for the UDC PHY clock of the JZ4725B.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/dt-bindings/clock/jz4725b-cgu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/jz4725b-cgu.h b/include/dt-bindings/clock/jz4725b-cgu.h
index 460bbeff6ab8..31f1ab0fe42c 100644
--- a/include/dt-bindings/clock/jz4725b-cgu.h
+++ b/include/dt-bindings/clock/jz4725b-cgu.h
@@ -31,5 +31,6 @@
 #define JZ4725B_CLK_TCU		22
 #define JZ4725B_CLK_EXT512	23
 #define JZ4725B_CLK_RTC		24
+#define JZ4725B_CLK_UDC_PHY	25
 
 #endif /* __DT_BINDINGS_CLOCK_JZ4725B_CGU_H__ */
-- 
2.11.0
