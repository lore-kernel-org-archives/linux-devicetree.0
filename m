From: <gabriel.fernandez@st.com>
Subject: [PATCH] dt-bindings: clock: remove unused definition for stm32mp1
Date: Wed, 13 Feb 2019 11:07:14 +0100
Message-ID: <20190213100714.15622-1-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

LTDC_K and ETHMAC_K are not used.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 include/dt-bindings/clock/stm32mp1-clks.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
index 90ec780bfc68..4cdaf135829c 100644
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ b/include/dt-bindings/clock/stm32mp1-clks.h
@@ -248,7 +248,4 @@
 
 #define STM32MP1_LAST_CLK 232
 
-#define LTDC_K		LTDC_PX
-#define ETHMAC_K	ETHCK_K
-
 #endif /* _DT_BINDINGS_STM32MP1_CLKS_H_ */
-- 
2.17.0
