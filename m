From: <gabriel.fernandez@st.com>
Subject: [PATCH 6/6] clk: stm32mp1: remove ck_apb_dbg clock
Date: Fri, 6 Apr 2018 08:39:33 +0200
Message-ID: <1522996773-24129-7-git-send-email-gabriel.fernandez@st.com>
References: <1522996773-24129-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522996773-24129-1-git-send-email-gabriel.fernandez@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: devicetree@vger.kernel.org, benjamin GAIGNARD <benjamin.gaignard@st.com>, Loic PALLARDY <loic.pallardy@st.com>, olivier.bideau@st.com, linux-kernel@vger.kernel.org, gabriel.fernandez.st@gmail.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

It's recommended to use only clk_sys_dbg clock instead to activate
debug IP.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/clk-stm32mp1.c                | 4 ----
 include/dt-bindings/clock/stm32mp1-clks.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index b7b5361..edd3cf4 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1988,10 +1988,6 @@ enum {
 		  _DIV(RCC_MCO2CFGR, 4, 4, 0, NULL)),
 
 	/* Debug clocks */
-	FIXED_FACTOR(NO_ID, "ck_axi_div2", "ck_axi", 0, 1, 2),
-
-	GATE(DBG, "ck_apb_dbg", "ck_axi_div2", 0, RCC_DBGCFGR, 8, 0),
-
 	GATE(CK_DBG, "ck_sys_dbg", "ck_axi", 0, RCC_DBGCFGR, 8, 0),
 
 	COMPOSITE(CK_TRACE, "ck_trace", ck_trace_src, CLK_OPS_PARENT_ENABLE,
diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
index 6c807fd..90ec780 100644
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ b/include/dt-bindings/clock/stm32mp1-clks.h
@@ -229,7 +229,6 @@
 #define CK_MCO2		212
 
 /* TRACE & DEBUG clocks */
-#define DBG		213
 #define CK_DBG		214
 #define CK_TRACE	215
 
-- 
1.9.1
