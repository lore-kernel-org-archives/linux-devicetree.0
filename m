From: <gabriel.fernandez@st.com>
Subject: [PATCH v2] dt-bindings: clock: remove unused definition for stm32mp1
Date: Thu, 14 Feb 2019 11:42:42 +0100
Message-ID: <20190214104242.1491-1-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

A copy of LTDC_PX and ETHCK_K (LTDC_K and ETHMAC_K) was introduced in
stm32mp1 dt-bindings file by mistake.
These bindings are not used and shouldn't be use to be conform with
convention name of the stm32mp1 clock IP.

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
