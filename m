From: <gabriel.fernandez@st.com>
Subject: [PATCH v2 11/12] clk: stm32mp1: add MCO clocks
Date: Thu, 8 Mar 2018 17:54:04 +0100
Message-ID: <1520528045-18330-12-git-send-email-gabriel.fernandez@st.com>
References: <1520528045-18330-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1520528045-18330-1-git-send-email-gabriel.fernandez@st.com>
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

Two micro-controller clock output (MCO) pins are available:
MCO1 and MCO2.
For each output, it is possible to select a clock source.
The selected clock can be divided thanks to configurable
prescaler.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/clk-stm32mp1.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 51e3e76..b3a6ec4 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -252,6 +252,14 @@
 	"off", "ck_lse", "ck_lsi", "ck_hse_rtc"
 };
 
+static const char * const mco1_src[] = {
+	"ck_hsi", "ck_hse", "ck_csi", "ck_lsi", "ck_lse"
+};
+
+static const char * const mco2_src[] = {
+	"ck_mpu", "ck_axi", "ck_mcu", "pll4_p", "ck_hse", "ck_hsi"
+};
+
 static const struct clk_div_table axi_div_table[] = {
 	{ 0, 1 }, { 1, 2 }, { 2, 3 }, { 3, 4 },
 	{ 4, 4 }, { 5, 4 }, { 6, 4 }, { 7, 4 },
@@ -1960,6 +1968,18 @@ enum {
 		  _MUX(RCC_BDCR, 16, 2, 0),
 		  _NO_DIV),
 
+	/* MCO clocks */
+	COMPOSITE(CK_MCO1, "ck_mco1", mco1_src, CLK_OPS_PARENT_ENABLE |
+		  CLK_SET_RATE_NO_REPARENT,
+		  _GATE(RCC_MCO1CFGR, 12, 0),
+		  _MUX(RCC_MCO1CFGR, 0, 3, 0),
+		  _DIV(RCC_MCO1CFGR, 4, 4, 0, NULL)),
+
+	COMPOSITE(CK_MCO2, "ck_mco2", mco2_src, CLK_OPS_PARENT_ENABLE |
+		  CLK_SET_RATE_NO_REPARENT,
+		  _GATE(RCC_MCO2CFGR, 12, 0),
+		  _MUX(RCC_MCO2CFGR, 0, 3, 0),
+		  _DIV(RCC_MCO2CFGR, 4, 4, 0, NULL)),
 };
 
 struct stm32_clock_match_data {
-- 
1.9.1
