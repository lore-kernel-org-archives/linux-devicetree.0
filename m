From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 1/8] clk: Zero init clk_init_data in helpers
Date: Thu, 22 Aug 2019 22:54:19 +0530
Message-ID: <20190822172426.25879-2-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, darren.tsao@bitmain.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fisher.cheng@bitmain.com, alec.lin@bitmain.com, linux-clk@vger.kernel.org, haitao.suo@bitmain.com
List-Id: devicetree@vger.kernel.org

The clk_init_data struct needs to be initialized to zero for the new
parent_map implementation to work correctly. Otherwise, the member which
is available first will get processed.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c  | 2 +-
 drivers/clk/clk-divider.c    | 2 +-
 drivers/clk/clk-fixed-rate.c | 2 +-
 drivers/clk/clk-gate.c       | 2 +-
 drivers/clk/clk-mux.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index b06038b8f658..4d579f9d20f6 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -208,7 +208,7 @@ struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
 			unsigned long flags)
 {
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	struct clk_composite *composite;
 	struct clk_ops *clk_composite_ops;
 	int ret;
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 3f9ff78c4a2a..65dd8137f9ec 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -471,7 +471,7 @@ static struct clk_hw *_register_divider(struct device *dev, const char *name,
 {
 	struct clk_divider *div;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	int ret;
 
 	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index a7e4aef7a376..746c3ecdc5b3 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -58,7 +58,7 @@ struct clk_hw *clk_hw_register_fixed_rate_with_accuracy(struct device *dev,
 {
 	struct clk_fixed_rate *fixed;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	int ret;
 
 	/* allocate fixed-rate clock */
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 1b99fc962745..8ed83ec730cb 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -141,7 +141,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
 {
 	struct clk_gate *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	int ret;
 
 	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 66e91f740508..2caa6b2a9ee5 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -153,7 +153,7 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 {
 	struct clk_mux *mux;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	u8 width = 0;
 	int ret;
 
-- 
2.17.1
