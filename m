From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 01/13] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date: Mon, 17 Dec 2018 10:46:18 +0100
Message-ID: <1545039990-19984-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jorge.ramirez-ortiz@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc: devicetree@vger.kernel.org, heiko@sntech.de, arnd@arndb.de, olof@lixom.net, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, bjorn.andersson@linaro.org, enric.balletbo@collabora.com, vkoul@kernel.org, sibis@codeaurora.org, niklas.cassel@linaro.org, horms+renesas@verge.net.au, georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org, jagan@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
specifications.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 64da032..833436a 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -304,10 +304,16 @@ static struct clk_alpha_pll gpll0_out_main = {
 	},
 };
 
+static const struct pll_vco gpll0_ao_out_vco[] = {
+	{ 800000000, 800000000, 0 },
+};
+
 static struct clk_alpha_pll gpll0_ao_out_main = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.flags = SUPPORTS_FSM_MODE,
+	.vco_table = gpll0_ao_out_vco,
+	.num_vco = ARRAY_SIZE(gpll0_ao_out_vco),
 	.clkr = {
 		.enable_reg = 0x45000,
 		.enable_mask = BIT(0),
-- 
2.7.4
