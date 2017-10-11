From: <gabriel.fernandez@st.com>
Subject: [RESEND PATCH] clk: stm32h7: fix test of clock config
Date: Wed, 11 Oct 2017 08:57:24 +0200
Message-ID: <1507705044-30458-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez@st.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

fix test of composite clock config (bad copy / past)

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
Fixes: 3e4d618b0722 ("clk: stm32h7: Add stm32h743 clock driver")
---
 drivers/clk/clk-stm32h7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32h7.c b/drivers/clk/clk-stm32h7.c
index a94c3f5..61c3e40 100644
--- a/drivers/clk/clk-stm32h7.c
+++ b/drivers/clk/clk-stm32h7.c
@@ -384,7 +384,7 @@ static void get_cfg_composite_div(const struct composite_clk_gcfg *gcfg,
 	mux_ops = div_ops = gate_ops = NULL;
 	mux_hw = div_hw = gate_hw = NULL;
 
-	if (gcfg->mux && gcfg->mux) {
+	if (gcfg->mux && cfg->mux) {
 		mux = _get_cmux(base + cfg->mux->offset,
 				cfg->mux->shift,
 				cfg->mux->width,
@@ -410,7 +410,7 @@ static void get_cfg_composite_div(const struct composite_clk_gcfg *gcfg,
 		}
 	}
 
-	if (gcfg->gate && gcfg->gate) {
+	if (gcfg->gate && cfg->gate) {
 		gate = _get_cgate(base + cfg->gate->offset,
 				cfg->gate->bit_idx,
 				gcfg->gate->flags, lock);
-- 
1.9.1

